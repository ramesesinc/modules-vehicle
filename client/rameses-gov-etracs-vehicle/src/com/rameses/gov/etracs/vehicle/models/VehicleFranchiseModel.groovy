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
    
    def formControls;
    
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

    void afterOpen() {
        if(!vehicletype.allowedfields) 
            throw new Exception("Please configure allowed fields in vehicletype")
        formControls = [];
        def schemaFields = schemaSvc.getSchema( [name: "vehicle_unit"] ).fields;
        def arr = vehicletype.allowedfields.split("\\|");
        def xfields = [];
        arr.each {
            xfields << it;
        }
        xfields.unique().each { fname->
            def fld = schemaFields.find{ it.name == fname };
            if( fld ) {
                def dt = [caption: fld.caption, name: 'entity.unit.'+fld.name, type:fld.type ];
                if(!dt.type) dt.type = "text";
                if(fld.width) 
                    dt.width = fld.width.toInteger()*2;
                else
                    dt.width = 100;
                dt.enabled = false;
                dt.captionWidth = 150;
                formControls << dt;
            }
        }
        
    }
    
}