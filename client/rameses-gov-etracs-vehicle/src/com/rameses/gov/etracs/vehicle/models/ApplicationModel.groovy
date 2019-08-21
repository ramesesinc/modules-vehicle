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
    
    @Service(value="VehicleApplicationService")
    def appSvc;
    
    @Service("VehicleAssessmentService")
    def assmtSvc;

    //boolean viewReportAllowed = true; 
    def selectedUnit;
    def unitHandler;
    def infos;
    def total = 0;
    
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
        return (task.state == 'assessment' && task?.assignee?.objid ==  user.objid);
    }
    
    def getShowBillingAction() {
        return (task.state != 'draft')
    }
    
    def getShowIssuePermitAction() {
        return (entity.permitid == null) &&  (task.state == 'release' || entity.txnmode == 'CAPTURE' );
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
 
    //ASSESSMENT AND BILLING FACILITIES
    def feeListModel = [
        fetchList: { o->
            def items = assmtSvc.getItems([appid: entity.objid ] );
            total = items.sum{ it.amount };
            binding.refresh("total");
            return items;
        }
    ] as BasicListModel;
    
    void assess() {
        def p = [:];
        p.params = [appid : entity.objid ]
        p.handler = { o->
            feeListModel.reload();
        }
        Modal.show( "vehicle_assessment_rule", p );
    }
    
    def viewBill() {
        def h =[:];
        h.put("query.appid", entity.objid);
        return Inv.lookupOpener("vehicle_billing", h );
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
    
    //PERMITTING FACILITIES
    def viewPermit() { 
        def h =   entity.vehicletype.permithandler;
        if(!h) h = "vehicle_basic_permit";
        def p = [:];
        p.put("query.appid", entity.objid );
        p.put("query.permitid", entity.permitid );
        p.put("query.vehicletype", entity.vehicletype.objid );
        def opener = Inv.lookupOpener(h, p );
        opener.target = "self";
        return opener;
    }
    
    def issuePermit() {
        def h = { pmt->
            entity.permitid = pmt.objid;
            entity.permit = pmt;
            binding.refresh();
        }
        return Inv.lookupOpener("permit_issuance", [handler: h, app:entity]);
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