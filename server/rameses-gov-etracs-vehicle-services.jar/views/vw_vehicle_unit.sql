DROP VIEW IF EXISTS vw_vehicle_unit; 
CREATE VIEW vw_vehicle_unit AS
SELECT 
   fy.year,
   vf.controlno,
   vgi.owner_objid,
   vgi.owner_name,   
   vu.*,
   vt.objid AS vehicletype_objid,
   vt.title AS vehicletype_title,
   vt.allowedfields AS vehicletype_allowedfields   
FROM vehicle_unit vu
INNER JOIN vehicle_application_unit vau ON vau.unitid=vu.objid
INNER JOIN vehicle_application va ON vau.appid = va.objid
INNER JOIN vehicle_franchise_year fy ON va.franchiseyearid = fy.objid
INNER JOIN vehicle_franchise_generalinfo vgi ON  fy.geninfoid = vgi.objid
INNER JOIN vehicle_franchise vf ON fy.franchiseid=vf.objid
INNER JOIN vehicletype vt ON vf.vehicletypeid = vt.objid
WHERE vau.objid NOT IN ( select appunitid from vehicle_application_unit_dropped )

