/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rameses.gov.etracs.vehicle.components;

import com.rameses.common.MethodResolver;
import com.rameses.osiris2.client.WorkUnitUIController;
import com.rameses.rcp.control.XComponentPanel;
import com.rameses.rcp.ui.Validatable;
import com.rameses.rcp.util.ActionMessage;

@com.rameses.rcp.ui.annotations.ComponentBean("com.rameses.gov.etracs.vehicle.components.VehicleInfoPanelModel")
public class VehicleInfoPanel extends XComponentPanel {

    private String vehicletypename;
    private String editmode;
    
    /**
     * Creates new form UnitInfoModel
     */
    public VehicleInfoPanel() {
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

        setOpaque(false);
        setLayout(new java.awt.BorderLayout());

        xFormPanel2.setName("formControls"); // NOI18N
        xFormPanel2.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 5, 5, 5));
        xFormPanel2.setCellpadding(new java.awt.Insets(1, 1, 1, 1));
        xFormPanel2.setDynamic(true);
        xFormPanel2.setShowCategory(true);
        add(xFormPanel2, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents

    @Override
    protected void initComponentBean(com.rameses.rcp.common.ComponentBean bean) { 
        WorkUnitUIController wu = (WorkUnitUIController)bean.getCallerBinding().getController();
        String conn = (String)wu.getWorkunit().getModule().getProperties().get("connection");
        bean.setProperty("connection", conn); 
        if( getEditmode() == null ) {
            bean.setProperty("enabled", this.isEnabled() );            
        }
        else {
            boolean b = Boolean.parseBoolean(super.getProperty(getEditmode() ) + "");
            bean.setProperty("enabled", b );
        }
        bean.setProperty("vehicletype", super.getProperty( getVehicletypename() ) );
        //bean.setProperty("ui", this);  
    } 
    
    @Override
    public void afterLoad() {
        try {
            Object bean = getComponentBean(); 
            MethodResolver.getInstance().invoke(bean, "load",  new Object[]{});        
        }
        catch(Exception ex) {
            System.out.println("Error VehicleInfoPanel afterLoad " + ex.getMessage());
        }
    }
    /*
    public void afterRefresh() { 
        try { 
            Object bean = getComponentBean(); 
            setProperty("query", getProperty(getQueryName()), bean); 
            MethodResolver.getInstance().invoke(bean, "search",  new Object[]{}); 
        } catch(Throwable t) {
            MsgBox.err( t ); 
        }
    }
    */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XFormPanel xFormPanel2;
    // End of variables declaration//GEN-END:variables

    /**
     * @return the vehicletypename
     */
    public String getVehicletypename() {
        return vehicletypename;
    }

    /**
     * @param vehicletypename the vehicletypename to set
     */
    public void setVehicletypename(String vehicletypename) {
        this.vehicletypename = vehicletypename;
    }

    /**
     * @return the editmode
     */
    public String getEditmode() {
        return editmode;
    }

    /**
     * @param editmode the editmode to set
     */
    public void setEditmode(String editmode) {
        this.editmode = editmode;
    }

    public boolean isRequired() {
        return true;
    }
    
}
