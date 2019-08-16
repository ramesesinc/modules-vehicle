/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.vehicle.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

/**
 *
 * @author elmonazareno
 */
@Template(CrudFormPage.class)
public class ViewVehicleUnitPage extends javax.swing.JPanel {

    /**
     * Creates new form ViewVehicleUnitPage
     */
    public ViewVehicleUnitPage() {
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

        xFormPanel2 = new com.rameses.rcp.control.XFormPanel();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xTextField15 = new com.rameses.rcp.control.XTextField();
        xTextField12 = new com.rameses.rcp.control.XTextField();
        xTextField14 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xTextField13 = new com.rameses.rcp.control.XTextField();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField11 = new com.rameses.rcp.control.XTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();

        xFormPanel2.setBorder(javax.swing.BorderFactory.createEmptyBorder(10, 10, 10, 10));
        xFormPanel2.setCaptionWidth(120);
        xFormPanel2.setLayout(new java.awt.BorderLayout());

        xTextField8.setCaption("Plate No");
        xTextField8.setName("entity.plateno"); // NOI18N
        xTextField8.setRequired(true);
        xFormPanel2.add(xTextField8, java.awt.BorderLayout.CENTER);

        xTextField15.setCaption("CR Name");
        xTextField15.setName("entity.crname"); // NOI18N
        xTextField15.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel2.add(xTextField15, java.awt.BorderLayout.PAGE_START);

        xTextField12.setCaption("Engine No");
        xTextField12.setName("entity.engineno"); // NOI18N
        xTextField12.setRequired(true);
        xFormPanel2.add(xTextField12, java.awt.BorderLayout.PAGE_END);

        xTextField14.setCaption("Chassis No");
        xTextField14.setName("entity.chassisno"); // NOI18N
        xTextField14.setRequired(true);
        xFormPanel2.add(xTextField14, java.awt.BorderLayout.LINE_END);

        xTextField2.setCaption("Make");
        xTextField2.setName("entity.make"); // NOI18N
        xFormPanel2.add(xTextField2, java.awt.BorderLayout.LINE_START);

        xTextField3.setCaption("Model");
        xTextField3.setName("entity.model"); // NOI18N
        xFormPanel2.add(xTextField3, java.awt.BorderLayout.CENTER);

        xTextField7.setCaption("Color");
        xTextField7.setName("entity.color"); // NOI18N
        xFormPanel2.add(xTextField7, java.awt.BorderLayout.CENTER);

        xTextField13.setCaption("Body No");
        xTextField13.setName("entity.bodyno"); // NOI18N
        xFormPanel2.add(xTextField13, java.awt.BorderLayout.CENTER);

        xTextField1.setCaption("Sidecar No");
        xTextField1.setName("entity.sidecarno"); // NOI18N
        xFormPanel2.add(xTextField1, java.awt.BorderLayout.CENTER);

        xTextField11.setCaption("Sidecar Color");
        xTextField11.setName("entity.sidecarcolor"); // NOI18N
        xFormPanel2.add(xTextField11, java.awt.BorderLayout.CENTER);

        jScrollPane1.setName("entity.remarks"); // NOI18N
        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 65));

        xTextArea1.setCaption("Remarks");
        xTextArea1.setName("entity.remarks"); // NOI18N
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel2.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, 522, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, 361, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField11;
    private com.rameses.rcp.control.XTextField xTextField12;
    private com.rameses.rcp.control.XTextField xTextField13;
    private com.rameses.rcp.control.XTextField xTextField14;
    private com.rameses.rcp.control.XTextField xTextField15;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField7;
    private com.rameses.rcp.control.XTextField xTextField8;
    // End of variables declaration//GEN-END:variables
}
