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

public class VehiclePermitFormReportModel extends FormReportModel {
    
    def entity;
    def vehicletype;
    def template;
    
    String reportPath = "com/rameses/gov/etracs/vehicle/reports/"; 
    String _reportName;
    
    def getQuery() {
        if( !entity ) entity = caller.entity;
        return [permitid: entity.permit.objid];
    }
    
    public String getReportName() {
        return _reportName;
    }
    
    def preview() {
        vehicletype = caller.vehicletype.objid;
        template = caller.vehicletype.permithandler;
        if(!template) template = "vehicle_permit"
        _reportName = reportPath + template + ".jasper";
        if( !caller.entity.permit ) throw new Exception("Permit not issued");
        return super.preview();
    }
    
}