package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;

public class ChangeVehicleApplicationModel extends AbstractVehicleApplicationModel {
    
    def controlno;
    
    def loadApp() {
        entity = appSvc.initForChange( [controlno:controlno, vehicletypeid: vehicletype.objid] );
        entity.vehicletype = vehicletype;
        page = "entry"
        return page;
    }
    
    
    
}