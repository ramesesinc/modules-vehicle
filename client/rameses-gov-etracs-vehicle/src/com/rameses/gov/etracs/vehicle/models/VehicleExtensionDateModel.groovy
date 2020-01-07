package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleExtensionDateModel extends CrudFormModel   {

    def month;
    def vehicletype;
    
    void afterInit() {
        vehicletype = caller.vehicletype;
    }

    void afterCreate() {
        entity.vehicletypeid = vehicletype.objid;
    }
    
}