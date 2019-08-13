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
    
    @Binding
    def binding;
    
    def entity;
    def task;
    def total = 0;
    
    void init() {
        entity = caller.entity;
        task = caller.task
    }

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
    
}