package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.treasury.common.models.*;

public class VehicleAssessmentRuleModel extends BillingRuleModel  {
    
    @Service("VehicleAssessmentService")
    def assessmentSvc;

    public def getRuleExecutor() {
        return assessmentSvc; 
    }
    
    void init() {
        rulename =  "vehicleassessment";   
        super.init();
    }
    
}