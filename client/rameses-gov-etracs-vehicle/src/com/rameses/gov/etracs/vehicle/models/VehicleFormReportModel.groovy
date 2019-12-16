package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*; 
import com.rameses.treasury.common.models.*; 
import com.rameses.osiris2.client.*
import com.rameses.osiris2.common.*
import com.rameses.util.*;
import com.rameses.seti2.models.*;
import com.rameses.rcp.framework.ClientContext;

public class VehicleFormReportModel extends FormReportModel {
    
    def entity;
    def vehicletype;
    
    String reportPath = "com/rameses/gov/etracs/vehicle/"; 
    String _reportName;
    
    def getQuery() {
        if( !entity ) entity = caller.entity;
        return [objid: entity.objid];
    }
    
    public String getReportName() {
        return _reportName;
    }
    
    def preview(def inv) {
        vehicletype = caller.vehicletype.objid;
        _reportName = reportPath + vehicletype + "/reports/vehicle_assessment.jasper"; 
        def r = getClass().classLoader.getResource( _reportName );
        if(!r) {
            _reportName = reportPath + "/reports/vehicle_assessment.jasper";             
        }
        return super.preview();
    }
    
}