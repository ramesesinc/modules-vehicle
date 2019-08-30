DROP VIEW IF EXISTS vw_vehicle_permit_unit;
CREATE VIEW vw_vehicle_permit_unit AS
SELECT 
vu.*,
vfy.objid AS controlno,
vfy.objid AS yearid,
va.appdate AS dtcreated,
vad.appdate AS dtdropped 
FROM vehicle_application_unit vau
INNER JOIN vehicle_unit vu ON vau.unitid = vu.objid 
INNER JOIN vehicle_application va ON vau.appid=va.objid
INNER JOIN vehicle_franchise_year vfy ON va.franchiseyearid=vfy.objid 
LEFT JOIN vehicle_application_unit_dropped vaud ON vau.objid = vaud.appunitid 
LEFT JOIN vehicle_application vad ON vaud.appid = vad.objid 

