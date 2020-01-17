-- vehicle franchise
INSERT IGNORE INTO targetdb.vehicle_franchise
(objid,state,controlno,vehicletypeid)
SELECT 
controlno,'ACTIVE',controlno,vehicletype
FROM sourcedb.vehicle_franchise;

-- vehicle item account
INSERT IGNORE INTO targetdb.vehicle_itemaccount
(objid,title,sortorder)
SELECT DISTINCT item_objid,item_title, 0 from vehicle_application_fee;

-- vehicle_variable
INSERT IGNORE INTO targetdb.vehicle_variable
SELECT * FROM vehicle_variable;

-- vehicle_account
INSERT INTO targetdb.vehicle_account
(objid,franchiseid, owner_objid,owner_name,owner_address_objid,owner_address_text,
barangay_objid,barangay_name)
SELECT 
   va.objid,vf.controlno,va.owner_objid,va.owner_name,va.owner_address_objid,va.owner_address_text,
   va.barangay_objid,va.barangay_name	 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- vehicle unit
INSERT INTO targetdb.vehicle_unit (objid,franchiseid)
SELECT 
   va.objid, vf.controlno 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- vehicle unit infos
-- plateno
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-plateno'), vt.objid, 'tricycle-plateno', vt.plateno 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- engineno
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-engineno'), vt.objid, 'tricycle-engineno', vt.engineno 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- chassisno
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-chassisno'), vt.objid, 'tricycle-chassisno', vt.chassisno 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- make
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-make'), vt.objid, 'tricycle-make', vt.make 
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- model
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-model'), vt.objid, 'tricycle-model', vt.model
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- color
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-color'), vt.objid, 'tricycle-color', vt.color
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid ;

-- sidecarno
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-sidecarno'), vt.objid, 'tricycle-sidecarno', vt.sidecarno
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid; 


-- bodyno
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-bodyno'), vt.objid, 'tricycle-bodyno', vt.bodyno
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid; 

-- sidecarcolor
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-sidecarcolor'), vt.objid, 'tricycle-sidecarcolor', vt.sidecarcolor
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid; 

-- crname
INSERT INTO targetdb.vehicle_unit_info
(objid,unitid,fieldid,stringvalue)
SELECT CONCAT( vt.objid, '-crname'), vt.objid, 'tricycle-crname', vt.crname
FROM 
vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid;


-- vehicle_application
INSERT INTO targetdb.vehicle_application 
(objid,franchiseid,acctid,unitid,appno,appyear,appdate,apptype,txnmode,
dtcreated,createdby_objid,createdby_name,particulars)
SELECT 
   va.objid,vf.controlno,va.objid AS acctid,va.objid AS unitid,
	 va.appno,va.appyear,va.appdate,va.apptype,va.txnmode,  
	 va.dtfiled,va.filedby_objid,va.filedby_name,va.particulars
FROM vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid;

--vehicle_application_task
INSERT INTO targetdb.vehicle_application_task
SELECT 
   vtsk.*
FROM vehicle_application va
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid
INNER JOIN vehicle_application_task vtsk ON vtsk.refid = va.objid ; 

--update vehicle_application_task with existing
UPDATE targetdb.vehicle_application va, vehicle_application nva
SET va.taskid = nva.taskid 
WHERE va.objid = nva.objid;

-- insert vehicle application task for those that do not have application tasks
INSERT INTO targetdb.vehicle_application_task 
(taskid,refid,state,dtcreated)
SELECT va.objid AS taskid,va.objid AS refid,'end',
   (SELECT dtcreated FROM targetdb.vehicle_application_task WHERE refid = va.objid ORDER BY dtcreated DESC LIMIT 1) AS dtcreated
FROM targetdb.vehicle_application va WHERE va.taskid IS NULL

--update vehicle_application_task with existing
UPDATE targetdb.vehicle_application va
SET va.taskid = va.objid  
WHERE va.taskid IS NULL;

-- insert vehicle application info
INSERT INTO targetdb.vehicle_application_info 
(objid,appid,name,stringvalue,decimalvalue,intvalue,datevalue,booleanvalue,lov_objid,lookup_objid,lookup_title,objvalue,sortorder)
SELECT 
va.objid,va.appid,va.name,va.stringvalue,va.decimalvalue,va.intvalue,va.datevalue,va.booleanvalue,va.lov_objid,va.lookup_objid,va.lookup_title,va.objvalue,va.sortorder
FROM vehicle_application_info va
WHERE va.appid IN ( SELECT objid FROM targetdb.vehicle_application )

-- insert vehicle application fee
INSERT INTO targetdb.vehicle_application_fee
(objid,appid,year,itemid,amount,amtpaid)
SELECT 
vaf.objid,vaf.appid, va.appyear, vaf.item_objid, MAX(vaf.amount) AS amount, MAX(vaf.amtpaid) AS amtpaid
FROM vehicle_application_fee vaf 
INNER JOIN vehicle_application va ON vaf.appid = va.objid 
INNER JOIN vehicle_franchise vf ON va.controlid = vf.objid
INNER JOIN vehicle_application_tricycle vt ON va.objid = vt.objid
GROUP BY vaf.appid, va.appyear, vaf.item_objid

-- insert vehicle payment
INSERT IGNORE INTO targetdb.vehicle_payment
(objid,appid,txndate,refid,reftype,refno,refdate,amount,voided,txnmode,remarks)
SELECT 
objid,appid,txndate,refid,reftype,refno,refdate,amount,voided,'ONLINE',NULL
FROM vehicle_payment 

-- insert vehicle payment item
INSERT IGNORE INTO targetdb.vehicle_payment_item
(objid,parentid,refid,amount,surcharge,interest,discount,remarks)
SELECT 
vpi.objid,vpi.parentid,
(SELECT objid FROM vehicle_application_fee WHERE appid = vp.appid AND item_objid = vpi.item_objid ) AS refid, 
vpi.amount,vpi.surcharge,vpi.interest,vpi.discount, NULL
FROM vehicle_payment_item vpi
INNER JOIN vehicle_payment vp ON vpi.parentid = vp.objid 

-- insert vehicle permit
INSERT INTO targetdb.vehicle_permit
(objid,appid,permitno,permittype,dtissued,issuedby_objid,issuedby_name,txnmode,expirydate)
SELECT 
objid,appid,permitno,permittype,dtissued,issuedby_objid,issuedby_name,'ONLINE', CONCAT(YEAR(dtissued),'-12-31') AS expirydate
FROM vehicle_permit

-- update franchise
USE targetdb;
UPDATE vehicle_franchise vf,
(SELECT vax.*, va.apptype, va.appyear, va.txnmode, va.acctid, va.unitid, vp.objid AS permitid     
FROM 
(SELECT  
	vf.objid,    
	 ( SELECT objid FROM vehicle_application WHERE franchiseid  = vf.objid ORDER BY appdate DESC LIMIT 1 ) AS appid
FROM vehicle_franchise vf) vax
INNER JOIN vehicle_application va ON vax.appid = va.objid 
LEFT JOIN vehicle_permit vp ON vp.appid = va.objid) b 

SET vf.appid = b.appid, vf.acctid = b.acctid, vf.unitid = b.unitid, vf.permitid = b.permitid   
WHERE vf.objid = b.objid





