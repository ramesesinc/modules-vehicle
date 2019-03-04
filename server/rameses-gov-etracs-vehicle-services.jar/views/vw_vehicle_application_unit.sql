
SELECT 
va.applicationid,
vu.*
FROM vehicle_application_unit vau
INNER JOIN vehicle_unit vu ON vau.unitid = vu.objid