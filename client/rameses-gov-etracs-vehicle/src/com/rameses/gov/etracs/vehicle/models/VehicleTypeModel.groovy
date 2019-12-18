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
    
    def fieldList;
    
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
    
    
    
}