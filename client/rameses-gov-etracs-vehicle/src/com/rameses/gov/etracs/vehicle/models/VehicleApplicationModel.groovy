package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class VehicleApplicationModel extends WorkflowTaskModel {
    
    @Service(value="VehicleApplicationService")
    def appSvc;
    
    @Service("VehicleAssessmentService")
    def assmtSvc;
    
    @Service("SchemaService")
    def schemaSvc;
    
    
    //boolean viewReportAllowed = true; 
    def total = 0;
    def formControls = [];
    def vehicletype;
    
    String getFormName() {
        return getSchemaName() + ":form";
    }
    
    String getBarcodeFieldname() {
        return "appno";
    }
    
    public String getTitle() {
        return entity.appno + " [" + task?.state?.toUpperCase() + "]" ;
    }
    
    public String getWindowTitle() {
        return entity.appno;
    }
    
    public String getFormId() {
        return entity.objid;
    }

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
    
    def issuePermit() {
        def h = { pmt->
            entity.permit = pmt;
            binding.refresh();
        }
        return Inv.lookupOpener("vehicle_permit_issuance", [handler: h, app:entity]);
    }

    def cancelApplication() {
        if(!MsgBox.confirm("You are about to cancel this application. Proceed?")) return;
        appSvc.cancelApplication([appid: entity.objid]);
        return "_close";
    }
    
    void afterOpen() {
        vehicletype = entity.franchise.vehicletype;
        if(entity.total) total = entity.total;
        buildControls();
    }
    
    void buildControls() {
        formControls.clear();
        def schemaFields = schemaSvc.getSchema( [name: "vehicle_unit"] ).fields;
        def arr = vehicletype.allowedfields.split("\\|");
        def xfields = [];
        arr.each {
            xfields << it;
        }
        xfields.unique().each { fname->
            def fld = schemaFields.find{ it.name == fname };
            if( fld ) {
                def dt = [caption: fld.caption, name: 'entity.unit.'+fld.name, type:fld.type ];
                if(!dt.type) dt.type = "text";
                if(fld.width) 
                    dt.width = fld.width.toInteger()*2;
                else
                    dt.width = 100;
                dt.enabled = false;
                dt.captionWidth = 150;
                formControls << dt;
            }
        }
    }

    
    
}