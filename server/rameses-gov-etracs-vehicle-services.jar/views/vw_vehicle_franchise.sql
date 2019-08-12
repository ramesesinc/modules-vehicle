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
	vfy.renewaldate,
	vt.state AS appstate, 
	vfgi.startdate 
FROM vehicle_franchise vf 
LEFT JOIN vehicle_franchise_year vfy ON vf.currentyearid = vfy.objid
LEFT JOIN vehicle_franchise_generalinfo vfgi ON vfy.geninfoid = vfgi.objid
LEFT JOIN vehicle_application_task vt ON vfy.appid = vt.refid;