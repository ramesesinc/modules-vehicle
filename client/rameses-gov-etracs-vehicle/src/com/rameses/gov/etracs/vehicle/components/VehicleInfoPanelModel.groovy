package com.rameses.gov.etracs.vehicle.components;

import com.rameses.rcp.common.*;
import com.rameses.rcp.framework.ClientContext;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;

public class VehicleInfoPanelModel extends ComponentBean {

    def connection;
    def formControls;
    def vehicletype;
    boolean enabled = false;
    def unit;
    
    def _querySvc;
    def getQueryService() {
        if(!_querySvc) {
            _querySvc= InvokerProxy.getInstance().create("QueryService", null, connection);
        }
        return _querySvc;
    }
    
    public void load() {
        if( !vehicletype )
            throw new Exception("Please specify vehicletypename");
        unit = getValue();
        formControls = [];
        def p = [_schemaname:"vehicletype_field"];
        p.findBy = [vehicletypeid: vehicletype];
        p.orderBy = "category,sortorder";
        def flds = queryService.getList( p );
        flds.each { fld ->
            def dt = [caption: fld.caption, name: 'unit.'+fld.name, type:fld.datatype ];
            dt.categoryid = fld.category;
            if(!dt.type) dt.type = "text";
            if(dt.type == "longtext") {
                dt.type = "textarea";
                dt.width = 250;
            }
            else {
                dt.width = 100;
            }
            if(dt.type=='boolean') {
                dt.type = "checkbox";
                dt.checkValue = 1;
                dt.uncheckValue = 0;
            }
            if( fld.required == 1 ) dt.required = true;
            dt.enabled = enabled;
            dt.captionWidth = 150;
            formControls << dt;
        }
    }
    
    void showResult() {
        MsgBox.alert("unit is " + unit );
    }
    
    
}