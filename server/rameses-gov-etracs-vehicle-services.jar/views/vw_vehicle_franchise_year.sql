DROP VIEW IF EXISTS vw_vehicle_franchise_year; 
CREATE VIEW vw_vehicle_franchise_year AS
SELECT
    vfy.objid, 
	vfy.year,
	vf.controlno,
	vf.vehicletypeid,
	vfgi.owner_objid,
	vfgi.owner_name,
	vfgi.owner_address_objid,
	vfgi.owner_address_text,
	vfy.renewaldate
FROM vehicle_franchise_year vfy
INNER JOIN vehicle_franchise vf ON vfy.franchiseid = vf.objid
INNER JOIN vehicle_franchise_generalinfo vfgi ON vfy.geninfoid = vfgi.objid 