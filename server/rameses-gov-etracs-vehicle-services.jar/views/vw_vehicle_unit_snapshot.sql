DROP VIEW IF EXISTS vw_vehicle_unit_snapshot; 
CREATE VIEW vw_vehicle_unit_snapshot AS
SELECT 
   vau.objid,
   va.appno,
   va.apptype,
   va.objid AS appid,
   va.permitid,   
   va2.appno AS histappno,
   va.appdate,
   va.franchiseyearid,
   vu.objid AS unit_objid,
   vu.plateno AS unit_plateno,
   vu.engineno AS unit_engineno,
   vu.bodyno AS unit_bodyno, 
   vu.sidecarno AS unit_sidecarno,
   vu.make AS unit_make,
   vu.model AS unit_model,
   vu.color AS unit_color,
   vu.chassisno AS unit_chassisno,
   vu.sidecarcolor AS unit_sidecarcolor,
   vu.crname AS unit_crname,
   vu.driver_objid AS unit_driver_objid,
   vu.driver_name AS unit_driver_name,
   vu.remarks AS unit_remarks   
FROM vehicle_application va 
INNER JOIN vehicle_application va2 ON va2.franchiseyearid = va.franchiseyearid
INNER JOIN vehicle_application_unit vau ON vau.appid = va2.objid
INNER JOIN vehicle_unit vu ON vau.unitid=vu.objid
LEFT JOIN vehicle_application_unit_dropped vaud ON vaud.appunitid = vau.objid
LEFT JOIN vehicle_application vauda ON vaud.appid = vauda.objid
WHERE va2.dtcreated <= va.dtcreated 
AND (vauda.dtcreated IS NULL OR vauda.dtcreated > va.dtcreated)
ORDER BY va.dtcreated;