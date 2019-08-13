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
    
    @Service(value="VehicleApplicationService")
    def appSvc;

    //boolean viewReportAllowed = true; 
    def selectedUnit;
    def unitHandler;
    def infos;
    
    String getFormName() {
        return getSchemaName() + ":form";
    }
    
    String getBarcodeFieldname() {
        return "appno";
    }
    
    public String getTitle() {
        return entity.appno + ((task?.objid!=null ) ? " [" + task?.title + "]" : "") ;
    }
    
    public String getWindowTitle() {
        return entity.appno;
    }
    
    public String getFormId() {
        return entity.objid;
    }

    /***************************************************************************
    The following are workflow state properties that is included in design time
    ***************************************************************************/
    def getShowAssessAction() {
        if(! task?.properties?.show_assess) return false;
        return task.properties.show_assess;
    }
    
    def getShowIssuePermitAction() {
        if(! task?.properties?.show_issue_permit) return false;
        return task.properties.show_issue_permit;
    }
    
    void afterOpen() {
        infoListModel.reload();
    }
    
    def infoListModel = [
        fetchList: { o->
            def m = [_schemaname: "vehicle_application_info"];
            m.findBy = [appid: entity.objid ];
            m.orderBy = "sortorder";
            infos = queryService.getList(m);
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
 
    /*
    public boolean beforeSignal( def tsk ) {
        if(tsk.taskstate == "assessment") {
            if( feeList == null ) loadFees();
            if(feeList.size() == 0 ) {
                if( !MsgBox.confirm("There are no fees assessed. Proceed to continue?") ) return false;
            }
        }
        return true;
    }
    */
    
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
                [name:'permitno', caption:'Permit No'],
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

    def viewUnit() {
        if(!selectedUnit) throw new Exception("Please select a unit");
        def p = [:];
        p.vehicletype = entity.vehicletype;
        p.entity = selectedUnit.unit;
        return Inv.lookupOpener("vehicle_unit:open", p );
    }
    
    def cancelApplication() {
        if(!MsgBox.confirm("You are about to cancel this application. Proceed?")) return;
        appSvc.cancelApplication([appid: entity.objid]);
        return "_close";
    }
    
    void setRenewalDate() {
        def renewaldate = appSvc.setRenewalDate( [appid: entity.objid ] );
        entity.renewaldate = renewaldate;
        binding.refresh();
    }
    
}