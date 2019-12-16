package com.rameses.gov.etracs.vehicle.models;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.util.*;
import com.rameses.treasury.common.models.*;

public class VehicleCashReceiptModel extends CommonCashReceiptModel {
    
    public String getCashReceiptServiceName() {
        return "VehicleCashReceiptService";
    }

}
