package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.util.*;
import com.rameses.osiris2.client.*;


public class VehicleTypeFieldModel extends CrudFormModel {
    
    def dataTypes = ["text", "integer","decimal","date", "boolean", "longtext"];
    
    public void afterCreate() {
        entity.vehicletypeid = caller.entity.objid;
    }
    
    public void beforeSave(def mode) {
        if(!entity.objid) entity.objid = entity.vehicletypeid +"-"+entity.name;
    }
    
}