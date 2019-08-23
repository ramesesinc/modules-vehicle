package com.rameses.gov.etracs.vehicle.models;

import com.rameses.client.notification.socketio.*;
import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.client.*;

public class ZzNotificationModel {
    
    @Binding 
    def binding 
    
    @Service('TestNotificationService')
    def svc;
    
    def msg = '';
    def text;
    
    // uses updates.xml settings : socketio.host
    // NOTE: settings in updates.xml will override map or file settings
    def instance = TaskNotificationClient.instance;

    // supported conf
    // pass map conf
    // def instance = TaskNotificationClient.getInstance([host:'localhost', port: 5000]);

    // pass filename of conf
    //def instance = TaskNotificationClient.getInstance('d:/temp/socketio.conf');

    int i = 0;
    def handleVehicle = {
        println "handling data ..." + (i++);
        def data = svc.getData(it);
        data.each{
            msg += it.toString() + '\n'
        }
        binding.refresh('msg');
    }
    
    void init() {
        instance.register('vehicle_application', handleVehicle);
    }
    
    void sendChat() {
        if (!text) return;
        def data = [action: 'chat'];
        data.msg = text;
        //instance.send('vehicle_application', data);
        data.event = 'vehicle_application';
        svc.send( data  );
        text = null;
    }
    
    @Close
    def close() {
        MsgBox.alert("remove handle");
        instance.unregister(handleVehicle);
        return "_close";
    }
    
    
}