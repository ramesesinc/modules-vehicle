DROP VIEW IF EXISTS vw_vehicle_application; 
CREATE VIEW vw_vehicle_application AS
SELECT 
va.*,
vf.objid AS franchiseid,
vf.vehicletypeid,
vf.controlno,
vfy.year,
vfgi.owner_objid,
vfgi.owner_name,
vfgi.owner_type,
vfgi.owner_address_objid,
vfgi.owner_address_text,

vfgi.mobileno,
vfgi.phoneno,
vfgi.email,

vat.state AS task_state,
vat.startdate AS task_startdate,
vat.enddate AS task_enddate,
vat.assignee_objid AS task_assignee_objid,
vat.assignee_name AS task_assignee_name,
vat.actor_objid AS task_actor_objid,
vat.actor_name AS task_actor_name,

vp.permitno as permit_permitno,
vp.permittype as permit_permittype,
vp.dtissued as permit_dtissued,
vp.expirydate as permit_expirydate,
vp.issuedby_name as permit_issuedby_name,

prev.year AS prev_year,
a1.franchiseyearid AS prev_franchiseyearid, 
vfgi.startdate

FROM vehicle_application va
INNER JOIN vehicle_franchise_year vfy ON va.franchiseyearid = vfy.objid
INNER JOIN vehicle_franchise vf ON vfy.franchiseid = vf.objid
INNER JOIN vehicle_franchise_generalinfo vfgi ON va.geninfoid = vfgi.objid
LEFT JOIN vehicle_application_task vat ON va.taskid = vat.taskid

LEFT JOIN vehicle_application a1 ON va.prevappid = a1.objid 
LEFT JOIN vehicle_franchise_year prev ON a1.franchiseyearid = prev.objid 
LEFT JOIN vehicle_permit vp ON vp.objid = va.permitid;