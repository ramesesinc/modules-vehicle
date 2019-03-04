package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.seti2.models.*;
import com.rameses.osiris2.common.*;
import com.rameses.util.*;
import com.rameses.osiris2.common.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class VehicleFranchiseModel extends CrudFormModel {
    
    @Service("SchemaService")
    def schemaSvc;
    
    public String getTitle() {
        return entity.controlno ;
    }
    
    public String getWindowTitle() {
        return entity.controlno;
    }
    
    public String getFormId() {
        return entity.objid;
    }
    
    def getQuery() {
        return [objid: entity.objid ];
    }
    
    def getVehicletype() {
        return entity.vehicletype;
    }

    def fields;
    void afterOpen() {
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
            return fields;
        },
        fetchList : { o->
            def m = [_schemaname: "vw_vehicle_franchise_unit_active" ];
            m.findBy = [ franchiseid: entity.objid ];
            return queryService.getList( m );
        }
    ] as BasicListModel;
}