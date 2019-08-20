DROP VIEW IF EXISTS vw_vehicle_franchise_year; 
CREATE VIEW vw_vehicle_franchise_year AS
SELECT
  vfy.objid, 
	vfy.year,
	vfy.appid,
	vf.controlno,
	vf.vehicletypeid,
	vfgi.owner_objid,
	vfgi.owner_name,
	vfgi.owner_address_objid,
	vfgi.owner_address_text,
	vp.permitno as permit_permitno,
	vp.permittype as permit_permittype,
	vp.dtissued as permit_dtissued,
	vp.expirydate as permit_expirydate,
	vp.issuedby_name as permit_issuedby_name

FROM vehicle_franchise_year vfy
INNER JOIN vehicle_franchise vf ON vfy.franchiseid = vf.objid
INNER JOIN vehicle_franchise_generalinfo vfgi ON vfy.geninfoid = vfgi.objid 
LEFT JOIN vehicle_permit vp ON vfy.permitid = vp.objid