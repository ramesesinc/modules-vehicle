DROP VIEW IF EXISTS vw_vehicle_franchise_unit_active;

CREATE VIEW vw_vehicle_franchise_unit_active AS 
 SELECT 
vau.*,
vf.objid AS franchiseid,
va.apptype,
va.appno
FROM vehicle_application_unit vau
INNER JOIN vehicle_application va ON vau.appid = va.objid
INNER JOIN vehicle_franchise_year vfy ON va.franchiseyearid = vfy.objid
INNER JOIN vehicle_franchise vf ON vf.currentyearid = vfy.objid
LEFT JOIN vehicle_application_unit_dropped vaud ON vaud.appunitid = vau.objid
WHERE vaud.objid IS NULL;
