package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class VehicleUnitModel  {
    
    @Binding
    def binding;

    def vehicletype;
    def mode; 
    def entity;
    def handler;
    
    @Service("SchemaService")
    def schemaSvc;

    public void create() {
        entity = [:];
        mode = "create";
        init();
    }

    public void edit() {
        if(!vehicletype) vehicletype = entity?.vehicletype;
        mode = "edit";
        init();
    }
    
    public void open() {
        if(!vehicletype) vehicletype = entity?.vehicletype;
        mode = "read";
        init();
    }

    def doOk() {
        if(handler) handler( entity );
        return "_close";
    }

    def doCancel() {
        return "_close";
    }

    def formControls;
    
    void init() {
        formControls = [];
        def schemaFields = schemaSvc.getSchema( [name: "vehicle_unit"] ).fields;
        def xfields = vehicletype.allowedfields.split("\\|");
        xfields.each { fname->
            def fld = schemaFields.find{ it.name == fname };
            if( fld ) {
                def dt = [caption: fld.caption, name: 'entity.'+fld.name, type:fld.type ];
                if(!dt.type) dt.type = "text";
                if(fld.width) 
                    dt.width = fld.width.toInteger()*2;
                else
                    dt.width = 100;
                if( mode == 'read' ) dt.enabled = false;
                dt.captionWidth = 150;
                formControls << dt;
            }
        }
    }
    
}