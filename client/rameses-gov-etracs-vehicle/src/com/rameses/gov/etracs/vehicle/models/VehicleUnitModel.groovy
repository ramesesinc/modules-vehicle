package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleUnitModel  {
    
    @Binding
    def binding;

    def vehicletype;
    def mode; 
    def entity;
    def handler;

    public void create() {
        entity = [:];
        mode = "create";
    }

    public void edit() {
        mode = "edit";
    }
    
    public void open() {
        mode = "read";
    }

    def doOk() {
        if(handler) handler( entity );
        return "_close";
    }

    def doCancel() {
        return "_close";
    }

}