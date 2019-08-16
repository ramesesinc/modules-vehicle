package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleDriverModel extends CrudFormModel  {
    
    @Caller
    def caller;
    
    void afterCreate() {
        entity.vehicletype = caller.vehicletype;
    }
    
    def viewUnit() {
        return Inv.lookupOpener("vehicle_unit:open", [ entity: entity.unit.unit, vehicletype: entity.vehicletype ] );
    }
    
}