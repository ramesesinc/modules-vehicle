package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class ApplicationModel extends WorkflowTaskModel {
    
    @Service(value="VehiclePermitService")
    def permitSvc;

    boolean viewReportAllowed = true; 
    def selectedUnit;
    def unitHandler;
    
    String getFormName() {
        return getSchemaName() + ":form";
    }
    
    String getBarcodeFieldname() {
        return "appno";
    }
    
    public String getTitle() {
        String state = task?.title;
        if( !state ) state = "";
        else state = " [" + task?.title + "]";
        return entity.appno + state ;
    }
    
    public String getWindowTitle() {
        return entity.appno;
    }
    
    public String getFormId() {
        return entity.objid;
    }

    void afterOpen() {
        feeListModel.reload(); 
        infoListModel.reload(); 
    }
    
    def feeListModel = [
        fetchList: { o->
            def m = [_schemaname: "vehicle_application_fee"];
            m.findBy = [appid: entity.objid ];
            //m.orderBy = "year,month,sortorder";
            return queryService.getList(m);
        }
    ] as BasicListModel;
    
    def infoListModel = [
        fetchList: { o->
            def m = [_schemaname: "vehicle_application_info"];
            m.findBy = [appid: entity.objid ];
            m.orderBy = "sortorder";
            def infos = queryService.getList(m);
            infos.each {
                it.putAll( it.remove("variable") );
                if( it.stringvalue ) it.value = it.stringvalue;
                else if( it.intvalue ) it.value = it.intvalue;
                else if( it.decimalvalue ) it.value = it.decimalvalue;
                else if( it.booleanvalue ) it.value = it.booleanvalue;
            }
            return infos;
        }
    ] as BasicListModel;


    void viewTrackingno() {
        Modal.show( "show_vehicle_trackingno", [appno: entity.appno] );
    }
 
    void assessWithLateRenewal() {
        boolean bstop = false;
        boolean infoloaded = false;
        int startYr = entity.prevappyear + 1;
        int endYr = entity.appyear;
        def localInfos = null;
        ( startYr .. endYr ).each {
            if( bstop ) return;
            def app = [:];
            app.putAll( entity );
            app.appyear = it;
            app.fromyear = startYr;
            app.toyear = endYr;
            def p = [:];
            p.rulename = "vehicleassessment"
            p.params = [application: app ];
            p.include_items = true;
            p.include_billitems = false;
            p.connection = "vehicle";
            if(infos) {
                p.defaultInfos = infos;
                p.infos = localInfos;
            }
            p.handler = { result->
                if( result == null || result == "_close" ) {
                    bstop = true;
                    return;
                }
                if(!infoloaded) {
                    infoloaded = true;
                    loadInfos();
                    localInfos = infos;
                }
            }
            try {
                Modal.show( "billing_rule", p );
            }
            catch(BreakException be) {;}
        }
        if( bstop ) return;
        feeListModel.reload(); 
        infoListModel.reload(); 
        binding.refresh("entity.amount");        
    }
    
    void assessBasic() {
        def p = [:];
        p.rulename = "vehicleassessment";
        p.connection = "vehicle";
        p.params = [application: entity ];
        p.include_items = true;
        p.include_billitems = false;
        if(infos) p.defaultInfos = infos;
        p.handler = { result->
            if( result !=null && result!='_close' ) { 
                feeListModel.reload(); 
                infoListModel.reload(); 
                binding.refresh("entity.amount");                
            }
        }
        Modal.show( "billing_rule", p );
    }

    void assess() {
        if( entity.apptype == 'RENEW' && entity.prevappyear && ((entity.prevappyear + 1) < entity.appyear )) {
            if(! MsgBox.confirm("This is subject for late renewal assessments from " + (entity.prevappyear+1) + ". Proceed?" )) return;
            assessWithLateRenewal();
        }
        else {
            assessBasic();            
        }
    }
    
    public boolean beforeSignal( def tsk ) {
        if(tsk.taskstate == "assessment") {
            if( feeList == null ) loadFees();
            if(feeList.size() == 0 ) {
                if( !MsgBox.confirm("There are no fees assessed. Proceed to continue?") ) return false;
            }
        }
        return true;
    }
    
    //PRINTOUTS
    def viewPermit() { 
        def m = [:];
        m.vehicletype = entity.vehicletype;
        m.permitid = entity.permitid;
        m.query = [permitid: entity.permitid];
        
        def pname = "vehicle:"+entity.vehicletype.objid+":print";        
        def opener = null;
        try {
            opener = Inv.lookupOpener( pname, m );
        }catch(e){;}
        
        if(!opener) opener = Inv.lookupOpener('vehicle_permit:print',m);
        opener.target = 'self'; 
        return opener;
    }
    
    void issuePermit() {
        if(entity.txnmode == 'CAPTURE' ) {
            def p = [:]
            p.fields = [
                [name:'permitno', caption:'Permit No', required: true],
                [name:'permittype', type:'lov', caption:'Permit Type', listName: 'VEHICLE_PERMIT_TYPE', required: true],                
                [name:'dtissued', type:'date', caption:'Date Issued', required: true],
            ];
            p.data = [:];
            p.handler = { o->
                def pmt = [appid: entity.objid];
                pmt.putAll( o );
                pmt.txnmode = "CAPTURE";
                pmt = permitSvc.create( pmt );
                entity.permitid = pmt.objid;
                entity.permit = pmt;
                binding.refresh("entity.permit.*");
            }
            Modal.show("dynamic:form", p, [title:'Enter Permit Details']);
        }
        else {
            def pmt = [appid: entity.objid];
            pmt.txnmode = 'ONLINE';
            pmt = permitSvc.create( pmt );
            entity.permitid = pmt.objid;
            entity.permit = pmt;
            binding.refresh("entity.permit.*");
        }
    }

    def checkUnit() {
        def p = [:];
        p.handler = { o->
            entity.units << [unit: o];
            unitHandler.reload();
        };
        p.vehicletype = entity.vehicletype;
        return Inv.lookupOpener("vehicle_unit:create", p );
    }    
    
    def printApplication() {
        MsgBox.alert("print application")
    }
    
    
}