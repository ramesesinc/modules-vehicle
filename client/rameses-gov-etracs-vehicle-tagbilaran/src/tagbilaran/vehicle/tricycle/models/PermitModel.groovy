package tagbilaran.vehicle.tricycle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*; 
import com.rameses.seti2.models.*; 
import com.rameses.treasury.common.models.*; 
import com.rameses.osiris2.client.*
import com.rameses.osiris2.common.*
import com.rameses.util.*;
import com.rameses.seti2.models.*;


public class PermitModel extends FormReportModel  {
    
    public Object getReportData() {
        if(!data?.data)
            throw new Exception("No available report data");
        def d = data.data;
        if(d.units) {
            d.putAll( d.units[0].unit );
        }
        return d;
            
    }
    
}