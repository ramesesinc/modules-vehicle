package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*; 
import com.rameses.treasury.common.models.*; 
import com.rameses.osiris2.client.*
import com.rameses.osiris2.common.*
import com.rameses.seti2.models.*;
import com.rameses.rcp.framework.ClientContext;
import com.rameses.util.*;
import com.rameses.common.*;
import com.rameses.rcp.constant.*;

public class VehicleFormReportModel extends FormReportModel {
    
    def entity;
    def vehicletype;
    
    String reportPath = "com/rameses/gov/etracs/vehicle/reports/"; 
    String _reportName;
    
    boolean allowSave = false;
    boolean allowPrint = true;
    
    def getQuery() {
        if( !entity ) entity = caller.entity;
        return [objid: entity.objid];
    }
    
    public String getReportName() {
        return _reportName;
    }
    
    def preview(def inv) {
        if( inv.properties.allowPrint ) {
            def a = ExpressionResolver.getInstance().evalBoolean(inv.properties.allowPrint,[entity:entity, task:caller.task]);
            allowPrint = a;
        }
        
        vehicletype = caller.vehicletype.objid;
        String reportType = inv.properties.reportType;
        
        _reportName = reportPath + vehicletype + "_" + reportType +".jasper"; 
        def r = getClass().classLoader.getResource( _reportName );
        if(!r) {
            _reportName = reportPath + "vehicle_" + reportType + ".jasper";             
        }
        return super.preview();
    }
    
}