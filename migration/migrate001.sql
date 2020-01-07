INSERT INTO sys_rule_fact 
(objid,name,title,factclass,sortorder,domain )
VALUES ('treasury.facts.ExtensionDate','treasury.facts.ExtensionDate','Extension Date','treasury.facts.ExtensionDate',0,'TREASURY');


INSERT INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.ExtensionDate.date','treasury.facts.ExtensionDate','date','Date','date',0,'date','date');

INSERT INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.ExtensionDate.year','treasury.facts.ExtensionDate','year','Year','integer',1,'integer','integer');

INSERT INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.ExtensionDate.month','treasury.facts.ExtensionDate','month','Month','integer',2,'integer','integer');

INSERT INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.ExtensionDate.qtr','treasury.facts.ExtensionDate','qtr','Qtr','integer',2,'integer','integer');

INSERT INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.ExtensionDate.tag','treasury.facts.ExtensionDate','tag','Tag','string',3,'string','string');


INSERT IGNORE INTO sys_rule_fact 
(objid,name,title,factclass,sortorder,domain,defaultvarname )
VALUES ('treasury.facts.HolidayFact','treasury.facts.HolidayFact','Holidays','treasury.facts.HolidayFact',1,'TREASURY','HOLIDAYS');

INSERT IGNORE  INTO sys_rule_fact_field
(objid,parentid,name,title,datatype,sortorder,handler,vardatatype)
VALUES 
('treasury.facts.HolidayFact.id','treasury.facts.HolidayFact','id','ID','string',1,'string','string');


INSERT INTO sys_ruleset_fact (ruleset, rulefact) VALUES ('vehiclebilling','treasury.facts.ExtensionDate');
INSERT INTO sys_ruleset_fact (ruleset, rulefact)VALUES ('vehiclebilling','treasury.facts.HolidayFact');

INSERT INTO sys_ruleset_fact (ruleset, rulefact)  VALUES ('vehicledates','treasury.facts.ExtensionDate');




CREATE TABLE `vehicle_extensiondate` (
  `objid` varchar(50) NOT NULL,
  `vehicetypeid` varchar(50) DEFAULT NULL,
  `year` int(255) DEFAULT NULL,
  `month` int(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`objid`)
);
