DROP VIEW IF EXISTS vw_vehicle_franchise; 
CREATE VIEW vw_vehicle_franchise AS
SELECT
	vf.objid,
	vf.state,
	vf.controlno,
	vf.vehicletypeid,
	vf.currentyearid,
	vfy.year,
	vfy.appid,
	vfgi.objid AS geninfoid,
	vfgi.owner_objid,
	vfgi.owner_name,
	vfgi.owner_address_objid,
	vfgi.owner_type,
	vfgi.owner_address_text,
	vt.state AS appstate, 
	vfgi.startdate,

	vp.permitno as permit_permitno,
	vp.permittype as permit_permittype,
	vp.dtissued as permit_dtissued,
	vp.expirydate as permit_expirydate,
	vp.issuedby_name as permit_issuedby_name

FROM vehicle_franchise vf 
LEFT JOIN vehicle_franchise_year vfy ON vf.currentyearid = vfy.objid
LEFT JOIN vehicle_franchise_generalinfo vfgi ON vfy.geninfoid = vfgi.objid
LEFT JOIN vehicle_application va ON vfy.appid = va.objid 
LEFT JOIN vehicle_application_task vt ON va.taskid = vt.taskid
LEFT JOIN vehicle_permit vp ON vfy.permitid = vp.objid 