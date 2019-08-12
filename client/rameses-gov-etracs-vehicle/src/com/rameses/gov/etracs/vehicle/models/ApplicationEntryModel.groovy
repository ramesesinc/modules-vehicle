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
    def apptype;
    
    def units = [];
    def droppedunits = [];
    
    public String getTitle() {
        return invoker?.caption + " " + vehicletype.title;
    }
    
    @FormId
    public String getFormId() {
        return vehicletype.objid + ":" +entity.apptype +":" + entity.txnmode + ":new"; 
    }
    
    void initNew() {
        entity = [:];
        entity.vehicletypeid = vehicletype.objid;
        entity.vehicletype = vehicletype;
        if( !entity.txnmode ) entity.txnmode = "ONLINE";
        entity.appdate = dateSvc.getBasicServerDate();
    }
    
    def startCapture() {
        initNew();
        appTypes = ["NEW", "RENEW"];        
        entity.txnmode = "CAPTURE";
        return super.start();
    }
    
    def startOnline() {
        initNew();
        apptype = invoker.properties.apptype;
        entity.appyear = dateSvc.getServerYear();
        entity.txnmode = "ONLINE";
        return super.start();
    }
    
    def getLookupFranchise() {
        def p = [:];
        p.onselect = { o->
            entity.franchise = o;
            binding.refresh("entity.franchise");
        };
        p.query = [ vehicletypeid: vehicletype.objid ];    
        return Inv.lookupOpener("vehicle_franchise:available:lookup", p );
    }
    
    void searchEntry() {
        def fran = appSvc.findByControlNo( [controlno:controlno, vehicletypeid: vehicletype.objid, apptype:apptype] );
        entity.owner = fran.owner;
        entity.geninfoid = fran.geninfoid;
        entity.franchise = fran;
        if( apptype == 'RENEW') {
            entity.franchiseyearid = null;
            entity.prevappid = fran.appid;
            entity.prevyear = fran.year;
        }
        else if( apptype == 'CHANGE_OWNER') {
            entity.franchiseyearid = fran.currentyearid;
            entity.geninfoid = null;
            entity.prevowner = entity.owner;
            entity.owner = null;
        }
        else {
            entity.franchiseyearid = fran.currentyearid;            
        }
        units = fran.units; 
    }
    
    
    
    public def onComplete() {
        def op =  Inv.lookupOpener("vw_vehicle_application:open", [entity: entity ] );
        op.target = "topwindow";
        return op;
    }
    
    def addUnit() {
        def p = [:];
        p.handler = { o->
            units << [unit: o];
            unitListModel.reload();
        };
        p.vehicletype = vehicletype;
        return Inv.lookupOpener("vehicle_unit:create", p );
    }

    def editUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        def lineId = selectedUnit.objid;
        def p = [:];
        p.handler = { o->
            if( lineId !=null ) {
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
        if(selectedUnit.objid) throw new Exception("Cannot remove unit. This unit already exists");
        if(!MsgBox.confirm("You are about to remove this entry. Proceed?")) return null;
        units.remove( selectedUnit );
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
        
        units.remove( selectedUnit );
        droppedunits << selectedUnit;
        unitListModel.reload();
    }
    
    def undropUnit() {
        
    }
    
    def revertChange() {
        
    }
    
    def addAssessment( def fromyear, def toyear ) {
        entity.assessments = [];
        if(toyear!=null) {
            int fyear = fromyear.toInteger();
            int tyear = toyear.toInteger();
            (fyear..toyear).each {
                entity.assessments << [year: it, state: 'PENDING' ];
            }
        }
        else {
            entity.assessments << [year: fromyear, state: 'PENDING' ];
        }
    }
    
    public def save() {
        entity.units = [];
        entity.droppedunits = [];
        entity.assessments = [];
        if(entity.txnmode!='CAPTURE') {
            entity.apptype = apptype;
        }
        if( entity.txnmode == "CAPTURE") {
            entity.units = units;
        }
        else if( entity.apptype == 'NEW' ) {
            entity.units = units;
            addAssessment( entity.appyear, null );
        }
        else if(entity.apptype == 'RENEW' ) {
            units.each {
                entity.units << [ unit: it.unit ];
            }
            addAssessment( entity.prevyear, entity.appyear );
        }
        else if( entity.apptype == 'CHANGE_UNIT') {
            units.each {
                if(!it.objid) {
                    entity.units << [unit: it.unit ];
                }
            }
            droppedunits.each {
                entity.droppedunits << [ appunitid: it.objid ];
            }
            addAssessment( entity.appyear, null );
        }
        else {
            addAssessment( entity.appyear, null );            
        }
        entity = appSvc.create( entity );
    }
    
    
}