package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.util.*;
import com.rameses.osiris2.client.*;


public class VehicleTypeFieldModel extends CrudFormModel {
    
    def dataTypes = ["text", "integer","decimal","date", "boolean"];
    
    public void afterCreate() {
        entity.vehicletypeid = caller.entity.objid;
        entity.textwidth = 0;
    }
    
    public void beforeSave(def mode) {
        entity.name = entity.name.replaceAll("\\s","");
        if(!entity.objid) entity.objid = entity.vehicletypeid +"-"+entity.name;
    }
    
}