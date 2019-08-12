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
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        entityLookup1 = new com.rameses.entity.components.EntityLookup();
        entityAddressLookup1 = new com.rameses.entity.components.EntityAddressLookup();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        vehicleUnitList1 = new com.rameses.gov.etracs.vehicle.components.VehicleUnitList();
        jPanel1 = new javax.swing.JPanel();
        xButton5 = new com.rameses.rcp.control.XButton();
        xButton3 = new com.rameses.rcp.control.XButton();
        xButton4 = new com.rameses.rcp.control.XButton();
        xButton6 = new com.rameses.rcp.control.XButton();
        xButton7 = new com.rameses.rcp.control.XButton();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xIntegerField1 = new com.rameses.rcp.control.XIntegerField();
        xIntegerField2 = new com.rameses.rcp.control.XIntegerField();

        xFormPanel3.setCaptionWidth(150);

        xLabel4.setCaption("Franchise No");
        xLabel4.setExpression("#{entity.franchise.controlno}");
        xLabel4.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' && apptype != 'NEW'  }");
        xLabel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel4.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel3.add(xLabel4);

        xLabel5.setCaption("Previous Owner");
        xLabel5.setExpression("#{entity.prevowner.name}");
        xLabel5.setName("entity.prevowner"); // NOI18N
        xLabel5.setVisibleWhen("#{ entity.prevowner != null  }");
        xLabel5.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel5.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel5);

        xLabel7.setCaption("Owner ");
        xLabel7.setExpression("#{entity.owner.name}");
        xLabel7.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' && !apptype.matches('NEW|CHANGE_OWNER')  }");
        xLabel7.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel7.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel7);

        xLabel6.setCaption("Owner Address");
        xLabel6.setExpression("#{entity.owner.address.text}");
        xLabel6.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' && !apptype.matches('NEW|CHANGE_OWNER')  }");
        xLabel6.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel6.setPreferredSize(new java.awt.Dimension(0, 20));
        xFormPanel3.add(xLabel6);

        xLookupField1.setCaption("Franchise No");
        xLookupField1.setExpression("#{ entity.franchise.controlno }");
        xLookupField1.setHandler("lookupFranchise");
        xLookupField1.setName("entity.franchise"); // NOI18N
        xLookupField1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' || apptype == 'NEW'  }");
        xLookupField1.setPreferredSize(new java.awt.Dimension(250, 20));
        xLookupField1.setRequired(true);
        xFormPanel3.add(xLookupField1);

        entityLookup1.setCaption("Owner");
        entityLookup1.setName("entity.owner"); // NOI18N
        entityLookup1.setPreferredSize(new java.awt.Dimension(0, 21));
        entityLookup1.setRequired(true);
        entityLookup1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' || apptype.matches('NEW|CHANGE_OWNER')  }");
        xFormPanel3.add(entityLookup1);

        entityAddressLookup1.setCaption("Home Address");
        entityAddressLookup1.setDepends(new String[] {"entity.owner"});
        entityAddressLookup1.setName("entity.owner.address"); // NOI18N
        entityAddressLookup1.setPreferredSize(new java.awt.Dimension(0, 40));
        entityAddressLookup1.setRequired(true);
        entityAddressLookup1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' || apptype.matches('NEW|CHANGE_OWNER')  }");
        xFormPanel3.add(entityAddressLookup1);

        jScrollPane1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 65));

        xTextArea1.setCaption("Particulars");
        xTextArea1.setName("entity.particulars"); // NOI18N
        jScrollPane1.setViewportView(xTextArea1);

        xFormPanel3.add(jScrollPane1);

        vehicleUnitList1.setHandler("unitListModel");
        vehicleUnitList1.setItems("units");
        vehicleUnitList1.setName("selectedUnit"); // NOI18N
        vehicleUnitList1.setVehicletype("entity.vehicletype");

        jPanel1.setLayout(new com.rameses.rcp.control.layout.XLayout());

        xButton5.setDepends(new String[] {"selectedUnit"});
        xButton5.setDisableWhen("");
        xButton5.setName("addUnit"); // NOI18N
        xButton5.setImmediate(true);
        xButton5.setText("Add Unit");
        jPanel1.add(xButton5);

        xButton3.setDepends(new String[] {"selectedUnit"});
        xButton3.setDisableWhen("");
        xButton3.setName("removeUnit"); // NOI18N
        xButton3.setImmediate(true);
        xButton3.setText("Remove Unit");
        jPanel1.add(xButton3);

        xButton4.setDepends(new String[] {"selectedUnit"});
        xButton4.setDisableWhen("");
        xButton4.setName("editUnit"); // NOI18N
        xButton4.setImmediate(true);
        xButton4.setText("Edit Unit");
        jPanel1.add(xButton4);

        xButton6.setDepends(new String[] {"selectedUnit"});
        xButton6.setDisableWhen("#{ selectedUnit?.objid == null }");
        xButton6.setName("dropUnit"); // NOI18N
        xButton6.setVisibleWhen("#{ apptype == 'CHANGE_UNIT' }");
        xButton6.setContentAreaFilled(false);
        xButton6.setText("Drop Unit");
        jPanel1.add(xButton6);

        xButton7.setDepends(new String[] {"selectedUnit"});
        xButton7.setDisableWhen("#{ selectedUnit.objid == null }");
        xButton7.setName("revertChangeUnit"); // NOI18N
        xButton7.setVisibleWhen("#{ apptype == 'CHANGE_UNIT' }");
        xButton7.setContentAreaFilled(false);
        xButton7.setFocusable(false);
        xButton7.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        xButton7.setText("Revert Change");
        xButton7.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        xButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xButton7ActionPerformed(evt);
            }
        });
        jPanel1.add(xButton7);

        xFormPanel1.setCaptionWidth(140);

        xLabel3.setCaption("Vehicle Type");
        xLabel3.setExpression("#{entity.vehicletypeid}");
        xLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel3.setFont(new java.awt.Font("Lucida Grande", 1, 11)); // NOI18N
        xLabel3.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel1.add(xLabel3);

        xLabel2.setCaption("App Type");
        xLabel2.setExpression("#{apptype}");
        xLabel2.setVisibleWhen("#{ entity.txnmode != 'CAPTURE' }");
        xLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel2.setPreferredSize(new java.awt.Dimension(150, 20));
        xFormPanel1.add(xLabel2);

        xComboBox1.setCaption("App Type");
        xComboBox1.setExpression("");
        xComboBox1.setItems("appTypes");
        xComboBox1.setName("entity.apptype"); // NOI18N
        xComboBox1.setVisibleWhen("#{ entity.txnmode == 'CAPTURE' }");
        xComboBox1.setPreferredSize(new java.awt.Dimension(120, 27));
        xComboBox1.setRequired(true);
        xFormPanel1.add(xComboBox1);

        xDateField1.setCaption("App date");
        xDateField1.setDisableWhen("#{ entity.txnmode == 'ONLINE' }");
        xDateField1.setName("entity.appdate"); // NOI18N
        xDateField1.setPreferredSize(new java.awt.Dimension(150, 20));
        xDateField1.setRequired(true);
        xFormPanel1.add(xDateField1);

        xIntegerField1.setCaption("Last Year Renewed");
        xIntegerField1.setDisableWhen("#{ true }");
        xIntegerField1.setName("entity.prevyear"); // NOI18N
        xIntegerField1.setVisibleWhen("#{ apptype == 'RENEW' }");
        xIntegerField1.setRequired(true);
        xFormPanel1.add(xIntegerField1);

        xIntegerField2.setCaption("App Year");
        xIntegerField2.setDisableWhen("#{ entity.txnmode != 'CAPTURE' }");
        xIntegerField2.setName("entity.appyear"); // NOI18N
        xIntegerField2.setVisibleWhen("");
        xIntegerField2.setRequired(true);
        xFormPanel1.add(xIntegerField2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(vehicleUnitList1, javax.swing.GroupLayout.DEFAULT_SIZE, 965, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 705, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 640, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(xFormPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(vehicleUnitList1, javax.swing.GroupLayout.DEFAULT_SIZE, 246, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void xButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xButton7ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_xButton7ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.entity.components.EntityAddressLookup entityAddressLookup1;
    private com.rameses.entity.components.EntityLookup entityLookup1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.gov.etracs.vehicle.components.VehicleUnitList vehicleUnitList1;
    private com.rameses.rcp.control.XButton xButton3;
    private com.rameses.rcp.control.XButton xButton4;
    private com.rameses.rcp.control.XButton xButton5;
    private com.rameses.rcp.control.XButton xButton6;
    private com.rameses.rcp.control.XButton xButton7;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XFormPanel xFormPanel3;
    private com.rameses.rcp.control.XIntegerField xIntegerField1;
    private com.rameses.rcp.control.XIntegerField xIntegerField2;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    // End of variables declaration//GEN-END:variables
}
