package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;

class CommonVehicleListModel extends CrudListModel {

    def vehicletype;
    
    @PropertyChangeListener
    def listener = [
        "vehicletype" : { o->
            reload();
        }
    ];
    
    public def getCustomFilter() {
        if( !vehicletype?.objid ) return ["1=0"];
        return ["vehicletypeid = :vid", [vid: vehicletype.objid] ]; 
    }
    
} 