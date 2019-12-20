/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.vehicle.views;

import com.rameses.osiris2.themes.FormPage;
import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author elmonazareno
 */
@Template(FormPage.class)
@StyleSheet
public class VehicleApplicationInitialPage extends javax.swing.JPanel {

    /**
     * Creates new form ApplicationInitialPage
     */
    public VehicleApplicationInitialPage() {
        initComponents();
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        vehicleInfoPanel1 = new com.rameses.gov.etracs.vehicle.components.VehicleInfoPanel();
        jPanel3 = new javax.swing.JPanel();
        xFormPanel3 = new com.rameses.rcp.control.XFormPanel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xDateField2 = new com.rameses.rcp.control.XDateField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xIntegerField2 = new com.rameses.rcp.control.XIntegerField();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        entityLookup1 = new com.rameses.entity.components.EntityLookup();
        entityAddressLookup1 = new com.rameses.entity.components.EntityAddressLookup();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xLookupField2 = new com.rameses.rcp.control.XLookupField();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Vehicle Information");
        jPanel2.setBorder(xTitledBorder1);

        vehicleInfoPanel1.setEditmode("editableUnit");
        vehicleInfoPanel1.setName("entity.unit"); // NOI18N
        vehicleInfoPanel1.setVehicletypename("vehicletype.objid");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(vehicleInfoPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 484, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addComponent(vehicleInfoPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("Account Info");
        jPanel3.setBorder(xTitledBorder2);

        xFormPanel3.setCaptionWidth(180);

        xLabel3.setCaption("Vehicle Type");
        xLabel3.setExpression("#{vehicletype.objid}");
        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setFont(new java.awt.Font("Lucida Grande", 1, 11)); // NOI18N
        xLabel3.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel3);

        xLabel2.setCaption("App Type");
        xLabel2.setExpression("#{apptype}");
        xLabel2.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' }");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel2);

        xComboBox1.setCaption("App Type");
        xComboBox1.setExpression("");
        xComboBox1.setItems("appTypes");
        xComboBox1.setName("entity.apptype"); // NOI18N
        xComboBox1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' }");
        xComboBox1.setPreferredSize(new java.awt.Dimension(120, 22));
        xComboBox1.setRequired(true);
        xFormPanel3.add(xComboBox1);

        xDateField2.setCaption("Last Franchise Date Paid");
        xDateField2.setName("entity.account.lastfranchisedatepaid"); // NOI18N
        xDateField2.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' ||  apptype == 'NEW' }");
        xDateField2.setCellPadding(new java.awt.Insets(5, 0, 0, 0));
        xDateField2.setPreferredSize(new java.awt.Dimension(150, 20));
        xDateField2.setRequired(true);
        xFormPanel3.add(xDateField2);

        xDateField1.setCaption("App date");
        xDateField1.setDisableWhen("#{ entity.txnmode != 'CAPTURE' }");
        xDateField1.setName("entity.appdate"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(150, 20));
        xDateField1.setRequired(true);
        xFormPanel3.add(xDateField1);

        xIntegerField2.setCaption("App Year");
        xIntegerField2.setDisableWhen("#{ true }");
        xIntegerField2.setName("entity.appyear"); // NOI18N
        xIntegerField2.setVisibleWhen("");
        xIntegerField2.setRequired(true);
        xFormPanel3.add(xIntegerField2);

        xLabel4.setCaption("Franchise No");
        xLabel4.setExpression("#{entity.franchise.objid}");
        xLabel4.setName("entity.franchise"); // NOI18N
        xLabel4.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' && apptype != 'NEW'  }");
        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel4);

        xLookupField1.setCaption("Franchise No");
        xLookupField1.setExpression("#{ entity.franchise.objid }");
        xLookupField1.setHandler("lookupFranchise");
        xLookupField1.setName("entity.franchise"); // NOI18N
        xLookupField1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' || apptype == 'NEW'  }");
        xLookupField1.setPreferredSize(new java.awt.Dimension(250, 20));
        xLookupField1.setRequired(true);
        xFormPanel3.add(xLookupField1);

        entityLookup1.setCaption("Owner");
        entityLookup1.setDisableWhen("#{ !editableAccount  }");
        entityLookup1.setName("entity.account.owner"); // NOI18N
        entityLookup1.setPreferredSize(new java.awt.Dimension(0, 21));
        entityLookup1.setRequired(true);
        xFormPanel3.add(entityLookup1);

        entityAddressLookup1.setCaption("Home Address");
        entityAddressLookup1.setDepends(new String[] {"entity.account.owner"});
        entityAddressLookup1.setDisableWhen("#{ !editableAccount }");
        entityAddressLookup1.setName("entity.account.owner.address"); // NOI18N
        entityAddressLookup1.setParentIdName("entity.account.owner.objid");
        entityAddressLookup1.setPreferredSize(new java.awt.Dimension(0, 40));
        entityAddressLookup1.setRequired(true);
        xFormPanel3.add(entityAddressLookup1);

        jScrollPane1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 65));

        xTextArea1.setCaption("Particulars");
        xTextArea1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel3.add(jScrollPane1);

        xLookupField2.setCaption("Barangay");
        xLookupField2.setDisableWhen("#{ !editableAccount  }");
        xLookupField2.setExpression("#{ entity.account.barangay.name }");
        xLookupField2.setHandler("barangay:lookup");
        xLookupField2.setName("entity.account.barangay"); // NOI18N
        xLookupField2.setPreferredSize(new java.awt.Dimension(250, 20));
        xLookupField2.setRequired(true);
        xFormPanel3.add(xLookupField2);

        xTextField1.setCaption("Phone No");
        xTextField1.setDisableWhen("#{ !editableAccount  }");
        xTextField1.setName("entity.account.contact.phoneno"); // NOI18N
        xTextField1.setCellPadding(new java.awt.Insets(20, 0, 0, 0));
        xTextField1.setPreferredSize(new java.awt.Dimension(200, 20));
        xFormPanel3.add(xTextField1);

        xTextField2.setCaption("Mobile No");
        xTextField2.setDisableWhen("#{ !editableAccount }");
        xTextField2.setName("entity.account.contact.mobileno"); // NOI18N
        xTextField2.setPreferredSize(new java.awt.Dimension(200, 20));
        xFormPanel3.add(xTextField2);

        xTextField3.setCaption("Email");
        xTextField3.setDisableWhen("#{ !editableAccount }");
        xTextField3.setName("entity.account.contact.email"); // NOI18N
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField3.setTextCase(com.rameses.rcp.constant.TextCase.NONE);
        xFormPanel3.add(xTextField3);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, 588, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, 555, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(91, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.entity.components.EntityAddressLookup entityAddressLookup1;
    private com.rameses.entity.components.EntityLookup entityLookup1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.gov.etracs.vehicle.components.VehicleInfoPanel vehicleInfoPanel1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XDateField xDateField2;
    private com.rameses.rcp.control.XFormPanel xFormPanel3;
    private com.rameses.rcp.control.XIntegerField xIntegerField2;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XLookupField xLookupField2;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
}