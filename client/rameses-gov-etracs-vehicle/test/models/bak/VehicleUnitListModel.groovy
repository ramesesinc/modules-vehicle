package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.util.*;

class VehicleUnitListModel extends CrudListModel {

    @Service("DateService")
    def dateSvc;
    
    def year;

    @PropertyChangeListener
    def listener = [
        "year": { o->
            reload();
        }
    ]
    
    void afterInit() {
        year = dateSvc.getServerYear();
    }
    
    def open() {
        def op = Inv.lookupOpener("vw_vehicle_unit:open", [ entity: selectedItem ] );
        op.target = "popup";
        return op;
    }
    
    def getCustomFilter() {
        return ["vehicletype.objid =:typeid AND year=:yr", [typeid: caller.vehicletype.objid, yr: year]];
    }
    
} 