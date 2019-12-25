package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.seti2.models.*;
import com.rameses.util.*;
import com.rameses.gov.etracs.vehicle.models.*;
import com.rameses.enterprise.models.*;

public class VehicleCapturePaymentModel {
    
    @Service(value="VehiclePaymentService")
    def postPaymentSvc;
    
    @Service(value="VehicleBillingService")
    def billingSvc;

    @Binding
    def binding;
    
    @Caller
    def caller;
    
    def entity;
    def receipt;
    def billing;
    
    void init(inv) {
        if(!entity) entity = caller.entity;
        def res = billingSvc.getBillItems( [appid: entity.objid ]);
        billing = res;
        receipt = [:];
        receipt.type ="cashreceipt";
    }
    
    public def doOk() {
        if(!MsgBox.confirm("You are about to post this payment")) return;
        def m = [:];
        m.app = [appid: entity.objid];
        m.receiptno = receipt.receiptno;
        m.receiptdate = receipt.receiptdate;        
        m.amount = billing.amount;
        m.billitems = billing.billitems;
        m.txnmode = "CAPTURE";
        postPaymentSvc.postPayment( m );
        caller.reload();
        return "_close";
    }
    
    public def doCancel() {
        return "_close";
    }
    
    
}