package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;

class VehicleFranchiseListModel extends CrudListModel {

    @Service("VehicleFranchiseService")
    def ctrlSvc;

    def vehicleTypeList;
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
    
    
    def create() {
        if(!vehicletype)
            throw new Exception("Please select a vehicle type");
            
        def q = MsgBox.prompt( "Please enter no. of units to issue");
        if(!q) return; 
        query.qty = q;
        query.vehicletype = vehicletype.objid;
        ctrlSvc.generate(query);
        reload();
    }
    
} 