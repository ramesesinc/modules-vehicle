package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

public class VehicleCashReceiptModel extends com.rameses.treasury.common.models.BasicBillingCashReceiptModel {
    
    void loadInfo1( def p ) {
        MsgBox.alert("1")
    }
    
    def loadInfo( def p ) {
        p.collectiontype = entity.collectiontype;
        p.billdate = entity.receiptdate;
        
        //must replace the action so it will reflect the action passed;
        query.action = p.action;
        p.putAll( query );
        def pp = [ rulename: getRulename(), params: p ]; 
        def info = null;
        try {
            def billSvc = InvokerProxy.instance.create("VehicleCashReceiptService", null, getConnection() );
            info = billSvc.getBilling( pp );
        }
        catch(serverErr) {
            if ( p.action == "barcode" ) super.doClose(); 
            //log the errors starting from here 
            new RuntimeException( serverErr ).printStackTrace(); 
            //throw the actual error
            throw serverErr; 
        } 
        
        def warning = info?._warning; 
        if ( warning instanceof com.rameses.util.Warning ) {
            MsgBox.warn( warning.message ); 
        } 
        
        if ( !info.billitems ) { 
            throw new Exception("No bill items found"); 
        }
        
        entity.putAll( info ); 
        billItemList = info.items;
        reloadItems(); 
        return super.start("entry");
    }    
}
