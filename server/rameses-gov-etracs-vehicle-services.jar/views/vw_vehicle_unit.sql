DROP VIEW IF EXISTS vw_vehicle_unit; 
CREATE VIEW vw_vehicle_unit AS
SELECT 
   vu.*,
   fy.year,
   vf.controlno,
   vgi.owner_objid,
   vgi.owner_name,   
   vt.objid AS vehicletype_objid,
   vt.title AS vehicletype_title,
   vt.allowedfields AS vehicletype_allowedfields   
FROM vehicle_unit vu
INNER JOIN vehicle_franchise_year fy ON vu.franchiseyearid = fy.objid
INNER JOIN vehicle_franchise_generalinfo vgi ON  fy.geninfoid = vgi.objid
INNER JOIN vehicle_franchise vf ON vf.objid = fy.franchiseid 
INNER JOIN vehicletype vt ON vf.vehicletypeid = vt.objid  