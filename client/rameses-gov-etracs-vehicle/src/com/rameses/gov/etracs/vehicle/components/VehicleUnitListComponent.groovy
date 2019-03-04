package com.rameses.gov.etracs.vehicle.components;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

class VehicleUnitListComponent extends ComponentBean {

    @Service(value="QueryService", connection="vehicle")
    def queryService;
    
    @Service(value="SchemaService", connection="vehicle")
    def schemaSvc;
    
    @Service(value="PersistenceService", connection="vehicle")
    def persistenceSvc;
    
    def fields;
    def vehicletype;
    def items = [];
    
    void buildColumns() {
        fields = [];
        if( !vehicletype.allowedfields ) throw new Exception("Error in opening application form. vehicletype allowed fields must not be null");
        schemaSvc.getSchema( [name:"vehicle_unit" ] )?.fields.collect{
            if(!it.included) return;
            def n = it.name;
            if(n.contains("_")) n = it.name.split("_")[0];
            if( n.matches(vehicletype.allowedfields)) {
                it.name = "unit."+it.name;
                fields << it;
            }
        };
    }
    
    def unitListModel = [
        getColumnList: {
            if(!fields) buildColumns();
            return fields;
        },
        fetchList : { o->
            return items;
        }
    ] as BasicListModel;
    
}