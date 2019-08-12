package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleAssessmentModel  {
    
    @Service("VehicleAssessmentService")
    def assmtSvc;
    
    @Service("QueryService")
    def qrySvc;
    
    @Caller
    def caller;
    
    def entity;
    def task;
    def assessments;
    def selectedItem;
    int assessmentSize;
    
    void init() {
        entity = caller.entity;
        task = caller.task
        def m = [_schemaname: 'vehicle_assessment' ];
        m.findBy = [ appid: entity.objid ];
        m.orderBy = "year DESC";
        assessments = qrySvc.getList( m );
        assessmentSize = assessments.size();
        selectedItem = assessments[0];
    }

    def assessmentModel = [
        fetchList: { o->
            return assessments;
        },
        onselect: { o->
            feeListModel.reload();
        }
    ] as ListPaneModel;
        
    def feeListModel = [
        fetchList: { o->
            def m = [_schemaname: "vehicle_assessment_item"];
            m.findBy = [parentid: selectedItem.objid ];
            //m.orderBy = "year,month,sortorder";
            def list = qrySvc.getList(m);
            selectedItem.amount = list.sum{it.amount};
            return list;
        }
    ] as BasicListModel;
    
    /*
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
    */
    
    void assess() {
        assmtSvc.assess( [appid: entity.objid ] );
        feeListModel.reload();
    }
    
    
}