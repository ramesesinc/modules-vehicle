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
    
    def listHandler;
    
    void afterCreate() {
        entity.vehicletype = caller.vehicletype;
    }
    
    def addFranchise() {
        def p = [:];
        p.put("query.vehicletypeid", entity.vehicletype.objid);
        p.onselect = { o->
            def m = [_schemaname:"vehicle_driver_franchise"];
            m.driverid = entity.objid;
            m.franchiseid = o.objid;
            m.franchise = [objid: o.objid];
            persistenceService.create( m );
            listHandler.reload();
        }
        return Inv.lookupOpener("vehicle_franchise:active:lookup", p)
    }
    
}