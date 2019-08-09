[clean-all]
UPDATE vehicle_franchise SET currentyearid = NULL;
UPDATE vehicle_franchise_year SET franchiseid = NULL, geninfoid = NULL, appid=NULL, permitid = NULL; 
DELETE FROM vehicle_payment_item;
DELETE FROM vehicle_payment;
DELETE FROM vehicle_application_unit;
DELETE FROM vehicle_application_unit_dropped;
DELETE FROM vehicle_application_fee;
DELETE FROM vehicle_application_info;
UPDATE vehicle_application SET taskid = NULL,prevappid=NULL;
DELETE FROM vehicle_application_task;
DELETE FROM vehicle_application;
DELETE FROM vehicle_franchise_year;
DELETE FROM vehicle_franchise;
DELETE FROM vehicle_unit;
DELETE FROM vehicle_franchise_generalinfo;