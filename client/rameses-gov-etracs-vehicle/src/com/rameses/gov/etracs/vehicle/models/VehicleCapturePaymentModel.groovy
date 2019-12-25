package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class VehicleApplicationEditModel {
    
    @Service(value="VehicleApplicationService")
    def appSvc;
    
    def handler;
    def entity;
    def vehicletype;
    def appTypes = ["NEW", "RENEW", "CHANGE_UNIT", "CHANGE_OWNER", "CHANGE_OWNER_UNIT", "DROP"]; //this is a dummy routine to fix combo error
    def apptype;
    
    boolean editableUnit = false;
    boolean editableAccount = false;
    
    void init() {
        if(entity.txnmode=="CAPTURE" || apptype.matches("NEW|CHANGE_UNIT|CHANGE_OWNER_UNIT") ) {
            editableUnit = true;
        }
        if(entity.txnmode=="CAPTURE" || apptype.matches("NEW|CHANGE_OWNER|CHANGE_OWNER_UNIT") ) {
            editableAccount = true;
        }        
    }
    
    public def save() {
        //if(!MsgBox.confirm("You are about to update this application. Proceed?")) return;
        appSvc.updateApplication(entity);
        handler();
        return "_close";
    }
    
    public def cancel() {
        handler();
        return "_close";
    }
    
}