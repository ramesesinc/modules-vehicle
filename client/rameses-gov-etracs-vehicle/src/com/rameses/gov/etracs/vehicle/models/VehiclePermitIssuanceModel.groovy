package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class VehiclePermitIssuanceModel {
    
    @Service(value="VehiclePermitService")
    def permitSvc;
    
    def handler;
    def app;
    def entity;
    
    void init() {
        entity = [:];
        entity.appid = app.objid;
    }
    
    def doOk() {
        entity.txnmode = app.txnmode;
        def pmt = permitSvc.create( entity );
        handler( pmt );
        return "_close";
    }
    
    def doCancel() {
        return "_close";
    }
    
}