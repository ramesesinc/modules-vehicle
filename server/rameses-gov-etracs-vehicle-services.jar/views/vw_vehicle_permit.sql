DROP VIEW IF EXISTS vw_vehicle_permit;
CREATE VIEW vw_vehicle_permit AS
SELECT 
   vp.*,
   vf.controlno,
   va.appno, 
   va.appdate,
   vg.owner_objid,
   vg.owner_name,
   vg.owner_address_text,
   vg.phoneno,
   vg.email,
   vg.mobileno,
   vfy.year 
FROM vehicle_permit vp
INNER JOIN vehicle_application va ON vp.appid = va.objid
INNER JOIN vehicle_franchise_generalinfo vg ON va.geninfoid = vg.objid
INNER JOIN vehicle_franchise_year vfy ON va.franchiseyearid = vfy.objid
INNER JOIN vehicle_franchise vf ON vfy.franchiseid = vf.objid