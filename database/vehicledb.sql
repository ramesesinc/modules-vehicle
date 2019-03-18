-- MySQL dump 10.13  Distrib 5.7.22, for osx10.13 (x86_64)
--
-- Host: localhost    Database: dev_vehicle
-- ------------------------------------------------------
-- Server version	5.6.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `rulegroup` (`rulegroup`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
INSERT INTO `sys_rule` VALUES ('RUL-33134f90:164ab2ede1c:-7e5d','DEPLOYED','VEHICLE_COUNT','vehicleassessment','initial','vehicle count',NULL,50000,NULL,NULL,'2018-07-18 10:47:12','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-57c2d992:164ee592b63:-7e1f','DEPLOYED','MOTORCYCLE_RENEWAL_DATE','vehicledates','initial','MOTORCYCLE RENEWAL DATE',NULL,50000,NULL,NULL,'2018-07-31 11:29:18','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-65f47c69:164ab007b19:-7bac','DEPLOYED','MOTORFEES','vehicleassessment','compute-fee','motorfees',NULL,50000,NULL,NULL,'2018-07-18 09:53:45','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-6edb29df:1644165c650:-7e71','APPROVED','COMPUTE_SURCHARGE','vehiclebilling','surcharge','compute surcharge',NULL,50000,NULL,NULL,'2018-06-27 21:28:38','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL-76667e5d:16440b3c84b:-7dba','DEPLOYED','MTOP_FEES','vehicleassessment','compute-fee','mtop fees',NULL,50000,NULL,NULL,'2018-06-27 18:21:32','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RUL7cad66dc:1643f542faa:-7e2d','DEPLOYED','ASK_NUM_EMPLOYEE','vehicleassessment','ask-info','ASK_NUM_EMPLOYEE',NULL,50000,NULL,NULL,'2018-06-27 11:45:43','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1),('RULdf6c2d8:164d540df24:-7ddd','DEPLOYED','SET_DUE_DATE','vehiclebilling','initial','SET DUE DATE',NULL,50000,NULL,NULL,'2018-07-26 14:28:10','USR-1b82c604:14cc29913bb:-7fec','ADMIN',1);
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `sys_rule_action_actiondef` (`actiondef_objid`),
  CONSTRAINT `sys_rule_action_actiondef` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
INSERT INTO `sys_rule_action` VALUES ('RA-1c7c09d1:164ee5525b1:-7fd1','RUL-57c2d992:164ee592b63:-7e1f','treasury.actions.AddDueDate','add-duedate',0),('RACT-2a56c5cd:164ac391848:-7ddd','RUL-33134f90:164ab2ede1c:-7e5d','enterprise.actions.AddSystemInfo','add-systeminfo',0),('RACT-65f47c69:164ab007b19:-7917','RUL-65f47c69:164ab007b19:-7bac','treasury.actions.AddBillItem','add-billitem',0),('RACT-76667e5d:16440b3c84b:-7c83','RUL-76667e5d:16440b3c84b:-7dba','treasury.actions.AddBillItem','add-billitem',0),('RACT-dfb3c52:1643f92cbeb:-7e06','RUL7cad66dc:1643f542faa:-7e2d','enterprise.actions.AskInfo','ask-info',0),('RACT31768105:16440d16692:-7e12','RUL-76667e5d:16440b3c84b:-7dba','treasury.actions.AddBillItem','add-billitem',0),('RACTdf6c2d8:164d540df24:-760b','RUL-6edb29df:1644165c650:-7e71','treasury.actions.AddSurchargeItem','add-surcharge-item',0),('RACTdf6c2d8:164d540df24:-7c93','RULdf6c2d8:164d540df24:-7ddd','treasury.actions.AddDueDate','add-duedate',0);
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  KEY `sys_rule_action_param_actiondefparam` (`actiondefparam_objid`),
  CONSTRAINT `sys_rule_action_param_actiondefparam` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
INSERT INTO `sys_rule_action_param` VALUES ('RAP-1c7c09d1:164ee5525b1:-7fcf','RA-1c7c09d1:164ee5525b1:-7fd1','treasury.actions.AddDueDate.date',NULL,NULL,NULL,NULL,'return @DATE( YR , 12, 31 );\n ','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RAP-1c7c09d1:164ee5525b1:-7fd0','RA-1c7c09d1:164ee5525b1:-7fd1','treasury.actions.AddDueDate.tag','renewaldate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-2a56c5cd:164ac391848:-7d8c','RACT-2a56c5cd:164ac391848:-7ddd','enterprise.actions.AddSystemInfo.aggtype',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COUNT',NULL),('RULACT-2a56c5cd:164ac391848:-7dc5','RACT-2a56c5cd:164ac391848:-7ddd','enterprise.actions.AddSystemInfo.name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NUM_UNITS','NUM_UNITS',NULL,NULL,NULL),('RULACT-57c2d992:164ee592b63:-7b5b','RACT31768105:16440d16692:-7e12','treasury.actions.AddBillItem.month',NULL,NULL,NULL,NULL,'1','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-57c2d992:164ee592b63:-7bc7','RACT-76667e5d:16440b3c84b:-7c83','treasury.actions.AddBillItem.month',NULL,NULL,NULL,NULL,'1','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-57c2d992:164ee592b63:-7c67','RACT-65f47c69:164ab007b19:-7917','treasury.actions.AddBillItem.month',NULL,NULL,NULL,NULL,'1','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-615daaf4:164b01f32ef:-7a30','RACT31768105:16440d16692:-7e12','treasury.actions.AddBillItem.year',NULL,NULL,NULL,NULL,'YR','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-615daaf4:164b01f32ef:-7ab0','RACT-76667e5d:16440b3c84b:-7c83','treasury.actions.AddBillItem.year',NULL,NULL,NULL,NULL,'YR','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-615daaf4:164b01f32ef:-7cfb','RACT-65f47c69:164ab007b19:-7917','treasury.actions.AddBillItem.year',NULL,NULL,NULL,NULL,'YR','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-65f47c69:164ab007b19:-7887','RACT-65f47c69:164ab007b19:-7917','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'150 * NUM_UNITS','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-65f47c69:164ab007b19:-78e1','RACT-65f47c69:164ab007b19:-7917','treasury.actions.AddBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'REVITEM-46b788af:140b8f5265d:-7f5e','PERMIT FOR MOTORCADE/PARADE/RALLY',NULL,NULL,NULL),('RULACT-76667e5d:16440b3c84b:-7c3b','RACT-76667e5d:16440b3c84b:-7c83','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'100','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-76667e5d:16440b3c84b:-7c6c','RACT-76667e5d:16440b3c84b:-7c83','treasury.actions.AddBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'REVITEM217a91b:1409e6ae44e:-7ea7','FRANCHISE TAX - MTOP',NULL,NULL,NULL),('RULACT-dfb3c52:1643f92cbeb:-7ceb','RACT-dfb3c52:1643f92cbeb:-7e06','enterprise.actions.AskInfo.value',NULL,NULL,NULL,NULL,'0','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT-dfb3c52:1643f92cbeb:-7df5','RACT-dfb3c52:1643f92cbeb:-7e06','enterprise.actions.AskInfo.name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NO_OF_EMPLOYEE','NO_OF_EMPLOYEE',NULL,NULL,NULL),('RULACT31768105:16440d16692:-7dc8','RACT31768105:16440d16692:-7e12','treasury.actions.AddBillItem.amount',NULL,NULL,NULL,NULL,'NUMEMPLOYEE * 50','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT31768105:16440d16692:-7dfb','RACT31768105:16440d16692:-7e12','treasury.actions.AddBillItem.account',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'REVITEM-46b788af:140b8f5265d:-7f48','OCCUPATION FEES - EMPLOYEES/PERSONNEL',NULL,NULL,NULL),('RULACTdf6c2d8:164d540df24:-74a1','RACTdf6c2d8:164d540df24:-760b','ACTPARAM68129e35:15876a50bc6:-7e3f',NULL,NULL,'RCOND-6edb29df:1644165c650:-7dd2','BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACTdf6c2d8:164d540df24:-75a7','RACTdf6c2d8:164d540df24:-760b','ACTPARAM68129e35:15876a50bc6:-7e1d',NULL,NULL,NULL,NULL,'AMT * 0.25','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACTdf6c2d8:164d540df24:-75e5','RACTdf6c2d8:164d540df24:-760b','ACTPARAM68129e35:15876a50bc6:-7e30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'REVITEM217a91b:1409e6ae44e:-7e84','BUSINESS TAX - SURCHARGE',NULL,NULL,NULL),('RULACTdf6c2d8:164d540df24:-7c81','RACTdf6c2d8:164d540df24:-7c93','treasury.actions.AddDueDate.date',NULL,NULL,NULL,NULL,'@DATE(  YR, 1, 20 )','expression',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddRequirement','add-requirement','Add Requirement',1,'add-requirement','ENTERPRISE','enterprise.actions.AddRequirement'),('enterprise.actions.AddSystemInfo','add-systeminfo','Add System Info',0,'add-systeminfo','ENTERPRISE','enterprise.actions.AddSystemInfo'),('enterprise.actions.AskInfo','ask-info','Ask Info',0,'ask-info','ENTERPRISE','enterprise.actions.AskInfo'),('enterprise.actions.ThrowException','throw-exeception','Throw Exception',1,'throw-exeception','ENTERPRISE','enterprise.actions.ThrowException'),('treasury.actions.AddBillItem','add-billitem','Add Bill Item',2,'add-billitem','TREASURY','treasury.actions.AddBillItem'),('treasury.actions.AddDiscountItem','add-discount-item','Add Discount',3,'add-discount-item','TREASURY','treasury.actions.AddDiscountItem'),('treasury.actions.AddDueDate','add-duedate','Add Due Date',1,'add-duedate','TREASURY','treasury.actions.AddDueDate'),('treasury.actions.AddExcessBillItem','add-excess-billitem','Add Excess Bill Item',2,'add-excess-billitem','TREASURY','treasury.actions.AddExcessBillItem'),('treasury.actions.AddInterestItem','add-interest-item','Add Interest',3,'add-interest-item','TREASURY','treasury.actions.AddInterestItem'),('treasury.actions.AddRevenueShare','add-share','Add Revenue Share',1,'add-share','TREASURY','treasury.actions.AddRevenueShare'),('treasury.actions.AddRevenueShareByOrg','add-share-by-org','Add Revenue Share By Org',1,'add-share-by-org','TREASURY','treasury.actions.AddRevenueShareByOrg'),('treasury.actions.AddSurchargeItem','add-surcharge-item','Add Surcharge',3,'add-surcharge-item','TREASURY','treasury.actions.AddSurchargeItem'),('treasury.actions.AddVarDate','add-vardate','Add Variable Date',1,'add-vardate','TREASURY','treasury.actions.AddVarDate'),('treasury.actions.AddVarDecimal','add-var-decimal','Add Var Decimal',1,'add-var-decimal','TREASURY','treasury.actions.AddVarDecimal'),('treasury.actions.AddVarInteger','add-var-integer','Add Var Integer',1,'add-var-integer','TREASURY','treasury.actions.AddVarInteger'),('treasury.actions.AddVarString','add-var-string','Add Var String',1,'add-var-string','TREASURY','treasury.actions.AddVarString'),('treasury.actions.ApplyPayment','apply-payment','Apply Payment',5,'apply-payment','TREASURY','treasury.actions.ApplyPayment'),('treasury.actions.SetBillItemAccount','set-billitem-account','Set Bill Item Account',4,'set-billitem-account','TREASURY','treasury.actions.SetBillItemAccount'),('treasury.actions.SetBillItemProperty','set-billitem-property','Set BillItem Property Value',10,'set-billitem-property','TREASURY','treasury.actions.SetBillItemProperty'),('treasury.actions.SummarizeBillItem','summarize-item','Summarize Bill Item',5,'summarize-item','TREASURY','treasury.actions.SummarizeBillItem'),('treasury.actions.UpdateFieldValue','update-field-value','Update Field Value',0,'update-field-value','TREASURY','treasury.actions.UpdateFieldValue'),('treasury.sample.ComputeBill','compute_bill1','Compute Bill 1',1,'compute_bill1',NULL,'treasury.sample.ComputeBill');
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('2ecbcac2:15f2d21e588:-7ff2','treasury.actions.AddVarDate','tag',1,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('2ecbcac2:15f2d21e588:-7ff3','treasury.actions.AddVarDate','date',2,'Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM-1a90cae7:15f130ef553:-6df2','treasury.actions.AddSurchargeItem','txntype',4,'Txn Type',NULL,'lookup','billitem_txntype:lookup','objid','title','string',NULL),('ACTPARAM2fc067f3:151cc3fac96:-7e8f','treasury.actions.AddDiscountItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM2fc067f3:151cc3fac96:-7e97','treasury.actions.AddDiscountItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('ACTPARAM62888c28:151cc92197a:-7f6b','treasury.actions.AddDiscountItem','account',2,'Discount Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('ACTPARAM68129e35:15876a50bc6:-7e1d','treasury.actions.AddSurchargeItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('ACTPARAM68129e35:15876a50bc6:-7e30','treasury.actions.AddSurchargeItem','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title','string',NULL),('ACTPARAM68129e35:15876a50bc6:-7e3f','treasury.actions.AddSurchargeItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('enterprise.actions.AddRequirement.type','enterprise.actions.AddRequirement','type',1,'Type',NULL,'lookup','requirementtype:lookup','objid','title',NULL,NULL),('enterprise.actions.AddSystemInfo.aggtype','enterprise.actions.AddSystemInfo','aggtype',3,'Aggregate Type',NULL,'lov',NULL,NULL,NULL,NULL,'INFO_AGGREGATE_TYPES'),('enterprise.actions.AddSystemInfo.name','enterprise.actions.AddSystemInfo','name',1,'Name',NULL,'lookup','variableinfo:lookup','name','name','string',NULL),('enterprise.actions.AddSystemInfo.value','enterprise.actions.AddSystemInfo','value',2,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('enterprise.actions.AskInfo.name','enterprise.actions.AskInfo','name',1,'Name',NULL,'lookup','variableinfo:lookup','name','name','string',NULL),('enterprise.actions.AskInfo.value','enterprise.actions.AskInfo','value',2,'Default Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('enterprise.actions.ThrowException.msg','enterprise.actions.ThrowException','msg',1,'Message',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.account','treasury.actions.AddBillItem','account',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddBillItem.amount','treasury.actions.AddBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.fromdate','treasury.actions.AddBillItem','fromdate',6,'From Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.month','treasury.actions.AddBillItem','month',5,'Month',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.refid','treasury.actions.AddBillItem','refid',9,'Ref ID',NULL,'var',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddBillItem.remarks','treasury.actions.AddBillItem','remarks',8,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.todate','treasury.actions.AddBillItem','todate',7,'To Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddBillItem.txntype','treasury.actions.AddBillItem','txntype',3,'Txn Type',NULL,'lookup','billitem_txntype:lookup','objid','title','string',NULL),('treasury.actions.AddBillItem.year','treasury.actions.AddBillItem','year',4,'Year',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddDiscountItem.account','treasury.actions.AddDiscountItem','account',2,'Discount Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddDiscountItem.amount','treasury.actions.AddDiscountItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddDiscountItem.billitem','treasury.actions.AddDiscountItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddDueDate.date','treasury.actions.AddDueDate','date',1,'Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddDueDate.tag','treasury.actions.AddDueDate','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddExcessBillItem.account','treasury.actions.AddExcessBillItem','account',1,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.AddExcessBillItem.amount','treasury.actions.AddExcessBillItem','amount',2,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.account','treasury.actions.AddInterestItem','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title','string',NULL),('treasury.actions.AddInterestItem.amount','treasury.actions.AddInterestItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddInterestItem.billitem','treasury.actions.AddInterestItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddRevenueShareByOrg.amount','treasury.actions.AddRevenueShare','amount',4,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddRevenueShareByOrg.org','treasury.actions.AddRevenueShare','org',3,'Org',NULL,'var',NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.actions.AddRevenueShareByOrg.payableaccount','treasury.actions.AddRevenueShare','payableaccount',2,'Payable Account',NULL,'lookup','payableaccount:lookup','objid','title','string',NULL),('treasury.actions.AddRevenueShareByOrg.refitem','treasury.actions.AddRevenueShare','refitem',1,'Ref Item',NULL,'var','revenueitem:lookup','objid','title','treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.account','treasury.actions.AddSurchargeItem','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title','string',NULL),('treasury.actions.AddSurchargeItem.amount','treasury.actions.AddSurchargeItem','amount',3,'Amount',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddSurchargeItem.billitem','treasury.actions.AddSurchargeItem','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.AddSurchargeItem.txntype','treasury.actions.AddSurchargeItem','txntype',4,'Txn Type',NULL,'lookup','billitem_txntype:lookup','objid','title','string',NULL),('treasury.actions.AddVarDate.date','treasury.actions.AddVarDate','date',2,'Date',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddVarDate.tag','treasury.actions.AddVarDate','tag',1,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarDecimal.tag','treasury.actions.AddVarDecimal','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarDecimal.value','treasury.actions.AddVarDecimal','value',1,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddVarInteger.tag','treasury.actions.AddVarInteger','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarInteger.value','treasury.actions.AddVarInteger','value',1,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.AddVarString.tag','treasury.actions.AddVarString','tag',2,'Tag','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.AddVarString.value','treasury.actions.AddVarString','value',1,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.ApplyPayment.payment','treasury.actions.ApplyPayment','payment',1,'Payment',NULL,'var',NULL,NULL,NULL,'treasury.facts.Payment',NULL),('treasury.actions.SetBillItemAccount.account','treasury.actions.SetBillItemAccount','account',2,'Account',NULL,'lookup','revenueitem:lookup','objid','title',NULL,NULL),('treasury.actions.SetBillItemAccount.billitem','treasury.actions.SetBillItemAccount','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SetBillItemProperty.billitem','treasury.actions.SetBillItemProperty','billitem',1,'Bill Item',NULL,'var',NULL,NULL,NULL,'treasury.facts.BillItem',NULL),('treasury.actions.SetBillItemProperty.fieldname','treasury.actions.SetBillItemProperty','fieldname',2,'Property Field Name',NULL,'fieldlist',NULL,'billitem',NULL,NULL,NULL),('treasury.actions.SetBillItemProperty.value','treasury.actions.SetBillItemProperty','value',3,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.SummarizeBillItem.aggtype','treasury.actions.SummarizeBillItem','aggtype',2,'Aggregate Type',NULL,'lov',NULL,NULL,NULL,NULL,'SUMMARY_AGGREGATE_TYPE'),('treasury.actions.SummarizeBillItem.billitem','treasury.actions.SummarizeBillItem','billitem',1,'BillItem',NULL,'var',NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.actions.SummarizeBillItem.fields','treasury.actions.SummarizeBillItem','fields',2,'Group Fields','string','string',NULL,NULL,NULL,'string',NULL),('treasury.actions.SummarizeBillItem.remarks','treasury.actions.SummarizeBillItem','remarks',3,'Remarks',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.actions.UpdateFieldValue.fieldname','treasury.actions.UpdateFieldValue','fieldname',2,'Field name',NULL,'fieldlist',NULL,'object',NULL,NULL,NULL),('treasury.actions.UpdateFieldValue.object','treasury.actions.UpdateFieldValue','object',1,'Object',NULL,'var',NULL,NULL,NULL,'obj',NULL),('treasury.actions.UpdateFieldValue.value','treasury.actions.UpdateFieldValue','value',3,'Value',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.sample.ComputeBill.name','treasury.sample.ComputeBill','name',2,'Name',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('treasury.sample.ComputeBill.unit','treasury.sample.ComputeBill','unit',1,'Unit',NULL,'expression',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `fact_objid` (`fact_objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_fact` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
INSERT INTO `sys_rule_condition` VALUES ('RC-1c7c09d1:164ee5525b1:-7fd5','RUL-57c2d992:164ee592b63:-7e1f','vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','VAPP',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-33134f90:164ab2ede1c:-7d14','RUL-33134f90:164ab2ede1c:-7e5d','vehicle.facts.VehicleUnit','vehicle.facts.VehicleUnit','VU',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-65f47c69:164ab007b19:-7a63','RUL-65f47c69:164ab007b19:-7bac','vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','VAPP',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-6edb29df:1644165c650:-7dd2','RUL-6edb29df:1644165c650:-7e71','treasury.facts.BillItem','treasury.facts.BillItem','BILLITEM',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-76667e5d:16440b3c84b:-7d21','RUL-76667e5d:16440b3c84b:-7dba','vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','VAPP',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND-dfb3c52:1643f92cbeb:-7e4c','RUL7cad66dc:1643f542faa:-7e2d','vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','VAPP',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND31768105:16440d16692:-7e9c','RUL-76667e5d:16440b3c84b:-7dba','enterprise.facts.IntegerInfo','enterprise.facts.IntegerInfo',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6ce1407b:164ac6fb0fc:-7dce','RUL-65f47c69:164ab007b19:-7bac','enterprise.facts.IntegerInfo','enterprise.facts.IntegerInfo',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCONDdf6c2d8:164d540df24:-7975','RUL-6edb29df:1644165c650:-7e71','treasury.facts.DueDate','treasury.facts.DueDate',NULL,2,NULL,NULL,NULL,NULL,NULL,0),('RCONDdf6c2d8:164d540df24:-7a82','RUL-6edb29df:1644165c650:-7e71','treasury.facts.BillDate','treasury.facts.BillDate',NULL,1,NULL,NULL,NULL,NULL,NULL,0),('RCONDdf6c2d8:164d540df24:-7d3d','RULdf6c2d8:164d540df24:-7ddd','vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','VAPP',0,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  KEY `var_objid` (`var_objid`),
  KEY `sys_rule_condition_constraint_fact_field` (`field_objid`),
  CONSTRAINT `sys_rule_condition_constraint_fact_field` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-1c7c09d1:164ee5525b1:-7fd2','RC-1c7c09d1:164ee5525b1:-7fd5','vehicle.facts.VehicleApplication.appyear','appyear','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCC-1c7c09d1:164ee5525b1:-7fd4','RC-1c7c09d1:164ee5525b1:-7fd5','vehicle.facts.VehicleApplication.vehicletype','vehicletype',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"motorcycle\",value:\"motorcycle\"],[key:\"tricycle\",value:\"tricycle\"]]',NULL,1),('RCONST-615daaf4:164b01f32ef:-7b78','RCOND-76667e5d:16440b3c84b:-7d21','vehicle.facts.VehicleApplication.appyear','appyear','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-615daaf4:164b01f32ef:-7dbb','RCOND-65f47c69:164ab007b19:-7a63','vehicle.facts.VehicleApplication.appyear','appyear','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-65f47c69:164ab007b19:-7a3d','RCOND-65f47c69:164ab007b19:-7a63','vehicle.facts.VehicleApplication.vehicletype','vehicletype',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"motorcycle\",value:\"motorcycle\"]]',NULL,0),('RCONST-6edb29df:1644165c650:-7d40','RCOND-6edb29df:1644165c650:-7dd2','treasury.facts.BillItem.amount','amount','AMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST-6edb29df:1644165c650:-7da3','RCOND-6edb29df:1644165c650:-7dd2','treasury.facts.BillItem.account','account',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"REVITEM217a91b:1409e6ae44e:-7ea7\",value:\"FRANCHISE TAX - MTOP\"]]',NULL,0),('RCONST-76667e5d:16440b3c84b:-7d0a','RCOND-76667e5d:16440b3c84b:-7d21','vehicle.facts.VehicleApplication.vehicletype','vehicletype',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcycle\",value:\"motorcycle\"]]',NULL,0),('RCONST-76667e5d:16440b3c84b:-7e2a','RCOND-dfb3c52:1643f92cbeb:-7e4c','vehicle.facts.VehicleApplication.vehicletype','vehicletype',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcycle\",value:\"motorcycle\"]]',NULL,0),('RCONST31768105:16440d16692:-7e9a','RCOND31768105:16440d16692:-7e9c','enterprise.facts.IntegerInfo.value','value','NUMEMPLOYEE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST31768105:16440d16692:-7e9b','RCOND31768105:16440d16692:-7e9c','enterprise.facts.IntegerInfo.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"NO_OF_EMPLOYEE\",value:\"NO_OF_EMPLOYEE\"]]',NULL,0),('RCONST6ce1407b:164ac6fb0fc:-7dcc','RCOND6ce1407b:164ac6fb0fc:-7dce','enterprise.facts.IntegerInfo.value','value','NUM_UNITS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('RCONST6ce1407b:164ac6fb0fc:-7dcd','RCOND6ce1407b:164ac6fb0fc:-7dce','enterprise.facts.IntegerInfo.name','name',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"NUM_UNITS\",value:\"NUM_UNITS\"]]',NULL,0),('RCONSTdf6c2d8:164d540df24:-794d','RCONDdf6c2d8:164d540df24:-7975','treasury.facts.DueDate.date','date',NULL,'before','<',1,'RCONSTdf6c2d8:164d540df24:-7a5a','BILLDATE',NULL,NULL,NULL,NULL,NULL,0),('RCONSTdf6c2d8:164d540df24:-7a5a','RCONDdf6c2d8:164d540df24:-7a82','treasury.facts.BillDate.date','date','BILLDATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('RCONSTdf6c2d8:164d540df24:-7d0a','RCONDdf6c2d8:164d540df24:-7d3d','vehicle.facts.VehicleApplication.appyear','appyear','YR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-1c7c09d1:164ee5525b1:-7fd5','RC-1c7c09d1:164ee5525b1:-7fd5','RUL-57c2d992:164ee592b63:-7e1f','VAPP','vehicle.facts.VehicleApplication',0),('RCC-1c7c09d1:164ee5525b1:-7fd2','RC-1c7c09d1:164ee5525b1:-7fd5','RUL-57c2d992:164ee592b63:-7e1f','YR','integer',1),('RCOND-33134f90:164ab2ede1c:-7d14','RCOND-33134f90:164ab2ede1c:-7d14','RUL-33134f90:164ab2ede1c:-7e5d','VU','vehicle.facts.VehicleUnit',0),('RCOND-65f47c69:164ab007b19:-7a63','RCOND-65f47c69:164ab007b19:-7a63','RUL-65f47c69:164ab007b19:-7bac','VAPP','vehicle.facts.VehicleApplication',0),('RCOND-6edb29df:1644165c650:-7dd2','RCOND-6edb29df:1644165c650:-7dd2','RUL-6edb29df:1644165c650:-7e71','BILLITEM','treasury.facts.BillItem',0),('RCOND-76667e5d:16440b3c84b:-7d21','RCOND-76667e5d:16440b3c84b:-7d21','RUL-76667e5d:16440b3c84b:-7dba','VAPP','vehicle.facts.VehicleApplication',0),('RCOND-dfb3c52:1643f92cbeb:-7e4c','RCOND-dfb3c52:1643f92cbeb:-7e4c','RUL7cad66dc:1643f542faa:-7e2d','VAPP','vehicle.facts.VehicleApplication',0),('RCONDdf6c2d8:164d540df24:-7d3d','RCONDdf6c2d8:164d540df24:-7d3d','RULdf6c2d8:164d540df24:-7ddd','VAPP','vehicle.facts.VehicleApplication',0),('RCONST-615daaf4:164b01f32ef:-7b78','RCOND-76667e5d:16440b3c84b:-7d21','RUL-76667e5d:16440b3c84b:-7dba','YR','integer',1),('RCONST-615daaf4:164b01f32ef:-7dbb','RCOND-65f47c69:164ab007b19:-7a63','RUL-65f47c69:164ab007b19:-7bac','YR','integer',1),('RCONST-6edb29df:1644165c650:-7d40','RCOND-6edb29df:1644165c650:-7dd2','RUL-6edb29df:1644165c650:-7e71','AMT','decimal',1),('RCONST31768105:16440d16692:-7e9a','RCOND31768105:16440d16692:-7e9c','RUL-76667e5d:16440b3c84b:-7dba','NUMEMPLOYEE','integer',1),('RCONST6ce1407b:164ac6fb0fc:-7dcc','RCOND6ce1407b:164ac6fb0fc:-7dce','RUL-65f47c69:164ab007b19:-7bac','NUM_UNITS','integer',1),('RCONSTdf6c2d8:164d540df24:-7a5a','RCONDdf6c2d8:164d540df24:-7a82','RUL-6edb29df:1644165c650:-7e71','BILLDATE','date',0),('RCONSTdf6c2d8:164d540df24:-7d0a','RCONDdf6c2d8:164d540df24:-7d3d','RULdf6c2d8:164d540df24:-7ddd','YR','integer',0);
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
INSERT INTO `sys_rule_deployed` VALUES ('RUL-33134f90:164ab2ede1c:-7e5d','\npackage vehicleassessment.VEHICLE_COUNT;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"VEHICLE_COUNT\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VU: vehicle.facts.VehicleUnit (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VU\", VU );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"name\", new KeyValue(\"NUM_UNITS\", \"NUM_UNITS\") );\n_p0.put( \"aggtype\", \"COUNT\" );\naction.execute( \"add-systeminfo\",_p0,drools);\n\nend\n\n\n	'),('RUL-57c2d992:164ee592b63:-7e1f','\npackage vehicledates.MOTORCYCLE_RENEWAL_DATE;\nimport vehicledates.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORCYCLE_RENEWAL_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  YR:appyear,vehicletype matches \"motorcycle|tricycle\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"date\", (new ActionExpression(\"return @DATE( YR , 12, 31 );  \", bindings)) );\n_p0.put( \"tag\", \"renewaldate\" );\naction.execute( \"add-duedate\",_p0,drools);\n\nend\n\n\n	'),('RUL-65f47c69:164ab007b19:-7bac','\npackage vehicleassessment.MOTORFEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORFEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcycle\",YR:appyear ) \n		\n		 enterprise.facts.IntegerInfo (  name matches \"NUM_UNITS\",NUM_UNITS:value ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"NUM_UNITS\", NUM_UNITS );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"REVITEM-46b788af:140b8f5265d:-7f5e\", \"PERMIT FOR MOTORCADE/PARADE/RALLY\") );\n_p0.put( \"amount\", (new ActionExpression(\"150 * NUM_UNITS\", bindings)) );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p0.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	'),('RUL-76667e5d:16440b3c84b:-7dba','\npackage vehicleassessment.MTOP_FEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MTOP_FEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcycle\",YR:appyear ) \n		\n		 enterprise.facts.IntegerInfo (  name matches \"NO_OF_EMPLOYEE\",NUMEMPLOYEE:value ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"NUMEMPLOYEE\", NUMEMPLOYEE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"REVITEM217a91b:1409e6ae44e:-7ea7\", \"FRANCHISE TAX - MTOP\") );\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p0.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\nMap _p1 = new HashMap();\n_p1.put( \"account\", new KeyValue(\"REVITEM-46b788af:140b8f5265d:-7f48\", \"OCCUPATION FEES - EMPLOYEES/PERSONNEL\") );\n_p1.put( \"amount\", (new ActionExpression(\"NUMEMPLOYEE * 50\", bindings)) );\n_p1.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p1.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p1,drools);\n\nend\n\n\n	'),('RUL7cad66dc:1643f542faa:-7e2d','\npackage vehicleassessment.ASK_NUM_EMPLOYEE;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"ASK_NUM_EMPLOYEE\"\n	agenda-group \"ask-info\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcycle\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"name\", new KeyValue(\"NO_OF_EMPLOYEE\", \"NO_OF_EMPLOYEE\") );\n_p0.put( \"value\", (new ActionExpression(\"0\", bindings)) );\naction.execute( \"ask-info\",_p0,drools);\n\nend\n\n\n	'),('RULdf6c2d8:164d540df24:-7ddd','\npackage vehiclebilling.SET_DUE_DATE;\nimport vehiclebilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_DUE_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  YR:appyear ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"date\", (new ActionExpression(\"@DATE(  YR, 1, 20 )\", bindings)) );\naction.execute( \"add-duedate\",_p0,drools);\n\nend\n\n\n	');
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('com.rameses.rules.common.CurrentDate','com.rameses.rules.common.CurrentDate','Current Date','com.rameses.rules.common.CurrentDate',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SYSTEM',NULL),('enterprise.facts.BooleanInfo','enterprise.facts.BooleanInfo','Boolean (Yes No) Info','enterprise.facts.BooleanInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('enterprise.facts.DateInfo','enterprise.facts.DateInfo','Date Info','enterprise.facts.DateInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('enterprise.facts.IntegerInfo','enterprise.facts.IntegerInfo','Integer Info','enterprise.facts.IntegerInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('enterprise.facts.Org','enterprise.facts.Org','Org','enterprise.facts.Org',1,NULL,'ORG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE',NULL),('enterprise.facts.Requirement','enterprise.facts.Requirement','Requirement','enterprise.facts.Requirement',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE',NULL),('enterprise.facts.StringArrayInfo','enterprise.facts.StringArrayInfo','String Array Info','enterprise.facts.StringArrayInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('enterprise.facts.StringInfo','enterprise.facts.StringInfo','String Info','enterprise.facts.StringInfo',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('treasury.facts.AppDate','treasury.facts.AppDate','Application Date','treasury.facts.AppDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Attribute','treasury.facts.Attribute','Attribute','treasury.facts.Attribute',1,NULL,'ATT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.BillDate','treasury.facts.BillDate','Bill Date','treasury.facts.BillDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.BillingPeriod','treasury.facts.BillingPeriod','Billing Period','treasury.facts.BillingPeriod',1,NULL,'BILPRD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.BillItem','treasury.facts.BillItem','Bill Item','treasury.facts.BillItem',1,NULL,'BILLITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.CollectionGroup','treasury.facts.CollectionGroup','Collection Group','treasury.facts.CollectionGroup',0,NULL,'CG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.DecimalInfo','treasury.facts.DecimalInfo','Decimal Info','treasury.facts.DecimalInfo',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ENTERPRISE','enterprise.facts.VariableInfo'),('treasury.facts.DueDate','treasury.facts.DueDate','Due Date','treasury.facts.DueDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.ExcessPayment','treasury.facts.ExcessPayment','Excess Payment','treasury.facts.ExcessPayment',5,NULL,'EXPMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.HolidayFact','treasury.facts.HolidayFact','Holidays','treasury.facts.HolidayFact',1,NULL,'HOLIDAYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.InterestItem','treasury.facts.InterestItem','Interest Item','treasury.facts.InterestItem',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.MonthEntry','treasury.facts.MonthEntry','Month Entry','treasury.facts.MonthEntry',1,NULL,'MONTHENTRY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.Payment','treasury.facts.Payment','Payment','treasury.facts.Payment',5,NULL,'PMT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.RevenueShare','treasury.facts.RevenueShare','Revenue Share','treasury.facts.RevenueShare',1,NULL,'RS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.SampleItem','treasury.facts.SampleItem','Bill Item class','treasury.facts.SampleItem',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.SurchargeItem','treasury.facts.SurchargeItem','Surcharge Item','treasury.facts.SurchargeItem',4,NULL,'SUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY','treasury.facts.AbstractBillItem'),('treasury.facts.SystemDate','treasury.facts.SystemDate','System Date','treasury.facts.SystemDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarDate','treasury.facts.VarDate','Variable Date','treasury.facts.VarDate',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarDecimal','treasury.facts.VarDecimal','Var Decimal','treasury.facts.VarDecimal',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarInteger','treasury.facts.VarInteger','Var Integer','treasury.facts.VarInteger',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('treasury.facts.VarString','treasury.facts.VarString','Var String','treasury.facts.VarString',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TREASURY',NULL),('vehicle.facts.VehicleApplication','vehicle.facts.VehicleApplication','Vehicle Application','vehicle.facts.VehicleApplication',1,NULL,'VAPP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VEHICLE',NULL),('vehicle.facts.VehicleFranchise','vehicle.facts.VehicleFranchise','Vehicle Franchise','vehicle.facts.VehicleFranchise',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VEHICLE',NULL),('vehicle.facts.VehicleUnit','vehicle.facts.VehicleUnit','Vehicle Unit','vehicle.facts.VehicleUnit',1,NULL,'VU',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'VEHICLE',NULL);
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.date','com.rameses.rules.common.CurrentDate','date','Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('com.rameses.rules.common.CurrentDate.day','com.rameses.rules.common.CurrentDate','day','Day','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.month','com.rameses.rules.common.CurrentDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.qtr','com.rameses.rules.common.CurrentDate','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('com.rameses.rules.common.CurrentDate.year','com.rameses.rules.common.CurrentDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.BooleanInfo.name','enterprise.facts.BooleanInfo','name','Name','string',1,'lookup','variableinfo_boolean:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.BooleanInfo.value','enterprise.facts.BooleanInfo','value','Value','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,1,'boolean',NULL),('enterprise.facts.DateInfo.day','enterprise.facts.DateInfo','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.month','enterprise.facts.DateInfo','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.name','enterprise.facts.DateInfo','name','Name','string',5,'lookup','variableinfo_date:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.DateInfo.qtr','enterprise.facts.DateInfo','qtr','Qtr','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.DateInfo.value','enterprise.facts.DateInfo','value','Date','date',6,'date',NULL,NULL,NULL,NULL,NULL,1,'date',NULL),('enterprise.facts.DateInfo.year','enterprise.facts.DateInfo','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('enterprise.facts.IntegerInfo.name','enterprise.facts.IntegerInfo','name','Name','string',1,'lookup','variableinfo_integer:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.IntegerInfo.value','enterprise.facts.IntegerInfo','value','Value','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,1,'integer',NULL),('enterprise.facts.Org.orgid','enterprise.facts.Org','orgid','Org ID','string',1,'lookup','org:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('enterprise.facts.Requirement.completed','enterprise.facts.Requirement','completed','Completed','boolean',2,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('enterprise.facts.Requirement.expirydate','enterprise.facts.Requirement','expirydate','Expiry Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('enterprise.facts.Requirement.type','enterprise.facts.Requirement','type','Type','string',1,'lookup','requirementtype:lookup','objid','title',NULL,1,NULL,'string',NULL),('enterprise.facts.StringArrayInfo.name','enterprise.facts.StringArrayInfo','name','Name','string',1,'lookup','variableinfo_string_array:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.StringArrayInfo.value','enterprise.facts.StringArrayInfo','value','Value','string',2,'string',NULL,NULL,NULL,NULL,NULL,1,'string',NULL),('enterprise.facts.StringInfo.name','enterprise.facts.StringInfo','name','Name','string',1,'lookup','variableinfo_string:lookup','name','name',NULL,NULL,1,'string',NULL),('enterprise.facts.StringInfo.value','enterprise.facts.StringInfo','value','Value','string',2,'string',NULL,NULL,NULL,NULL,NULL,1,'string',NULL),('treasury.facts.AppDate.date','treasury.facts.AppDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.AppDate.day','treasury.facts.AppDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.AppDate.month','treasury.facts.AppDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.AppDate.qtr','treasury.facts.AppDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.AppDate.year','treasury.facts.AppDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.Attribute.name','treasury.facts.Attribute','name','Name','string',1,'lookup','attribute:lookup','name','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillDate.date','treasury.facts.BillDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillDate.day','treasury.facts.BillDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillDate.month','treasury.facts.BillDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillDate.qtr','treasury.facts.BillDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillDate.year','treasury.facts.BillDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillingPeriod.fromdate','treasury.facts.BillingPeriod','fromdate','From Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillingPeriod.month','treasury.facts.BillingPeriod','month','Month','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillingPeriod.todate','treasury.facts.BillingPeriod','todate','To Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillingPeriod.year','treasury.facts.BillingPeriod','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.account','treasury.facts.BillItem','account','Account','string',3,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.account.objid','treasury.facts.BillItem','account.objid','Account ID','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.amount','treasury.facts.BillItem','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.billrefid','treasury.facts.BillItem','billrefid','Bill Ref ID','string',7,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.discount','treasury.facts.BillItem','discount','Discount','decimal',8,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.duedate','treasury.facts.BillItem','duedate','Due Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.fromdate','treasury.facts.BillItem','fromdate','From Date','date',14,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.interest','treasury.facts.BillItem','interest','Interest','decimal',11,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.month','treasury.facts.BillItem','month','Month','integer',13,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.org','treasury.facts.BillItem','org','Org','string',10,'var',NULL,NULL,NULL,NULL,NULL,NULL,'enterprise.facts.Org',NULL),('treasury.facts.BillItem.parentaccount','treasury.facts.BillItem','parentaccount','Parent Account','string',9,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.BillItem.paypriority','treasury.facts.BillItem','paypriority','Pay Priority','integer',18,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.refid','treasury.facts.BillItem','refid','Ref ID','string',16,'var',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.remarks','treasury.facts.BillItem','remarks','Remarks','string',17,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.sortorder','treasury.facts.BillItem','sortorder','Sort Order','integer',19,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.BillItem.surcharge','treasury.facts.BillItem','surcharge','Surcharge','decimal',5,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.BillItem.tag','treasury.facts.BillItem','tag','Tag','string',20,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.todate','treasury.facts.BillItem','todate','To Date','date',15,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.BillItem.txntype','treasury.facts.BillItem','txntype','Txn Type','string',6,'lookup','billitem_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.BillItem.year','treasury.facts.BillItem','year','Year','integer',12,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.CollectionGroup.objid','treasury.facts.CollectionGroup','objid','Name','string',1,'lookup','collectiongroup:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('treasury.facts.DecimalInfo.name','treasury.facts.DecimalInfo','name','Name','string',1,'lookup','variableinfo_decimal:lookup','name','name',NULL,NULL,1,'string',NULL),('treasury.facts.DecimalInfo.value','treasury.facts.DecimalInfo','value','Value','decimal',2,'decimal',NULL,NULL,NULL,NULL,NULL,1,'decimal',NULL),('treasury.facts.DueDate.date','treasury.facts.DueDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.DueDate.day','treasury.facts.DueDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.month','treasury.facts.DueDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.qtr','treasury.facts.DueDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.DueDate.year','treasury.facts.DueDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.ExcessPayment.amount','treasury.facts.ExcessPayment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.HolidayFact.id','treasury.facts.HolidayFact','id','ID','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.InterestItem.account','treasury.facts.InterestItem','account','Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.InterestItem.amount','treasury.facts.InterestItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.InterestItem.parent','treasury.facts.InterestItem','parent','Parent BillItem','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.facts.MonthEntry.duedate','treasury.facts.MonthEntry','duedate','Due date','date',13,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.first','treasury.facts.MonthEntry','first','First','boolean',11,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.MonthEntry.fromdate','treasury.facts.MonthEntry','fromdate','From Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.fromday','treasury.facts.MonthEntry','fromday','From Day','integer',6,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.index','treasury.facts.MonthEntry','index','Index','integer',10,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.last','treasury.facts.MonthEntry','last','Last','boolean',12,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('treasury.facts.MonthEntry.maxdays','treasury.facts.MonthEntry','maxdays','Month Max Days','integer',9,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.month','treasury.facts.MonthEntry','month','Month','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.numdays','treasury.facts.MonthEntry','numdays','No. of Days','integer',8,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.qtr','treasury.facts.MonthEntry','qtr','Qtr','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.todate','treasury.facts.MonthEntry','todate','To Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.MonthEntry.today','treasury.facts.MonthEntry','today','To Day','integer',7,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.MonthEntry.year','treasury.facts.MonthEntry','year','Year','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.Payment.amount','treasury.facts.Payment','amount','Amount','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.RevenueShare.amount','treasury.facts.RevenueShare','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.RevenueShare.payableaccount','treasury.facts.RevenueShare','payableaccount','Payable Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.RevenueShare.refaccount','treasury.facts.RevenueShare','refaccount','Reference Account','string',1,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.SampleItem.name','treasury.facts.SampleItem','name','Name','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.SampleItem.numunit','treasury.facts.SampleItem','numunit','No. of Units','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.SampleItem.status','treasury.facts.SampleItem','status','Status','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.SurchargeItem.account','treasury.facts.SurchargeItem','account','Account','string',2,'lookup','revenueitem:lookup','objid','title',NULL,NULL,NULL,'object',NULL),('treasury.facts.SurchargeItem.amount','treasury.facts.SurchargeItem','amount','Amount','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.SurchargeItem.parent','treasury.facts.SurchargeItem','parent','Parent Bill Item','string',1,'var',NULL,NULL,NULL,NULL,NULL,NULL,'treasury.facts.AbstractBillItem',NULL),('treasury.facts.SurchargeItem.txntype','treasury.facts.SurchargeItem','txntype','Txn Type','string',4,'lookup','billitem_txntype:lookup','objid','title',NULL,NULL,NULL,'string',NULL),('treasury.facts.SystemDate.date','treasury.facts.SystemDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.SystemDate.day','treasury.facts.SystemDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.SystemDate.month','treasury.facts.SystemDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.SystemDate.qtr','treasury.facts.SystemDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.SystemDate.year','treasury.facts.SystemDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.date','treasury.facts.VarDate','date','Date','date',1,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('treasury.facts.VarDate.day','treasury.facts.VarDate','day','Day','integer',4,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.month','treasury.facts.VarDate','month','Month','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.qtr','treasury.facts.VarDate','qtr','Qtr','integer',5,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDate.tag','treasury.facts.VarDate','tag','Tag','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarDate.year','treasury.facts.VarDate','year','Year','integer',2,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarDecimal.tag','treasury.facts.VarDecimal','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarDecimal.value','treasury.facts.VarDecimal','value','Value','decimal',1,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('treasury.facts.VarInteger.tag','treasury.facts.VarInteger','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarInteger.value','treasury.facts.VarInteger','value','Value','integer',1,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('treasury.facts.VarString.tag','treasury.facts.VarString','tag','Tag','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('treasury.facts.VarString.value','treasury.facts.VarString','value','Value','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleApplication.appdate','vehicle.facts.VehicleApplication','appdate','App Date','date',4,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('vehicle.facts.VehicleApplication.apptype','vehicle.facts.VehicleApplication','apptype','App Type','string',1,'lov',NULL,NULL,NULL,NULL,NULL,NULL,'string','VEHICLE_APP_TYPE'),('vehicle.facts.VehicleApplication.appyear','vehicle.facts.VehicleApplication','appyear','App Year','integer',3,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('vehicle.facts.VehicleApplication.prevexpirydate','vehicle.facts.VehicleApplication','prevexpirydate','Prev Expiry Date','date',5,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('vehicle.facts.VehicleApplication.vehicletype','vehicle.facts.VehicleApplication','vehicletype','Vehicle Type','string',2,'lookup','vehicletype:lookup','objid','objid',NULL,NULL,NULL,'string','VEHICLE_TXNTYPE'),('vehicle.facts.VehicleFranchise.controlno','vehicle.facts.VehicleFranchise','controlno','Control No','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleFranchise.dtregistered','vehicle.facts.VehicleFranchise','dtregistered','Date Registered','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('vehicle.facts.VehicleUnit.bodyno','vehicle.facts.VehicleUnit','bodyno','Body No','string',4,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.chassisno','vehicle.facts.VehicleUnit','chassisno','Chassis No','string',9,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.color','vehicle.facts.VehicleUnit','color','Color','string',8,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.controlno','vehicle.facts.VehicleUnit','controlno','Control No','string',1,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.engineno','vehicle.facts.VehicleUnit','engineno','Engine No','string',3,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.make','vehicle.facts.VehicleUnit','make','Make','string',6,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.model','vehicle.facts.VehicleUnit','model','Model','string',7,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.plateno','vehicle.facts.VehicleUnit','plateno','Plate No','string',2,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.sidecarcolor','vehicle.facts.VehicleUnit','sidecarcolor','Sidecar Color','string',10,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL),('vehicle.facts.VehicleUnit.sidecarno','vehicle.facts.VehicleUnit','sidecarno','Sidecarno','string',5,'string',NULL,NULL,NULL,NULL,NULL,NULL,'string',NULL);
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('after-compute-fee','vehiclebilling','After Compute Fee',3),('apply-payment','vehiclebilling','Apply Payment',7),('ask-info','vehicleassessment','Ask Info',1),('ask-info','vehiclebilling','Ask Info',1),('compute-fee','vehicleassessment','Compute Fee',3),('compute-fee','vehiclebilling','Compute Fee',2),('discount','vehiclebilling','Compute Discount',4),('initial','vehicleassessment','Initial',0),('initial','vehiclebilling','Initial',0),('initial','vehicledates','Initial',0),('interest','vehiclebilling','Compute Interest',6),('post-ask-info','vehicleassessment','After Ask Info',2),('summary','vehicleassessment','Summary',4),('summary','vehiclebilling','Summary',8),('surcharge','vehiclebilling','Compute Surcharge',5);
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('vehicleassessment','Vehicle Assessment','vehicleassessment','VEHICLE','RULE_AUTHOR',NULL),('vehiclebilling','Vehicle Reg. Billing','vehiclebilling','VEHICLE','RULE_AUTHOR',NULL),('vehicledates','Vehicle Expiry Dates','vehicledates','VEHICLE','RULE_AUTHOR',NULL);
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`),
  KEY `actiondef` (`actiondef`),
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment','enterprise.actions.AddSystemInfo'),('vehicleassessment','enterprise.actions.AskInfo'),('vehiclebilling','enterprise.actions.AskInfo'),('vehicleassessment','enterprise.actions.ThrowException'),('vehicleassessment','treasury.actions.AddBillItem'),('vehiclebilling','treasury.actions.AddBillItem'),('vehiclebilling','treasury.actions.AddDiscountItem'),('vehiclebilling','treasury.actions.AddDueDate'),('vehicledates','treasury.actions.AddDueDate'),('vehiclebilling','treasury.actions.AddSurchargeItem'),('vehiclebilling','treasury.actions.ApplyPayment'),('vehiclebilling','treasury.actions.SetBillItemProperty'),('vehicleassessment','treasury.actions.SummarizeBillItem'),('vehiclebilling','treasury.actions.SummarizeBillItem');
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`),
  KEY `rulefact` (`rulefact`),
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment','com.rameses.rules.common.CurrentDate'),('vehicledates','com.rameses.rules.common.CurrentDate'),('vehicleassessment','enterprise.facts.BooleanInfo'),('vehiclebilling','enterprise.facts.BooleanInfo'),('vehicleassessment','enterprise.facts.DateInfo'),('vehicledates','enterprise.facts.DateInfo'),('vehicleassessment','enterprise.facts.IntegerInfo'),('vehiclebilling','enterprise.facts.IntegerInfo'),('vehicleassessment','enterprise.facts.StringArrayInfo'),('vehiclebilling','enterprise.facts.StringArrayInfo'),('vehicleassessment','enterprise.facts.StringInfo'),('vehiclebilling','enterprise.facts.StringInfo'),('vehiclebilling','treasury.facts.AppDate'),('vehicleassessment','treasury.facts.BillDate'),('vehiclebilling','treasury.facts.BillDate'),('vehicledates','treasury.facts.BillDate'),('vehicleassessment','treasury.facts.BillItem'),('vehiclebilling','treasury.facts.BillItem'),('vehicleassessment','treasury.facts.DecimalInfo'),('vehiclebilling','treasury.facts.DecimalInfo'),('vehiclebilling','treasury.facts.DueDate'),('vehiclebilling','treasury.facts.ExcessPayment'),('vehiclebilling','treasury.facts.InterestItem'),('vehiclebilling','treasury.facts.Payment'),('vehiclebilling','treasury.facts.SurchargeItem'),('vehicleassessment','treasury.facts.SystemDate'),('vehiclebilling','treasury.facts.SystemDate'),('vehicledates','treasury.facts.SystemDate'),('vehicleassessment','vehicle.facts.VehicleApplication'),('vehiclebilling','vehicle.facts.VehicleApplication'),('vehicledates','vehicle.facts.VehicleApplication'),('vehicleassessment','vehicle.facts.VehicleFranchise'),('vehiclebilling','vehicle.facts.VehicleFranchise'),('vehicleassessment','vehicle.facts.VehicleUnit'),('vehiclebilling','vehicle.facts.VehicleUnit'),('vehicledates','vehicle.facts.VehicleUnit');
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('08-003',2),('AFSERIALFORWARD',288),('ASSESSMENT_NOTICE-2017',2),('ASSESSMENT_NOTICE-2018',2),('B154201611',4767),('B154201612',134),('B154201701',692),('B154201702',182),('B154201703',171),('B154201704',94),('B154201705',95),('B154201706',107),('B154201707',66),('B154201708',71),('B154201709',64),('B154201710',46),('B154201711',48),('B154201712',13),('B154201801',165),('B154201802',114),('B154201803',84),('B154201804',70),('B154201805',41),('B1542019000000',3),('B1732019000000',5),('BCnull2019000000',5),('Bnull2019000000',4),('Bnull2019000001N',2),('BP-2016',5),('BP-2017',5690),('BP-2018',5351),('BP1732019000000',4),('BP_AMEND_LOG',4322),('BUSINESS_REDFLAG',1169),('CHANGEINFO201811',66),('CM',4),('DV',15),('INDIVIDUAL_ENTITY',65630),('IRAF',5),('JURIDICAL_ENTITY',2727),('LIQ',3),('LIQ-GLT',2),('LIQ-GMG',18),('LOANAPP',2),('MAPP0201C1',2),('MAPP2017',2),('MAPP2017C1',2),('MAPP2017null',2),('MAPP2018',14),('MAPP2018C1',3),('MMM2018',18),('MTOP-2018',74),('MULTIPLE_ENTITY',17850),('nullN',2),('PED-2018-06',5),('REM',11),('REM-AA',356),('REM-AJUEGO',7),('REM-CA',334),('REM-CBS',3),('REM-CG',3),('REM-GLT',52),('REM-MNIZAG',2),('REM-NB',345),('REM-TBM',340),('REM-VOM',32),('RPTBILL-17',58),('RPTBILL-18',6),('RPTCERTIFICATION',4),('RT154',33590),('TRI-2019010000',11),('TRI-2019020000',28),('UNIQUE_TDNO-154-01-001',945),('UNIQUE_TDNO-154-01-002',2543),('UNIQUE_TDNO-154-01-003',2039),('UNIQUE_TDNO-154-01-004',2554),('UNIQUE_TDNO-154-01-011',1560),('UNIQUE_TDNO-154-02-005',2771),('UNIQUE_TDNO-154-02-010',1154),('UNIQUE_TDNO-154-02-013',1125),('UNIQUE_TDNO-154-02-015',951),('UNIQUE_TDNO-154-03-007',6053),('UNIQUE_TDNO-154-03-008',4410),('UNIQUE_TDNO-154-04-006',580),('UNIQUE_TDNO-154-04-009',4352),('UNIQUE_TDNO-154-04-012',1706),('UNIQUE_TDNO-154-04-014',927),('VP-2018',9);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
INSERT INTO `sys_wf` VALUES ('vehicle_application','Vehicle Application','VEHICLE');
/*!40000 ALTER TABLE `sys_wf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ui` text,
  `properties` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`processname`,`name`),
  CONSTRAINT `FK_sys_wf_node_wf` FOREIGN KEY (`processname`) REFERENCES `sys_wf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
INSERT INTO `sys_wf_node` VALUES ('approval','vehicle_application','For Approval','state',4,0,'VEHICLE',NULL,'[fillColor:\"#c0c0c0\",type:\"state\",pos:[422,122],size:[100,50]]','[:]',1),('assessment','vehicle_application','Assessment','state',3,0,'VEHICLE',NULL,'[fillColor:\"#c0c0c0\",type:\"state\",pos:[278,39],size:[96,56]]','[show_assess:true]',1),('decide-payment','vehicle_application','Payment Decision','decision',6,0,NULL,NULL,'[fillColor:\"#c0c0c0\",type:\"decision\",pos:[765,183],size:[90,65]]','[:]',NULL),('draft','vehicle_application','Draft','state',2,0,'VEHICLE',NULL,'[fillColor:\"#c0c0c0\",type:\"state\",pos:[135,79],size:[87,50]]','[:]',NULL),('end','vehicle_application','End','end',8,0,'VEHICLE',NULL,'[fillColor:\"#ff0000\",type:\"end\",pos:[1099,210],size:[32,32]]','[:]',NULL),('payment','vehicle_application','For Payment','state',5,0,'VEHICLE',NULL,'[fillColor:\"#c0c0c0\",type:\"state\",pos:[594,146],size:[100,50]]','[:]',1),('release','vehicle_application','For Release','state',7,0,'VEHICLE',NULL,'[fillColor:\"#c0c0c0\",type:\"state\",pos:[951,99],size:[100,50]]','[show_issue_permit:true]',1),('start','vehicle_application','Start','start',1,0,'VEHICLE',NULL,'[fillColor:\"#00ff00\",type:\"start\",pos:[62,37],size:[32,32]]','[:]',NULL);
/*!40000 ALTER TABLE `sys_wf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`processname`,`parentid`,`to`,`action`),
  CONSTRAINT `FK_sys_wf_transition_wf_node` FOREIGN KEY (`processname`, `parentid`) REFERENCES `sys_wf_node` (`processname`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
INSERT INTO `sys_wf_transition` VALUES ('approval','vehicle_application','revert','assessment',0,NULL,'[:]',NULL,'Revert','[points:[422,151,316,151,316,94],type:\"arrow\",pos:[316,94],size:[106,57]]'),('approval','vehicle_application','submit','payment',0,NULL,'[:]',NULL,'Approve for Payment','[points:[522,148,594,169],type:\"arrow\",pos:[522,148],size:[72,21]]'),('approval','vehicle_application','approve-capture','release',0,NULL,'[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]',NULL,'Approve (Capture Paid)','[points:[482,172,551,338,717,405,980,287,976,150,976,149],type:\"arrow\",pos:[482,149],size:[498,256]]'),('assessment','vehicle_application','submit','approval',0,NULL,'[:]',NULL,'Submit for Approval','[points:[375,63,474,62,477,125],type:\"arrow\",pos:[375,62],size:[102,63]]'),('assessment','vehicle_application','revert','draft',1,NULL,'[:]',NULL,'Revert','[points:[278,80,222,96],type:\"arrow\",pos:[222,80],size:[56,16]]'),('decide-payment','vehicle_application','fail','payment',0,'amtdue != 0','[:]',NULL,'Payment Failed','[points:[809,249,810,298,644,299,642,196],type:\"arrow\",pos:[642,196],size:[168,103]]'),('decide-payment','vehicle_application','success','release',0,'amtdue == 0','[:]',NULL,'Success Pay','[points:[809,185,809,142,954,124],type:\"arrow\",pos:[809,124],size:[145,61]]'),('draft','vehicle_application','forapproval','approval',5,NULL,'[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]',NULL,'For Approval (Capture)','[points:[189,129,223,203,349,234,436,172],type:\"arrow\",pos:[189,129],size:[247,105]]'),('draft','vehicle_application','submit','assessment',0,NULL,'[:]',NULL,'Submit for Assessment','[points:[222,113,243,119,278,56],type:\"arrow\",pos:[222,56],size:[56,63]]'),('payment','vehicle_application','reverse-payment','approval',10,NULL,'[:]',NULL,'Reverse Payment','[points:[627,146,629,95,533,72,518,122],type:\"arrow\",pos:[518,72],size:[111,74]]'),('payment','vehicle_application','post','decide-payment',0,NULL,'[visible:false]',NULL,'Post Payment','[points:[694,184,727,185,729,218,769,219],type:\"arrow\",pos:[694,184],size:[75,35]]'),('release','vehicle_application','submit','end',0,NULL,'[:]',NULL,'Release','[points:[1020,149,1102,210],type:\"arrow\",pos:[1020,149],size:[82,61]]'),('start','vehicle_application','start','draft',0,NULL,'[:]',NULL,'Submit','[points:[94,57,135,91],type:\"arrow\",pos:[94,57],size:[41,34]]');
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application`
--

DROP TABLE IF EXISTS `vehicle_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application` (
  `objid` varchar(50) NOT NULL,
  `franchiseyearid` varchar(50) DEFAULT NULL,
  `geninfoid` varchar(50) DEFAULT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `appdate` date DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `particulars` varchar(150) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `dtapproved` date DEFAULT NULL,
  `permitid` varchar(50) DEFAULT NULL,
  `prevappid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_appno` (`appno`),
  KEY `ix_taskid` (`taskid`),
  KEY `ix_appdate` (`appdate`),
  KEY `ix_dtfiled` (`dtcreated`),
  KEY `ix_filedby_objid` (`createdby_objid`),
  KEY `ix_filedby_name` (`createdby_name`),
  KEY `fk_vehicle_application_controlid` (`franchiseyearid`),
  KEY `fk_vehicle_application_geninfoid` (`geninfoid`),
  KEY `fk_vehicle_application_prevappid` (`prevappid`),
  CONSTRAINT `fk_vehicle_application_geninfoid` FOREIGN KEY (`geninfoid`) REFERENCES `vehicle_franchise_generalinfo` (`objid`),
  CONSTRAINT `fk_vehicle_application_prevappid` FOREIGN KEY (`prevappid`) REFERENCES `vehicle_application` (`objid`),
  CONSTRAINT `fk_vehicle_application_task` FOREIGN KEY (`taskid`) REFERENCES `vehicle_application_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application`
--

LOCK TABLES `vehicle_application` WRITE;
/*!40000 ALTER TABLE `vehicle_application` DISABLE KEYS */;
INSERT INTO `vehicle_application` VALUES ('VAPP-225dbdaf:1695621ab86:-7ffd',NULL,NULL,'TRI-2019030001','2019-03-07','NEW','ONLINE','2019-03-07 11:10:41',NULL,NULL,NULL,NULL,'2019-03-07',NULL,NULL,50.00),('VAPP-4c143630:169861f4f39:-7fdc',NULL,NULL,'TRI-2019030004','2019-03-16','NEW','ONLINE','2019-03-16 18:57:12',NULL,NULL,'asas',NULL,'2019-03-16','VPERM3637f4d0:1698665001d:-7fb1',NULL,50.00),('VAPP-6182c0b7:1698bc1eaaa:-7fca',NULL,NULL,'TRI-2019030006','2019-03-17','CHANGE_OWNER','ONLINE','2019-03-17 21:35:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('VAPP19c565f3:1695c97d599:-7fe3',NULL,NULL,'TRI-2019030003','2019-03-08','CHANGE_OWNER','ONLINE','2019-03-08 17:24:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00),('VAPP48046b0e:1690a0fb606:-7ff1',NULL,NULL,'TRI-2019020029','2019-02-20','NEW','CAPTURE','2019-02-20 16:47:06',NULL,NULL,'sample',NULL,NULL,NULL,NULL,NULL),('VAPP48046b0e:1690a0fb606:-7ffd',NULL,NULL,'TRI-2019020028','2019-02-20','NEW','ONLINE','2019-02-20 16:39:55',NULL,NULL,NULL,NULL,NULL,'VPERM-2738a4fe:1691d554d32:-7fff',NULL,100.00),('VAPP7435c503:1698be6666b:-7ff6','VFYR7435c503:1698be6666b:-7ffa','VINFO7435c503:1698be6666b:-7ffb','TRI-2019030007','2019-03-17','NEW','ONLINE','2019-03-17 21:47:07',NULL,NULL,'sample mtop','VAPPTSK7435c503:1698be6666b:-7f7c','2019-03-17','VPERM7435c503:1698be6666b:-7f82',NULL,50.00),('VAPPb8d288:1691e06eaca:-7ffe',NULL,NULL,'TRI-2019020031','2019-02-24','CHANGE_OWNER_UNIT','ONLINE','2019-02-24 13:42:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vehicle_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application_fee`
--

DROP TABLE IF EXISTS `vehicle_application_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application_fee` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `amtpaid` decimal(16,4) DEFAULT NULL,
  `txntype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_appid` (`appid`),
  KEY `ix_item_objid` (`item_objid`),
  CONSTRAINT `fk_applicationfee_application` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application_fee`
--

LOCK TABLES `vehicle_application_fee` WRITE;
/*!40000 ALTER TABLE `vehicle_application_fee` DISABLE KEYS */;
INSERT INTO `vehicle_application_fee` VALUES ('VAPPF7435c503:1698be6666b:-7fc6','VAPP7435c503:1698be6666b:-7ff6','REVITEM-46b788af:140b8f5265d:-7f48','585-0002','OCCUPATION FEES - EMPLOYEES/PERSONNEL',50.0000,50.0000,NULL,1000),('VAPPF7435c503:1698be6666b:-7fc7','VAPP7435c503:1698be6666b:-7ff6','REVITEM217a91b:1409e6ae44e:-7ea7','584-0002','FRANCHISE TAX - MTOP',100.0000,100.0000,NULL,1000);
/*!40000 ALTER TABLE `vehicle_application_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application_info`
--

DROP TABLE IF EXISTS `vehicle_application_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application_info` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `decimalvalue` decimal(18,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `datevalue` date DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `lov_objid` varchar(50) DEFAULT NULL,
  `lookup_objid` varchar(50) DEFAULT NULL,
  `lookup_title` varchar(50) DEFAULT NULL,
  `objvalue` mediumtext,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_appid` (`appid`),
  KEY `ix_name` (`name`),
  CONSTRAINT `fk_vehcile_variable_name` FOREIGN KEY (`name`) REFERENCES `vehicle_variable` (`objid`),
  CONSTRAINT `fk_vehicle_application_info_parentid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application_info`
--

LOCK TABLES `vehicle_application_info` WRITE;
/*!40000 ALTER TABLE `vehicle_application_info` DISABLE KEYS */;
INSERT INTO `vehicle_application_info` VALUES ('VAPPI-4c143630:169861f4f39:-7f49','VAPP-4c143630:169861f4f39:-7fdc','NO_OF_EMPLOYEE',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),('VAPPI-61d5d657:16956523ddd:-7ffa','VAPP-225dbdaf:1695621ab86:-7ffd','NO_OF_EMPLOYEE',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),('VAPPI-61d5d657:16956523ddd:-8000','VAPP48046b0e:1690a0fb606:-7ffd','NO_OF_EMPLOYEE',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0),('VAPPI19c565f3:1695c97d599:-7fc7','VAPP19c565f3:1695c97d599:-7fe3','NO_OF_EMPLOYEE',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),('VAPPI7435c503:1698be6666b:-7fc8','VAPP7435c503:1698be6666b:-7ff6','NO_OF_EMPLOYEE',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `vehicle_application_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application_task`
--

DROP TABLE IF EXISTS `vehicle_application_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `FK_business_application_task_business_application` (`refid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_prevtaskid` (`prevtaskid`),
  CONSTRAINT `FK_business_application_task_vehicle_application` FOREIGN KEY (`refid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application_task`
--

LOCK TABLES `vehicle_application_task` WRITE;
/*!40000 ALTER TABLE `vehicle_application_task` DISABLE KEYS */;
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7f7c','VAPP7435c503:1698be6666b:-7ff6',NULL,'end',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-17 21:55:04','VAPPTSK7435c503:1698be6666b:-7f99'),('VAPPTSK7435c503:1698be6666b:-7f99','VAPP7435c503:1698be6666b:-7ff6',NULL,'release','2019-03-17 21:48:01','2019-03-17 21:55:04',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN','balance unpaid:0.0000','2019-03-17 21:48:01','VAPPTSK7435c503:1698be6666b:-7fae'),('VAPPTSK7435c503:1698be6666b:-7fae','VAPP7435c503:1698be6666b:-7ff6',NULL,'payment',NULL,'2019-03-17 21:48:01',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'2019-03-17 21:47:24','VAPPTSK7435c503:1698be6666b:-7fbc'),('VAPPTSK7435c503:1698be6666b:-7fbc','VAPP7435c503:1698be6666b:-7ff6',NULL,'approval',NULL,'2019-03-17 21:47:24',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'2019-03-17 21:47:21','VAPPTSK7435c503:1698be6666b:-7fd8'),('VAPPTSK7435c503:1698be6666b:-7fd8','VAPP7435c503:1698be6666b:-7ff6',NULL,'assessment',NULL,'2019-03-17 21:47:21',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'2019-03-17 21:47:12','VAPPTSK7435c503:1698be6666b:-7ff0'),('VAPPTSK7435c503:1698be6666b:-7ff0','VAPP7435c503:1698be6666b:-7ff6',NULL,'draft','2019-03-17 21:47:07','2019-03-17 21:47:12',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'2019-03-17 21:47:08','VAPPTSK7435c503:1698be6666b:-7ff4'),('VAPPTSK7435c503:1698be6666b:-7ff4','VAPP7435c503:1698be6666b:-7ff6',NULL,'start','2019-03-17 21:47:08','2019-03-17 21:47:08',NULL,NULL,'USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'2019-03-17 21:47:08',NULL);
/*!40000 ALTER TABLE `vehicle_application_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application_unit`
--

DROP TABLE IF EXISTS `vehicle_application_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application_unit` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_controlid` (`unitid`),
  KEY `ix_appid` (`appid`),
  CONSTRAINT `fk_vehicle_application_unit_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`),
  CONSTRAINT `fk_vehicle_application_unit_unitid` FOREIGN KEY (`unitid`) REFERENCES `vehicle_unit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application_unit`
--

LOCK TABLES `vehicle_application_unit` WRITE;
/*!40000 ALTER TABLE `vehicle_application_unit` DISABLE KEYS */;
INSERT INTO `vehicle_application_unit` VALUES ('VAUNIT7435c503:1698be6666b:-7ff5','VAPP7435c503:1698be6666b:-7ff6','VUNIT7435c503:1698be6666b:-7ff7');
/*!40000 ALTER TABLE `vehicle_application_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_application_unit_dropped`
--

DROP TABLE IF EXISTS `vehicle_application_unit_dropped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_application_unit_dropped` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appunitid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_unitid` (`appunitid`),
  UNIQUE KEY `uix_vehicle_application_unit_dropped_appunitid` (`appunitid`),
  KEY `fk_vehicle_application_unit_dropped_appid` (`appid`),
  CONSTRAINT `fk_vehicle_application_unit_dropped_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`),
  CONSTRAINT `fk_vehicle_application_unit_dropped_appunitid` FOREIGN KEY (`appunitid`) REFERENCES `vehicle_application_unit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_application_unit_dropped`
--

LOCK TABLES `vehicle_application_unit_dropped` WRITE;
/*!40000 ALTER TABLE `vehicle_application_unit_dropped` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_application_unit_dropped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_billitem_txntype`
--

DROP TABLE IF EXISTS `vehicle_billitem_txntype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_billitem_txntype`
--

LOCK TABLES `vehicle_billitem_txntype` WRITE;
/*!40000 ALTER TABLE `vehicle_billitem_txntype` DISABLE KEYS */;
INSERT INTO `vehicle_billitem_txntype` VALUES ('FEE','FEE'),('INTEREST','INTEREST'),('SURCHARGE','SURCHARGE');
/*!40000 ALTER TABLE `vehicle_billitem_txntype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_franchise`
--

DROP TABLE IF EXISTS `vehicle_franchise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_franchise` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `vehicletypeid` varchar(50) DEFAULT NULL,
  `currentyearid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_controlno` (`controlno`),
  KEY `ix_vehicletype` (`vehicletypeid`),
  KEY `fk_vehicle_franchise_currentyearid` (`currentyearid`),
  CONSTRAINT `fk_vehicle_franchise_currentyearid` FOREIGN KEY (`currentyearid`) REFERENCES `vehicle_franchise_year` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_franchise`
--

LOCK TABLES `vehicle_franchise` WRITE;
/*!40000 ALTER TABLE `vehicle_franchise` DISABLE KEYS */;
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190001','OPEN','MTOP-20190001','tricycle','VFYR7435c503:1698be6666b:-7ffa'),('MTOP-20190002','OPEN','MTOP-20190002','tricycle',NULL),('MTOP-20190003','OPEN','MTOP-20190003','tricycle',NULL),('MTOP-20190004','OPEN','MTOP-20190004','tricycle',NULL),('MTOP-20190005','OPEN','MTOP-20190005','tricycle',NULL),('MTOP-20190006','OPEN','MTOP-20190006','tricycle',NULL),('MTOP-20190007','OPEN','MTOP-20190007','tricycle',NULL),('MTOP-20190008','OPEN','MTOP-20190008','tricycle',NULL),('MTOP-20190009','OPEN','MTOP-20190009','tricycle',NULL),('MTOP-20190010','OPEN','MTOP-20190010','tricycle',NULL);
/*!40000 ALTER TABLE `vehicle_franchise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_franchise_generalinfo`
--

DROP TABLE IF EXISTS `vehicle_franchise_generalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_franchise_generalinfo` (
  `objid` varchar(50) NOT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_address_objid` varchar(50) DEFAULT NULL,
  `owner_address_text` varchar(255) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_owner_name` (`owner_name`),
  KEY `ix_owner_address_objid` (`owner_address_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_franchise_generalinfo`
--

LOCK TABLES `vehicle_franchise_generalinfo` WRITE;
/*!40000 ALTER TABLE `vehicle_franchise_generalinfo` DISABLE KEYS */;
INSERT INTO `vehicle_franchise_generalinfo` VALUES ('VINFO7435c503:1698be6666b:-7ffb','IND-1001d137:15dde15991e:-1488','LUNGAT, LIGAYA','ADDR-1dd97113:15dde44601e:-19d7','DAO, TAGBILARAN CITY',NULL,NULL,NULL,'MTOP-20190001');
/*!40000 ALTER TABLE `vehicle_franchise_generalinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_franchise_year`
--

DROP TABLE IF EXISTS `vehicle_franchise_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_franchise_year` (
  `objid` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  `geninfoid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `permitid` varchar(11) DEFAULT NULL,
  `renewaldate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_franchiseid_year` (`franchiseid`,`year`),
  KEY `fk_franchise_year_geninfoid` (`geninfoid`),
  KEY `fk_vehicle_franchise_year_appid` (`appid`),
  KEY `fk_vehicle_franchise_year_permitid` (`permitid`),
  CONSTRAINT `fk_franchise_year_geninfoid` FOREIGN KEY (`geninfoid`) REFERENCES `vehicle_franchise_generalinfo` (`objid`),
  CONSTRAINT `fk_vehicle_franchise_year_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`),
  CONSTRAINT `fk_vehicle_franchise_year_permitid` FOREIGN KEY (`permitid`) REFERENCES `vehicle_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_franchise_year`
--

LOCK TABLES `vehicle_franchise_year` WRITE;
/*!40000 ALTER TABLE `vehicle_franchise_year` DISABLE KEYS */;
INSERT INTO `vehicle_franchise_year` VALUES ('VFYR7435c503:1698be6666b:-7ffa',2019,'MTOP-20190001','VINFO7435c503:1698be6666b:-7ffb','VAPP7435c503:1698be6666b:-7ff6',NULL,'2020-01-01');
/*!40000 ALTER TABLE `vehicle_franchise_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_payment`
--

DROP TABLE IF EXISTS `vehicle_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_payment` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_appid` (`appid`),
  KEY `ix_franchiseid` (`franchiseid`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  CONSTRAINT `fk_vehecle_application_payment_ibfk_1` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_payment`
--

LOCK TABLES `vehicle_payment` WRITE;
/*!40000 ALTER TABLE `vehicle_payment` DISABLE KEYS */;
INSERT INTO `vehicle_payment` VALUES ('RCT49a1ccb4:1698be7738f:-7ff8','VAPP7435c503:1698be6666b:-7ff6',NULL,NULL,'RCT49a1ccb4:1698be7738f:-7ff8','cashreceipt','A5100110','2019-03-17',150.0000,0,'ONLINE',NULL);
/*!40000 ALTER TABLE `vehicle_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_payment_item`
--

DROP TABLE IF EXISTS `vehicle_payment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `apprefid` varchar(50) DEFAULT NULL,
  `franchiserefid` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `surcharge` decimal(16,4) DEFAULT NULL,
  `interest` decimal(16,4) DEFAULT NULL,
  `discount` decimal(16,4) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_apprefid` (`apprefid`),
  KEY `ix_franchiserefid` (`franchiserefid`),
  KEY `ix_item_objid` (`item_objid`),
  CONSTRAINT `fk_franchise_fee_paymentitem` FOREIGN KEY (`franchiserefid`) REFERENCES `vehicle_franchise` (`objid`),
  CONSTRAINT `fk_vehicle_application_fee_payment` FOREIGN KEY (`apprefid`) REFERENCES `vehicle_application_fee` (`objid`),
  CONSTRAINT `fk_vehicle_application_payment_item_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `vehicle_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_payment_item`
--

LOCK TABLES `vehicle_payment_item` WRITE;
/*!40000 ALTER TABLE `vehicle_payment_item` DISABLE KEYS */;
INSERT INTO `vehicle_payment_item` VALUES ('RCTI49a1ccb4:1698be7738f:-7fef','RCT49a1ccb4:1698be7738f:-7ff8',NULL,NULL,'REVITEM217a91b:1409e6ae44e:-7ea7','584-0002','FRANCHISE TAX - MTOP',100.0000,0.0000,0.0000,0.0000,'VAPPF7435c503:1698be6666b:-7fc7','vehicle_application_fee',NULL),('RCTI49a1ccb4:1698be7738f:-7ff0','RCT49a1ccb4:1698be7738f:-7ff8',NULL,NULL,'REVITEM-46b788af:140b8f5265d:-7f48','585-0002','OCCUPATION FEES - EMPLOYEES/PERSONNEL',50.0000,0.0000,0.0000,0.0000,'VAPPF7435c503:1698be6666b:-7fc6','vehicle_application_fee',NULL);
/*!40000 ALTER TABLE `vehicle_payment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_permit`
--

DROP TABLE IF EXISTS `vehicle_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_permit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `permitno` varchar(50) DEFAULT NULL,
  `permittype` varchar(50) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(50) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_permitno` (`permitno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_expirydate` (`expirydate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_permit`
--

LOCK TABLES `vehicle_permit` WRITE;
/*!40000 ALTER TABLE `vehicle_permit` DISABLE KEYS */;
INSERT INTO `vehicle_permit` VALUES ('VPERM7435c503:1698be6666b:-7f82','ACTIVE','MTOP-00000002','STANDARD','2019-03-17','USR-1b82c604:14cc29913bb:-7fec','ADMIN . ADMIN',NULL,'VAPP7435c503:1698be6666b:-7ff6','ONLINE');
/*!40000 ALTER TABLE `vehicle_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_unit`
--

DROP TABLE IF EXISTS `vehicle_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_unit` (
  `objid` varchar(50) NOT NULL,
  `plateno` varchar(50) DEFAULT NULL,
  `engineno` varchar(50) DEFAULT NULL,
  `bodyno` varchar(50) DEFAULT NULL,
  `sidecarno` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `chassisno` varchar(50) DEFAULT NULL,
  `sidecarcolor` varchar(50) DEFAULT NULL,
  `crname` varchar(50) DEFAULT NULL,
  `driver_objid` varchar(50) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_unit`
--

LOCK TABLES `vehicle_unit` WRITE;
/*!40000 ALTER TABLE `vehicle_unit` DISABLE KEYS */;
INSERT INTO `vehicle_unit` VALUES ('VUNIT7435c503:1698be6666b:-7ff7','888-999-001','ENG01','BODY777',NULL,'HONDA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TEST');
/*!40000 ALTER TABLE `vehicle_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_variable`
--

DROP TABLE IF EXISTS `vehicle_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_variable` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `system` int(11) DEFAULT '0',
  `arrayvalues` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_variable`
--

LOCK TABLES `vehicle_variable` WRITE;
/*!40000 ALTER TABLE `vehicle_variable` DISABLE KEYS */;
INSERT INTO `vehicle_variable` VALUES ('NO_OF_EMPLOYEE','DRAFT','NO_OF_EMPLOYEE','NO. OF EMPLOYEE',NULL,'integer',NULL,0,0,'[]'),('NO_OF_PERSON','DRAFT','NO_OF_PERSON','NO. OF PERSON',NULL,'integer',NULL,0,0,'[]'),('NUM_UNITS','DRAFT','NUM_UNITS','NUM UNITS',NULL,'integer',NULL,1,0,'[]');
/*!40000 ALTER TABLE `vehicle_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicletype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `controlpattern` varchar(50) DEFAULT NULL,
  `indexno` int(11) DEFAULT NULL,
  `appnopattern` varchar(50) DEFAULT NULL,
  `issued` int(11) DEFAULT '0',
  `allowedfields` varchar(300) DEFAULT NULL,
  `icon` blob,
  `permitnopattern` varchar(50) DEFAULT NULL,
  `renewalfrequency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES ('boat','BOAT',NULL,0,NULL,0,'.*',NULL,NULL,'YEAR'),('ebike','E-BIKE','EB-[yyyy][MM][%06d]',NULL,'EBAPP-[yyyy][MM][%06d]',0,'.*',NULL,NULL,'YEAR'),('motorcycle','MOTORIZED TRICYCLE OPERATORS PERMIT','MMM[yyyy][%06d]',NULL,'MAPP[yyyy][cluster][%06d]',0,'plateno|engineno|bodyno|driver.name|remarks',NULL,'MP[yyyy]-[MM]-[cluster][%06d]','YEAR'),('pedicab','PEDICAB','PED-[yyyy]-[MM][%06d]',2,'PEDAPP-[yyyy]-[MM][%06d]',0,'plateno|engineno|bodyno|sidecarno|make|model|color|chassisno|sidecarcolor|crname|driver.name|remarks',NULL,NULL,'YEAR'),('sikad','SIKAD','SK-[yyyy][MM][%05d]',NULL,'SKA-[yyyy][MM][%05d]',0,'.*',NULL,NULL,'YEAR'),('tricycle','MTOP','MTOP-[yyyy][%04d]',1,'TRI-[yyyy][MM][%04d]',10,'plateno|engineno|bodyno|make',NULL,'MTOP-[%08d]','YEAR'),('van','VAN','V[yyyy][%8d]',NULL,'VA[yyyy][%8d]',0,'plateno|engineno|bodyno|sidecarno|make|model|color|chassisno|sidecarcolor|crname|driver.name|remarks',NULL,'VAN-[yyyy][%8d]','YEAR');
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_vehicle_application`
--

DROP TABLE IF EXISTS `vw_vehicle_application`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_application`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_application` AS SELECT 
 1 AS `objid`,
 1 AS `franchiseyearid`,
 1 AS `geninfoid`,
 1 AS `appno`,
 1 AS `appdate`,
 1 AS `apptype`,
 1 AS `txnmode`,
 1 AS `dtcreated`,
 1 AS `createdby_objid`,
 1 AS `createdby_name`,
 1 AS `particulars`,
 1 AS `taskid`,
 1 AS `dtapproved`,
 1 AS `permitid`,
 1 AS `prevappid`,
 1 AS `amount`,
 1 AS `franchiseid`,
 1 AS `vehicletypeid`,
 1 AS `controlno`,
 1 AS `year`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `owner_address_objid`,
 1 AS `owner_address_text`,
 1 AS `mobileno`,
 1 AS `phoneno`,
 1 AS `email`,
 1 AS `task_state`,
 1 AS `task_startdate`,
 1 AS `task_enddate`,
 1 AS `task_assignee_objid`,
 1 AS `task_assignee_name`,
 1 AS `task_actor_objid`,
 1 AS `task_actor_name`,
 1 AS `renewaldate`,
 1 AS `permit_permitno`,
 1 AS `permit_permittype`,
 1 AS `permit_dtissued`,
 1 AS `permit_expirydate`,
 1 AS `permit_issuedby_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_franchise`
--

DROP TABLE IF EXISTS `vw_vehicle_franchise`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_franchise` AS SELECT 
 1 AS `objid`,
 1 AS `state`,
 1 AS `controlno`,
 1 AS `vehicletypeid`,
 1 AS `currentyearid`,
 1 AS `year`,
 1 AS `geninfoid`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `owner_address_objid`,
 1 AS `owner_address_text`,
 1 AS `renewaldate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_franchise_unit_active`
--

DROP TABLE IF EXISTS `vw_vehicle_franchise_unit_active`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise_unit_active`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_franchise_unit_active` AS SELECT 
 1 AS `objid`,
 1 AS `appid`,
 1 AS `unitid`,
 1 AS `franchiseid`,
 1 AS `apptype`,
 1 AS `appno`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_franchise_year`
--

DROP TABLE IF EXISTS `vw_vehicle_franchise_year`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_franchise_year` AS SELECT 
 1 AS `objid`,
 1 AS `year`,
 1 AS `controlno`,
 1 AS `vehicletypeid`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `owner_address_objid`,
 1 AS `owner_address_text`,
 1 AS `renewaldate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_permit`
--

DROP TABLE IF EXISTS `vw_vehicle_permit`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_permit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_permit` AS SELECT 
 1 AS `objid`,
 1 AS `state`,
 1 AS `permitno`,
 1 AS `permittype`,
 1 AS `dtissued`,
 1 AS `issuedby_objid`,
 1 AS `issuedby_name`,
 1 AS `expirydate`,
 1 AS `appid`,
 1 AS `txnmode`,
 1 AS `controlno`,
 1 AS `appno`,
 1 AS `appdate`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `owner_address_text`,
 1 AS `phoneno`,
 1 AS `email`,
 1 AS `mobileno`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_unit`
--

DROP TABLE IF EXISTS `vw_vehicle_unit`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_unit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_unit` AS SELECT 
 1 AS `year`,
 1 AS `controlno`,
 1 AS `owner_objid`,
 1 AS `owner_name`,
 1 AS `objid`,
 1 AS `plateno`,
 1 AS `engineno`,
 1 AS `bodyno`,
 1 AS `sidecarno`,
 1 AS `make`,
 1 AS `model`,
 1 AS `color`,
 1 AS `chassisno`,
 1 AS `sidecarcolor`,
 1 AS `crname`,
 1 AS `driver_objid`,
 1 AS `driver_name`,
 1 AS `remarks`,
 1 AS `vehicletype_objid`,
 1 AS `vehicletype_title`,
 1 AS `vehicletype_allowedfields`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_vehicle_unit_snapshot`
--

DROP TABLE IF EXISTS `vw_vehicle_unit_snapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_vehicle_unit_snapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vehicle_unit_snapshot` AS SELECT 
 1 AS `objid`,
 1 AS `appno`,
 1 AS `apptype`,
 1 AS `appid`,
 1 AS `permitid`,
 1 AS `histappno`,
 1 AS `appdate`,
 1 AS `franchiseyearid`,
 1 AS `unit_objid`,
 1 AS `unit_plateno`,
 1 AS `unit_engineno`,
 1 AS `unit_bodyno`,
 1 AS `unit_sidecarno`,
 1 AS `unit_make`,
 1 AS `unit_model`,
 1 AS `unit_color`,
 1 AS `unit_chassisno`,
 1 AS `unit_sidecarcolor`,
 1 AS `unit_crname`,
 1 AS `unit_driver_objid`,
 1 AS `unit_driver_name`,
 1 AS `unit_remarks`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_vehicle_application`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_application`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_application` AS select `va`.`objid` AS `objid`,`va`.`franchiseyearid` AS `franchiseyearid`,`va`.`geninfoid` AS `geninfoid`,`va`.`appno` AS `appno`,`va`.`appdate` AS `appdate`,`va`.`apptype` AS `apptype`,`va`.`txnmode` AS `txnmode`,`va`.`dtcreated` AS `dtcreated`,`va`.`createdby_objid` AS `createdby_objid`,`va`.`createdby_name` AS `createdby_name`,`va`.`particulars` AS `particulars`,`va`.`taskid` AS `taskid`,`va`.`dtapproved` AS `dtapproved`,`va`.`permitid` AS `permitid`,`va`.`prevappid` AS `prevappid`,`va`.`amount` AS `amount`,`vf`.`objid` AS `franchiseid`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vf`.`controlno` AS `controlno`,`vfy`.`year` AS `year`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfgi`.`mobileno` AS `mobileno`,`vfgi`.`phoneno` AS `phoneno`,`vfgi`.`email` AS `email`,`vat`.`state` AS `task_state`,`vat`.`startdate` AS `task_startdate`,`vat`.`enddate` AS `task_enddate`,`vat`.`assignee_objid` AS `task_assignee_objid`,`vat`.`assignee_name` AS `task_assignee_name`,`vat`.`actor_objid` AS `task_actor_objid`,`vat`.`actor_name` AS `task_actor_name`,`vfy`.`renewaldate` AS `renewaldate`,`vp`.`permitno` AS `permit_permitno`,`vp`.`permittype` AS `permit_permittype`,`vp`.`dtissued` AS `permit_dtissued`,`vp`.`expirydate` AS `permit_expirydate`,`vp`.`issuedby_name` AS `permit_issuedby_name` from (((((`vehicle_application` `va` join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`))) join `vehicle_franchise_generalinfo` `vfgi` on((`va`.`geninfoid` = `vfgi`.`objid`))) left join `vehicle_application_task` `vat` on((`va`.`taskid` = `vat`.`taskid`))) left join `vehicle_permit` `vp` on((`vp`.`objid` = `va`.`permitid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_franchise`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_franchise` AS select `vf`.`objid` AS `objid`,`vf`.`state` AS `state`,`vf`.`controlno` AS `controlno`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vf`.`currentyearid` AS `currentyearid`,`vfy`.`year` AS `year`,`vfgi`.`objid` AS `geninfoid`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfy`.`renewaldate` AS `renewaldate` from ((`vehicle_franchise` `vf` left join `vehicle_franchise_year` `vfy` on((`vf`.`currentyearid` = `vfy`.`objid`))) left join `vehicle_franchise_generalinfo` `vfgi` on((`vfy`.`geninfoid` = `vfgi`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_franchise_unit_active`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise_unit_active`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_franchise_unit_active` AS select `vau`.`objid` AS `objid`,`vau`.`appid` AS `appid`,`vau`.`unitid` AS `unitid`,`vf`.`objid` AS `franchiseid`,`va`.`apptype` AS `apptype`,`va`.`appno` AS `appno` from ((((`vehicle_application_unit` `vau` join `vehicle_application` `va` on((`vau`.`appid` = `va`.`objid`))) join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vf`.`currentyearid` = `vfy`.`objid`))) left join `vehicle_application_unit_dropped` `vaud` on((`vaud`.`appunitid` = `vau`.`objid`))) where isnull(`vaud`.`objid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_franchise_year`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_franchise_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_franchise_year` AS select `vfy`.`objid` AS `objid`,`vfy`.`year` AS `year`,`vf`.`controlno` AS `controlno`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfy`.`renewaldate` AS `renewaldate` from ((`vehicle_franchise_year` `vfy` join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`))) join `vehicle_franchise_generalinfo` `vfgi` on((`vfy`.`geninfoid` = `vfgi`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_permit`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_permit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_permit` AS select `vp`.`objid` AS `objid`,`vp`.`state` AS `state`,`vp`.`permitno` AS `permitno`,`vp`.`permittype` AS `permittype`,`vp`.`dtissued` AS `dtissued`,`vp`.`issuedby_objid` AS `issuedby_objid`,`vp`.`issuedby_name` AS `issuedby_name`,`vp`.`expirydate` AS `expirydate`,`vp`.`appid` AS `appid`,`vp`.`txnmode` AS `txnmode`,`vf`.`controlno` AS `controlno`,`va`.`appno` AS `appno`,`va`.`appdate` AS `appdate`,`vg`.`owner_objid` AS `owner_objid`,`vg`.`owner_name` AS `owner_name`,`vg`.`owner_address_text` AS `owner_address_text`,`vg`.`phoneno` AS `phoneno`,`vg`.`email` AS `email`,`vg`.`mobileno` AS `mobileno` from ((((`vehicle_permit` `vp` join `vehicle_application` `va` on((`vp`.`appid` = `va`.`objid`))) join `vehicle_franchise_generalinfo` `vg` on((`va`.`geninfoid` = `vg`.`objid`))) join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_unit`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_unit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_unit` AS select `fy`.`year` AS `year`,`vf`.`controlno` AS `controlno`,`vgi`.`owner_objid` AS `owner_objid`,`vgi`.`owner_name` AS `owner_name`,`vu`.`objid` AS `objid`,`vu`.`plateno` AS `plateno`,`vu`.`engineno` AS `engineno`,`vu`.`bodyno` AS `bodyno`,`vu`.`sidecarno` AS `sidecarno`,`vu`.`make` AS `make`,`vu`.`model` AS `model`,`vu`.`color` AS `color`,`vu`.`chassisno` AS `chassisno`,`vu`.`sidecarcolor` AS `sidecarcolor`,`vu`.`crname` AS `crname`,`vu`.`driver_objid` AS `driver_objid`,`vu`.`driver_name` AS `driver_name`,`vu`.`remarks` AS `remarks`,`vt`.`objid` AS `vehicletype_objid`,`vt`.`title` AS `vehicletype_title`,`vt`.`allowedfields` AS `vehicletype_allowedfields` from ((((((`vehicle_unit` `vu` join `vehicle_application_unit` `vau` on((`vau`.`unitid` = `vu`.`objid`))) join `vehicle_application` `va` on((`vau`.`appid` = `va`.`objid`))) join `vehicle_franchise_year` `fy` on((`va`.`franchiseyearid` = `fy`.`objid`))) join `vehicle_franchise_generalinfo` `vgi` on((`fy`.`geninfoid` = `vgi`.`objid`))) join `vehicle_franchise` `vf` on((`fy`.`franchiseid` = `vf`.`objid`))) join `vehicletype` `vt` on((`vf`.`vehicletypeid` = `vt`.`objid`))) where (not(`vau`.`objid` in (select `vehicle_application_unit_dropped`.`appunitid` from `vehicle_application_unit_dropped`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vehicle_unit_snapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_vehicle_unit_snapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vehicle_unit_snapshot` AS select `vau`.`objid` AS `objid`,`va`.`appno` AS `appno`,`va`.`apptype` AS `apptype`,`va`.`objid` AS `appid`,`va`.`permitid` AS `permitid`,`va2`.`appno` AS `histappno`,`va`.`appdate` AS `appdate`,`va`.`franchiseyearid` AS `franchiseyearid`,`vu`.`objid` AS `unit_objid`,`vu`.`plateno` AS `unit_plateno`,`vu`.`engineno` AS `unit_engineno`,`vu`.`bodyno` AS `unit_bodyno`,`vu`.`sidecarno` AS `unit_sidecarno`,`vu`.`make` AS `unit_make`,`vu`.`model` AS `unit_model`,`vu`.`color` AS `unit_color`,`vu`.`chassisno` AS `unit_chassisno`,`vu`.`sidecarcolor` AS `unit_sidecarcolor`,`vu`.`crname` AS `unit_crname`,`vu`.`driver_objid` AS `unit_driver_objid`,`vu`.`driver_name` AS `unit_driver_name`,`vu`.`remarks` AS `unit_remarks` from (((((`vehicle_application` `va` join `vehicle_application` `va2` on((`va2`.`franchiseyearid` = `va`.`franchiseyearid`))) join `vehicle_application_unit` `vau` on((`vau`.`appid` = `va2`.`objid`))) join `vehicle_unit` `vu` on((`vau`.`unitid` = `vu`.`objid`))) left join `vehicle_application_unit_dropped` `vaud` on((`vaud`.`appunitid` = `vau`.`objid`))) left join `vehicle_application` `vauda` on((`vaud`.`appid` = `vauda`.`objid`))) where ((`va2`.`dtcreated` <= `va`.`dtcreated`) and (isnull(`vauda`.`dtcreated`) or (`vauda`.`dtcreated` > `va`.`dtcreated`))) order by `va`.`dtcreated` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19  5:59:02
