/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.vehicle.views;

import com.rameses.osiris2.themes.FormPage;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author elmonazareno
 */
@Template(FormPage.class)
public class ApplicationEntryPage extends javax.swing.JPanel {

    /**
     * Creates new form ApplicationInitialPage
     */
    public ApplicationEntryPage() {
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

        xFormPanel3 = new com.rameses.rcp.control.XFormPanel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        entityLookup1 = new com.rameses.entity.components.EntityLookup();
        entityAddressLookup1 = new com.rameses.entity.components.EntityAddressLookup();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();

        xFormPanel3.setCaptionWidth(150);

        xLabel3.setCaption("Vehicle Type");
        xLabel3.setExpression("#{entity.vehicletypeid}");
        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setFont(new java.awt.Font("Lucida Grande", 1, 11)); // NOI18N
        xLabel3.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel3);

        xLabel2.setCaption("App Type");
        xLabel2.setExpression("#{entity.apptype}");
        xLabel2.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' }");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel2);

        xLookupField1.setCaption("Franchise No");
        xLookupField1.setExpression("#{ entity.franchise.controlno }");
        xLookupField1.setHandler("lookupFranchise");
        xLookupField1.setName("entity.franchise"); // NOI18N
        xLookupField1.setPreferredSize(new java.awt.Dimension(250, 20));
        xFormPanel3.add(xLookupField1);

        xDateField1.setCaption("App date");
        xDateField1.setDisableWhen("#{ entity.txnmode == 'ONLINE' }");
        xDateField1.setName("entity.appdate"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(150, 20));
        xDateField1.setRequired(true);
        xFormPanel3.add(xDateField1);

        xComboBox1.setCaption("App Type");
        xComboBox1.setExpression("");
        xComboBox1.setItems("appTypes");
        xComboBox1.setName("apptype"); // NOI18N
        xComboBox1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' }");
        xComboBox1.setPreferredSize(new java.awt.Dimension(120, 27));
        xComboBox1.setRequired(true);
        xFormPanel3.add(xComboBox1);

        xIntegerField1.setCaption("App Year");
        xIntegerField1.setDisableWhen("#{ entity.txnmode != 'CAPTURE' }");
        xIntegerField1.setName("entity.appyear"); // NOI18N
        xIntegerField1.setVisibleWhen("");
        xIntegerField1.setRequired(true);
        xFormPanel3.add(xIntegerField1);

        entityLookup1.setCaption("Owner");
        entityLookup1.setEntityType("entityindividual");
        entityLookup1.setName("entity.owner"); // NOI18N
        entityLookup1.setPreferredSize(new java.awt.Dimension(0, 21));
        entityLookup1.setRequired(true);
        xFormPanel3.add(entityLookup1);

        entityAddressLookup1.setCaption("Home Address");
        entityAddressLookup1.setDepends(new String[] {"entity.owner"});
        entityAddressLookup1.setName("entity.owner.address"); // NOI18N
        entityAddressLookup1.setPreferredSize(new java.awt.Dimension(0, 40));
        entityAddressLookup1.setRequired(true);
        xFormPanel3.add(entityAddressLookup1);

        jScrollPane1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 65));

        xTextArea1.setCaption("Particulars");
        xTextArea1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel3.add(jScrollPane1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 640, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(260, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 269, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(25, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.entity.components.EntityAddressLookup entityAddressLookup1;
    private com.rameses.entity.components.EntityLookup entityLookup1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XFormPanel xFormPanel3;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    // End of variables declaration//GEN-END:variables
}