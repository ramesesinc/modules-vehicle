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

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;
import javax.imageio.ImageIO; 

public class VehicleTypeModel extends CrudFormModel {
    
    @Service("SchemaService")
    def schemaSvc;
    
    def selectedCluster;
    
    def includedFields = [];
    def includedField;
    def excludedFields = [];
    def excludedField;
    
    
    
    void loadFields() {
        schemaSvc.getSchema( [name:"vehicle_application_unit" ] )?.fields.findAll{it.included == "true"}.collect{
            if (it.name.contains("_")) it.name = it.name.split("_")[0];
            
            def m = [name: it.name, caption: it.caption];           
            def mstr = ".*(" + entity.allowedfields + ")";
            if( m.name.matches(mstr)) {
                includedFields << m;
            }
            else {
                excludedFields << m;
            }
        };
    }
    
    void afterCreate() {
        entity.issued = 0;
        entity.allowedfields = ".*";
        loadFields();
    }

    void afterOpen() {
        loadFields();
    }
    
    void addImage() {
        def jfc = new JFileChooser();
        int retval = jfc.showOpenDialog(null); 
        if (retval == JFileChooser.APPROVE_OPTION) {
            def iicon = new ImageIcon(jfc.getSelectedFile().toURI().toURL());
            def bi = new BufferedImage(iicon.getIconWidth(), iicon.getIconHeight(), BufferedImage.TYPE_INT_ARGB); 
            def g = bi.createGraphics(); 
            g.drawImage(iicon.getImage(), 0, 0, null); 
            g.dispose(); 
            
            def baos = new java.io.ByteArrayOutputStream(); 
            ImageIO.write(bi, "JPG", baos); 
            entity.icon = baos.toByteArray(); 
        } 
    }
    
    
    void addField() {
        if( !excludedField) return;
        if( includedFields.contains(excludedField) ) return;
        includedFields << excludedField;
        excludedFields.remove( excludedField );
    }
    
    void removeField() {
        if( !includedField ) return;
        if(excludedFields.contains(includedField)) return;
        excludedFields << includedField;
        includedFields.remove( includedField );
    }
    
    void beforeSave( def o ) {
        def names = []; 
        includedFields.each{
            def arr = it.name.split("\\."); 
            if ( arr.length > 2 ) names << (arr[1] + '.*'); 
            else if ( arr.length > 1 ) names << arr[1]; 
            else names << arr[0]; 
        }
        
        def str = names.join("|");
        entity.allowedfields = str;
        println '** allowedfields -> '+ entity.allowedfields;
    }
}