package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class ApplicationEntryModel extends PageFlowController  {
    
    @Service("VehicleApplicationService")
    def appSvc;

    @Service("QueryService")
    def queryService;

    @Service("DateService")
    def dateSvc;


    def vehicletype;
    def entity;
    def selectedUnit;
    def unitListModel;
    def appTypes = ["NEW", "RENEW"]; 
    def controlno;
    def prevowner;

    
    public String getTitle() {
        return invoker?.caption + " " + vehicletype.title;
    }
    
    @FormId
    public String getFormId() {
        return vehicletype.objid + ":" +entity.apptype +":" + entity.txnmode + ":new"; 
    }
    
    void initNew() {
        entity = [units:[]];
        entity.vehicletypeid = vehicletype.objid;
        entity.vehicletype = vehicletype;
        if( !entity.txnmode ) entity.txnmode = "ONLINE";
        entity.appdate = dateSvc.getBasicServerDate();
    }
    
    def startCapture() {
        initNew();
        appTypes = ["NEW", "RENEW"];        
        entity.appyear = dateSvc.getServerYear();
        entity.txnmode = "CAPTURE";
        return super.start();
    }
    
    def startOnline() {
        initNew();
        entity.apptype = invoker.properties.apptype;
        entity.appyear = dateSvc.getServerYear();
        entity.txnmode = "ONLINE";
        return super.start();
    }
    
    void searchEntry() {
        def fran = appSvc.findByControlNo( [controlno:controlno, vehicletypeid: vehicletype.objid, apptype:entity.apptype] );
        entity.owner = fran.owner;
        entity.units = fran.units;
        entity.franchise = fran.franchise;
    }
    
    public def save() {
        entity = appSvc.create( entity );
    }
    
    public def onComplete() {
        def op =  Inv.lookupOpener("vw_vehicle_application:open", [entity: entity ] );
        op.target = "topwindow";
        return op;
    }
    
    def addUnit() {
        def p = [:];
        p.handler = { o->
            entity.units << [unit: o];
            unitListModel.reload();
        };
        p.vehicletype = vehicletype;
        return Inv.lookupOpener("vehicle_unit:create", p );
    }

    def editUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        def p = [:];
        p.handler = { o->
            if( o.objid ) {
                def m = [_schemaname: 'vehicle_unit'];
                m.findBy = [objid: o.objid ];
                m.putAll( o );
                persistenceSvc.update( m );
            }
            selectedUnit.unit = o;
            unitListModel.reload();
        };
        p.vehicletype = vehicletype;
        def m = [:]
        m.putAll( selectedUnit.unit );
        p.entity = m;
        return Inv.lookupOpener("vehicle_unit:edit", p );
    }
    
    def removeUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        if(!MsgBox.confirm("You are about to remove this entry. Proceed?")) return null;
        entity.units.remove( selectedUnit );
        unitListModel.reload();
    }    
    
    def viewUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        def p = [:];
        p.vehicletype = vehicletype;
        p.entity = selectedUnit.unit;
        return Inv.lookupOpener("vehicle_unit:open", p );
    }
    
    def dropUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        if(!MsgBox.confirm("You are about to drop this unit. Proceed?")) return null;
        if(!entity.droppedunits) entity.droppedunits  = [];
        entity.units.remove( selectedUnit );
        entity.droppedunits << selectedUnit;
        unitListModel.reload();
    }
    
    def changeUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        if(!selectedUnit.objid) throw new Exception("Selected Unit must have an objid");
        if(!entity.droppedunits) entity.droppedunits  = [];
        def p = [:];
        p.handler = { o->
            entity.units << [unit: o];
            entity.units.remove( selectedUnit );
            entity.droppedunits << selectedUnit;
            unitListModel.reload();
        };
        p.vehicletype = vehicletype;
        p.entity = [:];
        return Inv.lookupOpener("vehicle_unit:edit", p );
    }
    
    def undropUnit() {
        
    }
    
    def revertChange() {
        
    }

    def changeOwner() {
        if(!prevowner) prevowner = entity.owner;
        def p = [:];
        p.onselect = { o->
            if(o.objid == prevowner.objid)
                throw new Exception("Please select another owner not the same as current owner ");
            entity.owner = o;
            binding.refresh("entity.owner.*");
        };
        return Inv.lookupOpener("entity:lookup", p ); 
    }    
    
    def getLookupFranchise() {
        MsgBox.alert('apptype = '+ entity.apptype); 
        def p = [:];
        p.onselect = { o->
            entity.franchise = o;
            binding.refresh("entity.franchise");
        };
        p.query = [ vehicletypeid: vehicletype.objid ];    
        return Inv.lookupOpener("vehicle_franchise:available:lookup", p );
    }

    
}