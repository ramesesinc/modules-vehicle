package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleApplicationInitialModel   {
    
    @Service("VehicleApplicationService")
    def appSvc;

    @Service("DateService")
    def dateSvc;
    
    @Service("SchemaService")
    def schemaSvc;
    
    @Service("QueryService")
    def querySvc;

    @Invoker 
    def invoker;
    
    @Binding
    def binding;
    
    def mode = "initial";
    def owner;
    def searchOption = "controlno";
    def vehicletype;
    def entity;
    def appTypes = ["NEW", "RENEW", "CHANGE_UNIT", "CHANGE_OWNER", "CHANGE_OWNER_UNIT"]; 
    def controlno;
    def apptype;
    
    boolean editableUnit = true;
    boolean editableAccount = true;
    
    def franchise;
    
    public String getTitle() {
        return invoker?.caption + " " + vehicletype.title + " Initial";
    }
    
    @FormId
    public String getFormId() {
        return vehicletype.objid + ":" +entity.apptype +":" + entity.txnmode + ":new"; 
    }
    
    @PropertyChangeListener
    def listener = [
        "entity.account.owner" : { o->
            entity.account.contact.phoneno = o.phoneno;
            entity.account.contact.mobileno = o.mobileno;
            entity.account.contact.email = o.email;
            binding.refresh("entity.account.contact.(phoneno|mobileno|email)");
        },
        "apptype" : { o->
            entity.apptype = o;
        },
        "entity.appdate" : { o->
            def r = dateSvc.getServerDate();   
            entity.appyear = r.appyear;
            binding.refresh("entity.appyear");
        }
    ]

    void initNew(def tmode) {
        entity = [:];
        entity.unit = [:];        
        entity.account = [contact:[:]];
        entity.txnmode = tmode;
        apptype = invoker.properties.apptype;
        entity.apptype = apptype;
        mode = "initial";
        if(tmode!="CAPTURE") {
            if( !apptype.matches("NEW|CHANGE_UNIT|CHANGE_OWNER_UNIT") ) editableUnit = false;
            if( !apptype.matches("NEW|CHANGE_OWNER|CHANGE_OWNER_UNIT") ) editableAccount = false;            
        }
    }

    def startCapture() {
        initNew("CAPTURE");
        entity.apptype = "NEW";
        return mode;
    }
    
    def startNew() {
        initNew("ONLINE");
        entity.appdate = dateSvc.getServerDate();
        entity.unit = [:];
        entity.appyear = dateSvc.getServerYear();
        return mode;
    }
    
    def startSearch() {
        initNew("ONLINE");
        appTypes << "DROP";
        mode = "search";
        return mode;
    }
    
    def doNext() {
        def o = searchFranchise();
        if(o==null) {
            return null;
        }
        entity.franchise = o;
        entity.appyear = o.remove("appyear");
        entity.appdate = o.remove("appdate");        
        entity.account = o.remove("account");
        entity.unit = o.remove("unit");
        entity.apptype = apptype;
        if( apptype.matches("CHANGE_UNIT|CHANGE_OWNER_UNIT") ) {
            entity.unit = [:];
        };
        if( apptype.matches("CHANGE_OWNER|CHANGE_OWNER_UNIT") ) {
            entity.account = [:];
            entity.account.owner = [:];
            entity.account.contact = [:];            
        };
        mode = "initial";
        return mode;
    }
    
    def searchFranchise() {
        if( searchOption == "owner" ) {
            controlno = null;
            def p = [:];
            p.put("query.ownerid", owner.objid );
            p.put("query.vehicletypeid", vehicletype.objid );
            p.onselect = { o->
                controlno = o.objid;
                return "_close";
            }
            Modal.show("vehicle_franchise:byowner:lookup", p );
        }
        if(!controlno) return null;
        return appSvc.findControlNoForApplication( [controlno: controlno, apptype: apptype ] );
    }

    def getLookupFranchise() {
        def p = [:];
        p.query = [ vehicletypeid: vehicletype.objid ];    
        return Inv.lookupOpener("vehicle_franchise:available:lookup", p );
    }
    
    public def save() {
        if(!MsgBox.confirm("You are about to save this entry. Proceed?")) return ;        
        entity = appSvc.create( entity );
        def op =  Inv.lookupOpener("vehicle_application:open", [entity: entity ] );
        op.target = "topwindow";
        return op;
    }
    
    
    
}