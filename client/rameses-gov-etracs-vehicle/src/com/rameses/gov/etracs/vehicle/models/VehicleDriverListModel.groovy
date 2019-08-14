package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.seti2.models.*;

public class VehicleDriverListModel extends CrudListModel {
    
    def vehicletype;

    public String getTitle() {
        return vehicletype.title + " Driver list";
    }
 
    public def getCustomFilter() {
        return ["vehicletypeid = :id", [id:  vehicletype.objid ] ];
    }
    
}