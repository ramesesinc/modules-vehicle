/*
 Navicat Premium Data Transfer

 Source Server         : cloud-mysql
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : dev_vehicle

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 08/08/2019 13:06:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule`;
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

-- ----------------------------
-- Records of sys_rule
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule` VALUES ('RUL-33134f90:164ab2ede1c:-7e5d', 'DEPLOYED', 'VEHICLE_COUNT', 'vehicleassessment', 'initial', 'vehicle count', NULL, 50000, NULL, NULL, '2018-07-18 10:47:12', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-57c2d992:164ee592b63:-7e1f', 'DEPLOYED', 'MOTORCYCLE_RENEWAL_DATE', 'vehicledates', 'initial', 'MOTORCYCLE RENEWAL DATE', NULL, 50000, NULL, NULL, '2018-07-31 11:29:18', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-65f47c69:164ab007b19:-7bac', 'DEPLOYED', 'MOTORFEES', 'vehicleassessment', 'compute-fee', 'motorfees', NULL, 50000, NULL, NULL, '2018-07-18 09:53:45', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-6edb29df:1644165c650:-7e71', 'APPROVED', 'COMPUTE_SURCHARGE', 'vehiclebilling', 'surcharge', 'compute surcharge', NULL, 50000, NULL, NULL, '2018-06-27 21:28:38', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-76667e5d:16440b3c84b:-7dba', 'DEPLOYED', 'MTOP_FEES', 'vehicleassessment', 'compute-fee', 'mtop fees', NULL, 50000, NULL, NULL, '2018-06-27 18:21:32', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL7cad66dc:1643f542faa:-7e2d', 'DEPLOYED', 'ASK_NUM_EMPLOYEE', 'vehicleassessment', 'ask-info', 'ASK_NUM_EMPLOYEE', NULL, 50000, NULL, NULL, '2018-06-27 11:45:43', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RULdf6c2d8:164d540df24:-7ddd', 'DEPLOYED', 'SET_DUE_DATE', 'vehiclebilling', 'initial', 'SET DUE DATE', NULL, 50000, NULL, NULL, '2018-07-26 14:28:10', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_action
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_action`;
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

-- ----------------------------
-- Records of sys_rule_action
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_action` VALUES ('RA-1c7c09d1:164ee5525b1:-7fd1', 'RUL-57c2d992:164ee592b63:-7e1f', 'treasury.actions.AddDueDate', 'add-duedate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-2a56c5cd:164ac391848:-7ddd', 'RUL-33134f90:164ab2ede1c:-7e5d', 'enterprise.actions.AddSystemInfo', 'add-systeminfo', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-65f47c69:164ab007b19:-7917', 'RUL-65f47c69:164ab007b19:-7bac', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-76667e5d:16440b3c84b:-7c83', 'RUL-76667e5d:16440b3c84b:-7dba', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-dfb3c52:1643f92cbeb:-7e06', 'RUL7cad66dc:1643f542faa:-7e2d', 'enterprise.actions.AskInfo', 'ask-info', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT31768105:16440d16692:-7e12', 'RUL-76667e5d:16440b3c84b:-7dba', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACTdf6c2d8:164d540df24:-760b', 'RUL-6edb29df:1644165c650:-7e71', 'treasury.actions.AddSurchargeItem', 'add-surcharge-item', 0);
INSERT INTO `sys_rule_action` VALUES ('RACTdf6c2d8:164d540df24:-7c93', 'RULdf6c2d8:164d540df24:-7ddd', 'treasury.actions.AddDueDate', 'add-duedate', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_action_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_action_param`;
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

-- ----------------------------
-- Records of sys_rule_action_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_action_param` VALUES ('RAP-1c7c09d1:164ee5525b1:-7fcf', 'RA-1c7c09d1:164ee5525b1:-7fd1', 'treasury.actions.AddDueDate.date', NULL, NULL, NULL, NULL, 'return @DATE( YR , 12, 31 );\n ', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP-1c7c09d1:164ee5525b1:-7fd0', 'RA-1c7c09d1:164ee5525b1:-7fd1', 'treasury.actions.AddDueDate.tag', 'renewaldate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2a56c5cd:164ac391848:-7d8c', 'RACT-2a56c5cd:164ac391848:-7ddd', 'enterprise.actions.AddSystemInfo.aggtype', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COUNT', NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-2a56c5cd:164ac391848:-7dc5', 'RACT-2a56c5cd:164ac391848:-7ddd', 'enterprise.actions.AddSystemInfo.name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NUM_UNITS', 'NUM_UNITS', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-57c2d992:164ee592b63:-7b5b', 'RACT31768105:16440d16692:-7e12', 'treasury.actions.AddBillItem.month', NULL, NULL, NULL, NULL, '1', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-57c2d992:164ee592b63:-7bc7', 'RACT-76667e5d:16440b3c84b:-7c83', 'treasury.actions.AddBillItem.month', NULL, NULL, NULL, NULL, '1', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-57c2d992:164ee592b63:-7c67', 'RACT-65f47c69:164ab007b19:-7917', 'treasury.actions.AddBillItem.month', NULL, NULL, NULL, NULL, '1', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-615daaf4:164b01f32ef:-7a30', 'RACT31768105:16440d16692:-7e12', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-615daaf4:164b01f32ef:-7ab0', 'RACT-76667e5d:16440b3c84b:-7c83', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-615daaf4:164b01f32ef:-7cfb', 'RACT-65f47c69:164ab007b19:-7917', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-65f47c69:164ab007b19:-7887', 'RACT-65f47c69:164ab007b19:-7917', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '150 * NUM_UNITS', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-65f47c69:164ab007b19:-78e1', 'RACT-65f47c69:164ab007b19:-7917', 'treasury.actions.AddBillItem.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM-46b788af:140b8f5265d:-7f5e', 'PERMIT FOR MOTORCADE/PARADE/RALLY', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-76667e5d:16440b3c84b:-7c3b', 'RACT-76667e5d:16440b3c84b:-7c83', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-76667e5d:16440b3c84b:-7c6c', 'RACT-76667e5d:16440b3c84b:-7c83', 'treasury.actions.AddBillItem.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM217a91b:1409e6ae44e:-7ea7', 'FRANCHISE TAX - MTOP', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-dfb3c52:1643f92cbeb:-7ceb', 'RACT-dfb3c52:1643f92cbeb:-7e06', 'enterprise.actions.AskInfo.value', NULL, NULL, NULL, NULL, '0', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-dfb3c52:1643f92cbeb:-7df5', 'RACT-dfb3c52:1643f92cbeb:-7e06', 'enterprise.actions.AskInfo.name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_OF_EMPLOYEE', 'NO_OF_EMPLOYEE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT31768105:16440d16692:-7dc8', 'RACT31768105:16440d16692:-7e12', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, 'NUMEMPLOYEE * 50', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT31768105:16440d16692:-7dfb', 'RACT31768105:16440d16692:-7e12', 'treasury.actions.AddBillItem.account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM-46b788af:140b8f5265d:-7f48', 'OCCUPATION FEES - EMPLOYEES/PERSONNEL', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTdf6c2d8:164d540df24:-74a1', 'RACTdf6c2d8:164d540df24:-760b', 'ACTPARAM68129e35:15876a50bc6:-7e3f', NULL, NULL, 'RCOND-6edb29df:1644165c650:-7dd2', 'BILLITEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTdf6c2d8:164d540df24:-75a7', 'RACTdf6c2d8:164d540df24:-760b', 'ACTPARAM68129e35:15876a50bc6:-7e1d', NULL, NULL, NULL, NULL, 'AMT * 0.25', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTdf6c2d8:164d540df24:-75e5', 'RACTdf6c2d8:164d540df24:-760b', 'ACTPARAM68129e35:15876a50bc6:-7e30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REVITEM217a91b:1409e6ae44e:-7e84', 'BUSINESS TAX - SURCHARGE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACTdf6c2d8:164d540df24:-7c81', 'RACTdf6c2d8:164d540df24:-7c93', 'treasury.actions.AddDueDate.date', NULL, NULL, NULL, NULL, '@DATE(  YR, 1, 20 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_actiondef
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_actiondef`;
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

-- ----------------------------
-- Records of sys_rule_actiondef
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddRequirement', 'add-requirement', 'Add Requirement', 1, 'add-requirement', 'ENTERPRISE', 'enterprise.actions.AddRequirement');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddSystemInfo', 'add-systeminfo', 'Add System Info', 0, 'add-systeminfo', 'ENTERPRISE', 'enterprise.actions.AddSystemInfo');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AskInfo', 'ask-info', 'Ask Info', 0, 'ask-info', 'ENTERPRISE', 'enterprise.actions.AskInfo');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.ThrowException', 'throw-exeception', 'Throw Exception', 1, 'throw-exeception', 'ENTERPRISE', 'enterprise.actions.ThrowException');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddBillItem', 'add-billitem', 'Add Bill Item', 2, 'add-billitem', 'TREASURY', 'treasury.actions.AddBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddDiscountItem', 'add-discount-item', 'Add Discount', 3, 'add-discount-item', 'TREASURY', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddDueDate', 'add-duedate', 'Add Due Date', 1, 'add-duedate', 'TREASURY', 'treasury.actions.AddDueDate');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddExcessBillItem', 'add-excess-billitem', 'Add Excess Bill Item', 2, 'add-excess-billitem', 'TREASURY', 'treasury.actions.AddExcessBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddInterestItem', 'add-interest-item', 'Add Interest', 3, 'add-interest-item', 'TREASURY', 'treasury.actions.AddInterestItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddRevenueShare', 'add-share', 'Add Revenue Share', 1, 'add-share', 'TREASURY', 'treasury.actions.AddRevenueShare');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddRevenueShareByOrg', 'add-share-by-org', 'Add Revenue Share By Org', 1, 'add-share-by-org', 'TREASURY', 'treasury.actions.AddRevenueShareByOrg');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddSurchargeItem', 'add-surcharge-item', 'Add Surcharge', 3, 'add-surcharge-item', 'TREASURY', 'treasury.actions.AddSurchargeItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarDate', 'add-vardate', 'Add Variable Date', 1, 'add-vardate', 'TREASURY', 'treasury.actions.AddVarDate');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarDecimal', 'add-var-decimal', 'Add Var Decimal', 1, 'add-var-decimal', 'TREASURY', 'treasury.actions.AddVarDecimal');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarInteger', 'add-var-integer', 'Add Var Integer', 1, 'add-var-integer', 'TREASURY', 'treasury.actions.AddVarInteger');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddVarString', 'add-var-string', 'Add Var String', 1, 'add-var-string', 'TREASURY', 'treasury.actions.AddVarString');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.ApplyPayment', 'apply-payment', 'Apply Payment', 5, 'apply-payment', 'TREASURY', 'treasury.actions.ApplyPayment');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.SetBillItemAccount', 'set-billitem-account', 'Set Bill Item Account', 4, 'set-billitem-account', 'TREASURY', 'treasury.actions.SetBillItemAccount');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.SetBillItemProperty', 'set-billitem-property', 'Set BillItem Property Value', 10, 'set-billitem-property', 'TREASURY', 'treasury.actions.SetBillItemProperty');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.SummarizeBillItem', 'summarize-item', 'Summarize Bill Item', 5, 'summarize-item', 'TREASURY', 'treasury.actions.SummarizeBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.UpdateFieldValue', 'update-field-value', 'Update Field Value', 0, 'update-field-value', 'TREASURY', 'treasury.actions.UpdateFieldValue');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.sample.ComputeBill', 'compute_bill1', 'Compute Bill 1', 1, 'compute_bill1', NULL, 'treasury.sample.ComputeBill');
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_actiondef_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
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

-- ----------------------------
-- Records of sys_rule_actiondef_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_actiondef_param` VALUES ('2ecbcac2:15f2d21e588:-7ff2', 'treasury.actions.AddVarDate', 'tag', 1, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('2ecbcac2:15f2d21e588:-7ff3', 'treasury.actions.AddVarDate', 'date', 2, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM-1a90cae7:15f130ef553:-6df2', 'treasury.actions.AddSurchargeItem', 'txntype', 4, 'Txn Type', NULL, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM2fc067f3:151cc3fac96:-7e8f', 'treasury.actions.AddDiscountItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM2fc067f3:151cc3fac96:-7e97', 'treasury.actions.AddDiscountItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM62888c28:151cc92197a:-7f6b', 'treasury.actions.AddDiscountItem', 'account', 2, 'Discount Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM68129e35:15876a50bc6:-7e1d', 'treasury.actions.AddSurchargeItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM68129e35:15876a50bc6:-7e30', 'treasury.actions.AddSurchargeItem', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('ACTPARAM68129e35:15876a50bc6:-7e3f', 'treasury.actions.AddSurchargeItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.type', 'enterprise.actions.AddRequirement', 'type', 1, 'Type', NULL, 'lookup', 'requirementtype:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddSystemInfo.aggtype', 'enterprise.actions.AddSystemInfo', 'aggtype', 3, 'Aggregate Type', NULL, 'lov', NULL, NULL, NULL, NULL, 'INFO_AGGREGATE_TYPES');
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddSystemInfo.name', 'enterprise.actions.AddSystemInfo', 'name', 1, 'Name', NULL, 'lookup', 'variableinfo:lookup', 'name', 'name', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddSystemInfo.value', 'enterprise.actions.AddSystemInfo', 'value', 2, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AskInfo.name', 'enterprise.actions.AskInfo', 'name', 1, 'Name', NULL, 'lookup', 'variableinfo:lookup', 'name', 'name', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AskInfo.value', 'enterprise.actions.AskInfo', 'value', 2, 'Default Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.ThrowException.msg', 'enterprise.actions.ThrowException', 'msg', 1, 'Message', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.account', 'treasury.actions.AddBillItem', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.amount', 'treasury.actions.AddBillItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.fromdate', 'treasury.actions.AddBillItem', 'fromdate', 6, 'From Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.month', 'treasury.actions.AddBillItem', 'month', 5, 'Month', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.refid', 'treasury.actions.AddBillItem', 'refid', 9, 'Ref ID', NULL, 'var', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.remarks', 'treasury.actions.AddBillItem', 'remarks', 8, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.todate', 'treasury.actions.AddBillItem', 'todate', 7, 'To Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.txntype', 'treasury.actions.AddBillItem', 'txntype', 3, 'Txn Type', NULL, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.year', 'treasury.actions.AddBillItem', 'year', 4, 'Year', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.account', 'treasury.actions.AddDiscountItem', 'account', 2, 'Discount Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.amount', 'treasury.actions.AddDiscountItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.billitem', 'treasury.actions.AddDiscountItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDueDate.date', 'treasury.actions.AddDueDate', 'date', 1, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDueDate.tag', 'treasury.actions.AddDueDate', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.account', 'treasury.actions.AddExcessBillItem', 'account', 1, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.amount', 'treasury.actions.AddExcessBillItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.account', 'treasury.actions.AddInterestItem', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.amount', 'treasury.actions.AddInterestItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.billitem', 'treasury.actions.AddInterestItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.amount', 'treasury.actions.AddRevenueShare', 'amount', 4, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.org', 'treasury.actions.AddRevenueShare', 'org', 3, 'Org', NULL, 'var', NULL, NULL, NULL, 'enterprise.facts.Org', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.payableaccount', 'treasury.actions.AddRevenueShare', 'payableaccount', 2, 'Payable Account', NULL, 'lookup', 'payableaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddRevenueShareByOrg.refitem', 'treasury.actions.AddRevenueShare', 'refitem', 1, 'Ref Item', NULL, 'var', 'revenueitem:lookup', 'objid', 'title', 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.account', 'treasury.actions.AddSurchargeItem', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.amount', 'treasury.actions.AddSurchargeItem', 'amount', 3, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.billitem', 'treasury.actions.AddSurchargeItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.txntype', 'treasury.actions.AddSurchargeItem', 'txntype', 4, 'Txn Type', NULL, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.date', 'treasury.actions.AddVarDate', 'date', 2, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.tag', 'treasury.actions.AddVarDate', 'tag', 1, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.tag', 'treasury.actions.AddVarDecimal', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.value', 'treasury.actions.AddVarDecimal', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.tag', 'treasury.actions.AddVarInteger', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.value', 'treasury.actions.AddVarInteger', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.tag', 'treasury.actions.AddVarString', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.value', 'treasury.actions.AddVarString', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ApplyPayment.payment', 'treasury.actions.ApplyPayment', 'payment', 1, 'Payment', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.Payment', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.account', 'treasury.actions.SetBillItemAccount', 'account', 2, 'Account', NULL, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.billitem', 'treasury.actions.SetBillItemAccount', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.billitem', 'treasury.actions.SetBillItemProperty', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.BillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.fieldname', 'treasury.actions.SetBillItemProperty', 'fieldname', 2, 'Property Field Name', NULL, 'fieldlist', NULL, 'billitem', NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.value', 'treasury.actions.SetBillItemProperty', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.aggtype', 'treasury.actions.SummarizeBillItem', 'aggtype', 2, 'Aggregate Type', NULL, 'lov', NULL, NULL, NULL, NULL, 'SUMMARY_AGGREGATE_TYPE');
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.billitem', 'treasury.actions.SummarizeBillItem', 'billitem', 1, 'BillItem', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.fields', 'treasury.actions.SummarizeBillItem', 'fields', 2, 'Group Fields', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.remarks', 'treasury.actions.SummarizeBillItem', 'remarks', 3, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.fieldname', 'treasury.actions.UpdateFieldValue', 'fieldname', 2, 'Field name', NULL, 'fieldlist', NULL, 'object', NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.object', 'treasury.actions.UpdateFieldValue', 'object', 1, 'Object', NULL, 'var', NULL, NULL, NULL, 'obj', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.value', 'treasury.actions.UpdateFieldValue', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.sample.ComputeBill.name', 'treasury.sample.ComputeBill', 'name', 2, 'Name', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.sample.ComputeBill.unit', 'treasury.sample.ComputeBill', 'unit', 1, 'Unit', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition`;
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

-- ----------------------------
-- Records of sys_rule_condition
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition` VALUES ('RC-1c7c09d1:164ee5525b1:-7fd5', 'RUL-57c2d992:164ee592b63:-7e1f', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-33134f90:164ab2ede1c:-7d14', 'RUL-33134f90:164ab2ede1c:-7e5d', 'vehicle.facts.VehicleUnit', 'vehicle.facts.VehicleUnit', 'VU', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-65f47c69:164ab007b19:-7a63', 'RUL-65f47c69:164ab007b19:-7bac', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-6edb29df:1644165c650:-7dd2', 'RUL-6edb29df:1644165c650:-7e71', 'treasury.facts.BillItem', 'treasury.facts.BillItem', 'BILLITEM', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-76667e5d:16440b3c84b:-7d21', 'RUL-76667e5d:16440b3c84b:-7dba', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-dfb3c52:1643f92cbeb:-7e4c', 'RUL7cad66dc:1643f542faa:-7e2d', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND31768105:16440d16692:-7e9c', 'RUL-76667e5d:16440b3c84b:-7dba', 'enterprise.facts.IntegerInfo', 'enterprise.facts.IntegerInfo', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND6ce1407b:164ac6fb0fc:-7dce', 'RUL-65f47c69:164ab007b19:-7bac', 'enterprise.facts.IntegerInfo', 'enterprise.facts.IntegerInfo', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCONDdf6c2d8:164d540df24:-7975', 'RUL-6edb29df:1644165c650:-7e71', 'treasury.facts.DueDate', 'treasury.facts.DueDate', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCONDdf6c2d8:164d540df24:-7a82', 'RUL-6edb29df:1644165c650:-7e71', 'treasury.facts.BillDate', 'treasury.facts.BillDate', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCONDdf6c2d8:164d540df24:-7d3d', 'RULdf6c2d8:164d540df24:-7ddd', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition_constraint
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
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

-- ----------------------------
-- Records of sys_rule_condition_constraint
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-1c7c09d1:164ee5525b1:-7fd2', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-1c7c09d1:164ee5525b1:-7fd4', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcycle\",value:\"motorcycle\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-615daaf4:164b01f32ef:-7b78', 'RCOND-76667e5d:16440b3c84b:-7d21', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-615daaf4:164b01f32ef:-7dbb', 'RCOND-65f47c69:164ab007b19:-7a63', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-65f47c69:164ab007b19:-7a3d', 'RCOND-65f47c69:164ab007b19:-7a63', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcycle\",value:\"motorcycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-6edb29df:1644165c650:-7d40', 'RCOND-6edb29df:1644165c650:-7dd2', 'treasury.facts.BillItem.amount', 'amount', 'AMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-6edb29df:1644165c650:-7da3', 'RCOND-6edb29df:1644165c650:-7dd2', 'treasury.facts.BillItem.account', 'account', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"REVITEM217a91b:1409e6ae44e:-7ea7\",value:\"FRANCHISE TAX - MTOP\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-76667e5d:16440b3c84b:-7d0a', 'RCOND-76667e5d:16440b3c84b:-7d21', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcycle\",value:\"motorcycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-76667e5d:16440b3c84b:-7e2a', 'RCOND-dfb3c52:1643f92cbeb:-7e4c', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcycle\",value:\"motorcycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST31768105:16440d16692:-7e9a', 'RCOND31768105:16440d16692:-7e9c', 'enterprise.facts.IntegerInfo.value', 'value', 'NUMEMPLOYEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST31768105:16440d16692:-7e9b', 'RCOND31768105:16440d16692:-7e9c', 'enterprise.facts.IntegerInfo.name', 'name', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"NO_OF_EMPLOYEE\",value:\"NO_OF_EMPLOYEE\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST6ce1407b:164ac6fb0fc:-7dcc', 'RCOND6ce1407b:164ac6fb0fc:-7dce', 'enterprise.facts.IntegerInfo.value', 'value', 'NUM_UNITS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST6ce1407b:164ac6fb0fc:-7dcd', 'RCOND6ce1407b:164ac6fb0fc:-7dce', 'enterprise.facts.IntegerInfo.name', 'name', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"NUM_UNITS\",value:\"NUM_UNITS\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTdf6c2d8:164d540df24:-794d', 'RCONDdf6c2d8:164d540df24:-7975', 'treasury.facts.DueDate.date', 'date', NULL, 'before', '<', 1, 'RCONSTdf6c2d8:164d540df24:-7a5a', 'BILLDATE', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTdf6c2d8:164d540df24:-7a5a', 'RCONDdf6c2d8:164d540df24:-7a82', 'treasury.facts.BillDate.date', 'date', 'BILLDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONSTdf6c2d8:164d540df24:-7d0a', 'RCONDdf6c2d8:164d540df24:-7d3d', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_condition_var
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_condition_var`;
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

-- ----------------------------
-- Records of sys_rule_condition_var
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-1c7c09d1:164ee5525b1:-7fd5', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'RUL-57c2d992:164ee592b63:-7e1f', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC-1c7c09d1:164ee5525b1:-7fd2', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'RUL-57c2d992:164ee592b63:-7e1f', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-33134f90:164ab2ede1c:-7d14', 'RCOND-33134f90:164ab2ede1c:-7d14', 'RUL-33134f90:164ab2ede1c:-7e5d', 'VU', 'vehicle.facts.VehicleUnit', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-65f47c69:164ab007b19:-7a63', 'RCOND-65f47c69:164ab007b19:-7a63', 'RUL-65f47c69:164ab007b19:-7bac', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-6edb29df:1644165c650:-7dd2', 'RCOND-6edb29df:1644165c650:-7dd2', 'RUL-6edb29df:1644165c650:-7e71', 'BILLITEM', 'treasury.facts.BillItem', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-76667e5d:16440b3c84b:-7d21', 'RCOND-76667e5d:16440b3c84b:-7d21', 'RUL-76667e5d:16440b3c84b:-7dba', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-dfb3c52:1643f92cbeb:-7e4c', 'RCOND-dfb3c52:1643f92cbeb:-7e4c', 'RUL7cad66dc:1643f542faa:-7e2d', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONDdf6c2d8:164d540df24:-7d3d', 'RCONDdf6c2d8:164d540df24:-7d3d', 'RULdf6c2d8:164d540df24:-7ddd', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-615daaf4:164b01f32ef:-7b78', 'RCOND-76667e5d:16440b3c84b:-7d21', 'RUL-76667e5d:16440b3c84b:-7dba', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-615daaf4:164b01f32ef:-7dbb', 'RCOND-65f47c69:164ab007b19:-7a63', 'RUL-65f47c69:164ab007b19:-7bac', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-6edb29df:1644165c650:-7d40', 'RCOND-6edb29df:1644165c650:-7dd2', 'RUL-6edb29df:1644165c650:-7e71', 'AMT', 'decimal', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST31768105:16440d16692:-7e9a', 'RCOND31768105:16440d16692:-7e9c', 'RUL-76667e5d:16440b3c84b:-7dba', 'NUMEMPLOYEE', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST6ce1407b:164ac6fb0fc:-7dcc', 'RCOND6ce1407b:164ac6fb0fc:-7dce', 'RUL-65f47c69:164ab007b19:-7bac', 'NUM_UNITS', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTdf6c2d8:164d540df24:-7a5a', 'RCONDdf6c2d8:164d540df24:-7a82', 'RUL-6edb29df:1644165c650:-7e71', 'BILLDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONSTdf6c2d8:164d540df24:-7d0a', 'RCONDdf6c2d8:164d540df24:-7d3d', 'RULdf6c2d8:164d540df24:-7ddd', 'YR', 'integer', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_deployed
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_deployed`;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`),
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_deployed
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_deployed` VALUES ('RUL-33134f90:164ab2ede1c:-7e5d', '\npackage vehicleassessment.VEHICLE_COUNT;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"VEHICLE_COUNT\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VU: vehicle.facts.VehicleUnit (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VU\", VU );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"name\", new KeyValue(\"NUM_UNITS\", \"NUM_UNITS\") );\n_p0.put( \"aggtype\", \"COUNT\" );\naction.execute( \"add-systeminfo\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL-57c2d992:164ee592b63:-7e1f', '\npackage vehicledates.MOTORCYCLE_RENEWAL_DATE;\nimport vehicledates.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORCYCLE_RENEWAL_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  YR:appyear,vehicletype matches \"motorcycle|tricycle\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"date\", (new ActionExpression(\"return @DATE( YR , 12, 31 );  \", bindings)) );\n_p0.put( \"tag\", \"renewaldate\" );\naction.execute( \"add-duedate\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL-65f47c69:164ab007b19:-7bac', '\npackage vehicleassessment.MOTORFEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORFEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcycle\",YR:appyear ) \n		\n		 enterprise.facts.IntegerInfo (  name matches \"NUM_UNITS\",NUM_UNITS:value ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"NUM_UNITS\", NUM_UNITS );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"REVITEM-46b788af:140b8f5265d:-7f5e\", \"PERMIT FOR MOTORCADE/PARADE/RALLY\") );\n_p0.put( \"amount\", (new ActionExpression(\"150 * NUM_UNITS\", bindings)) );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p0.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL-76667e5d:16440b3c84b:-7dba', '\npackage vehicleassessment.MTOP_FEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MTOP_FEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcycle\",YR:appyear ) \n		\n		 enterprise.facts.IntegerInfo (  name matches \"NO_OF_EMPLOYEE\",NUMEMPLOYEE:value ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"NUMEMPLOYEE\", NUMEMPLOYEE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"account\", new KeyValue(\"REVITEM217a91b:1409e6ae44e:-7ea7\", \"FRANCHISE TAX - MTOP\") );\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p0.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\nMap _p1 = new HashMap();\n_p1.put( \"account\", new KeyValue(\"REVITEM-46b788af:140b8f5265d:-7f48\", \"OCCUPATION FEES - EMPLOYEES/PERSONNEL\") );\n_p1.put( \"amount\", (new ActionExpression(\"NUMEMPLOYEE * 50\", bindings)) );\n_p1.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\n_p1.put( \"month\", (new ActionExpression(\"1\", bindings)) );\naction.execute( \"add-billitem\",_p1,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL7cad66dc:1643f542faa:-7e2d', '\npackage vehicleassessment.ASK_NUM_EMPLOYEE;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"ASK_NUM_EMPLOYEE\"\n	agenda-group \"ask-info\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcycle\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"name\", new KeyValue(\"NO_OF_EMPLOYEE\", \"NO_OF_EMPLOYEE\") );\n_p0.put( \"value\", (new ActionExpression(\"0\", bindings)) );\naction.execute( \"ask-info\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RULdf6c2d8:164d540df24:-7ddd', '\npackage vehiclebilling.SET_DUE_DATE;\nimport vehiclebilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"SET_DUE_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  YR:appyear ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"date\", (new ActionExpression(\"@DATE(  YR, 1, 20 )\", bindings)) );\naction.execute( \"add-duedate\",_p0,drools);\n\nend\n\n\n	');
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_fact
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_fact`;
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

-- ----------------------------
-- Records of sys_rule_fact
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_fact` VALUES ('com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', 'Current Date', 'com.rameses.rules.common.CurrentDate', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SYSTEM', NULL);
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.BooleanInfo', 'enterprise.facts.BooleanInfo', 'Boolean (Yes No) Info', 'enterprise.facts.BooleanInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.DateInfo', 'enterprise.facts.DateInfo', 'Date Info', 'enterprise.facts.DateInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.IntegerInfo', 'enterprise.facts.IntegerInfo', 'Integer Info', 'enterprise.facts.IntegerInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.Org', 'enterprise.facts.Org', 'Org', 'enterprise.facts.Org', 1, NULL, 'ORG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.Requirement', 'enterprise.facts.Requirement', 'Requirement', 'enterprise.facts.Requirement', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.StringArrayInfo', 'enterprise.facts.StringArrayInfo', 'String Array Info', 'enterprise.facts.StringArrayInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.StringInfo', 'enterprise.facts.StringInfo', 'String Info', 'enterprise.facts.StringInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.AppDate', 'treasury.facts.AppDate', 'Application Date', 'treasury.facts.AppDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Attribute', 'treasury.facts.Attribute', 'Attribute', 'treasury.facts.Attribute', 1, NULL, 'ATT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillDate', 'treasury.facts.BillDate', 'Bill Date', 'treasury.facts.BillDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillingPeriod', 'treasury.facts.BillingPeriod', 'Billing Period', 'treasury.facts.BillingPeriod', 1, NULL, 'BILPRD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillItem', 'treasury.facts.BillItem', 'Bill Item', 'treasury.facts.BillItem', 1, NULL, 'BILLITEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.CollectionGroup', 'treasury.facts.CollectionGroup', 'Collection Group', 'treasury.facts.CollectionGroup', 0, NULL, 'CG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.DecimalInfo', 'treasury.facts.DecimalInfo', 'Decimal Info', 'treasury.facts.DecimalInfo', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.DueDate', 'treasury.facts.DueDate', 'Due Date', 'treasury.facts.DueDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.ExcessPayment', 'treasury.facts.ExcessPayment', 'Excess Payment', 'treasury.facts.ExcessPayment', 5, NULL, 'EXPMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'Holidays', 'treasury.facts.HolidayFact', 1, NULL, 'HOLIDAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.InterestItem', 'treasury.facts.InterestItem', 'Interest Item', 'treasury.facts.InterestItem', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.MonthEntry', 'treasury.facts.MonthEntry', 'Month Entry', 'treasury.facts.MonthEntry', 1, NULL, 'MONTHENTRY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Payment', 'treasury.facts.Payment', 'Payment', 'treasury.facts.Payment', 5, NULL, 'PMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.RevenueShare', 'treasury.facts.RevenueShare', 'Revenue Share', 'treasury.facts.RevenueShare', 1, NULL, 'RS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.SampleItem', 'treasury.facts.SampleItem', 'Bill Item class', 'treasury.facts.SampleItem', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.SurchargeItem', 'treasury.facts.SurchargeItem', 'Surcharge Item', 'treasury.facts.SurchargeItem', 4, NULL, 'SUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.SystemDate', 'treasury.facts.SystemDate', 'System Date', 'treasury.facts.SystemDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDate', 'treasury.facts.VarDate', 'Variable Date', 'treasury.facts.VarDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDecimal', 'treasury.facts.VarDecimal', 'Var Decimal', 'treasury.facts.VarDecimal', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarInteger', 'treasury.facts.VarInteger', 'Var Integer', 'treasury.facts.VarInteger', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarString', 'treasury.facts.VarString', 'Var String', 'treasury.facts.VarString', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'Vehicle Application', 'vehicle.facts.VehicleApplication', 1, NULL, 'VAPP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('vehicle.facts.VehicleFranchise', 'vehicle.facts.VehicleFranchise', 'Vehicle Franchise', 'vehicle.facts.VehicleFranchise', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('vehicle.facts.VehicleUnit', 'vehicle.facts.VehicleUnit', 'Vehicle Unit', 'vehicle.facts.VehicleUnit', 1, NULL, 'VU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rule_fact_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_fact_field`;
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

-- ----------------------------
-- Records of sys_rule_fact_field
-- ----------------------------
BEGIN;
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.date', 'com.rameses.rules.common.CurrentDate', 'date', 'Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.day', 'com.rameses.rules.common.CurrentDate', 'day', 'Day', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.month', 'com.rameses.rules.common.CurrentDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.qtr', 'com.rameses.rules.common.CurrentDate', 'qtr', 'Qtr', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('com.rameses.rules.common.CurrentDate.year', 'com.rameses.rules.common.CurrentDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.BooleanInfo.name', 'enterprise.facts.BooleanInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_boolean:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.BooleanInfo.value', 'enterprise.facts.BooleanInfo', 'value', 'Value', 'boolean', 2, 'boolean', NULL, NULL, NULL, NULL, NULL, 1, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.day', 'enterprise.facts.DateInfo', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.month', 'enterprise.facts.DateInfo', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.name', 'enterprise.facts.DateInfo', 'name', 'Name', 'string', 5, 'lookup', 'variableinfo_date:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.qtr', 'enterprise.facts.DateInfo', 'qtr', 'Qtr', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.value', 'enterprise.facts.DateInfo', 'value', 'Date', 'date', 6, 'date', NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.DateInfo.year', 'enterprise.facts.DateInfo', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.IntegerInfo.name', 'enterprise.facts.IntegerInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_integer:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.IntegerInfo.value', 'enterprise.facts.IntegerInfo', 'value', 'Value', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, 1, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.Org.orgid', 'enterprise.facts.Org', 'orgid', 'Org ID', 'string', 1, 'lookup', 'org:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.Requirement.completed', 'enterprise.facts.Requirement', 'completed', 'Completed', 'boolean', 2, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.Requirement.expirydate', 'enterprise.facts.Requirement', 'expirydate', 'Expiry Date', 'date', 3, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.Requirement.type', 'enterprise.facts.Requirement', 'type', 'Type', 'string', 1, 'lookup', 'requirementtype:lookup', 'objid', 'title', NULL, 1, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.StringArrayInfo.name', 'enterprise.facts.StringArrayInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_string_array:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.StringArrayInfo.value', 'enterprise.facts.StringArrayInfo', 'value', 'Value', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.StringInfo.name', 'enterprise.facts.StringInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_string:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('enterprise.facts.StringInfo.value', 'enterprise.facts.StringInfo', 'value', 'Value', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.AppDate.date', 'treasury.facts.AppDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.AppDate.day', 'treasury.facts.AppDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.AppDate.month', 'treasury.facts.AppDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.AppDate.qtr', 'treasury.facts.AppDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.AppDate.year', 'treasury.facts.AppDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Attribute.name', 'treasury.facts.Attribute', 'name', 'Name', 'string', 1, 'lookup', 'attribute:lookup', 'name', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.date', 'treasury.facts.BillDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.day', 'treasury.facts.BillDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.month', 'treasury.facts.BillDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.qtr', 'treasury.facts.BillDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillDate.year', 'treasury.facts.BillDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillingPeriod.fromdate', 'treasury.facts.BillingPeriod', 'fromdate', 'From Date', 'date', 3, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillingPeriod.month', 'treasury.facts.BillingPeriod', 'month', 'Month', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillingPeriod.todate', 'treasury.facts.BillingPeriod', 'todate', 'To Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillingPeriod.year', 'treasury.facts.BillingPeriod', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.account', 'treasury.facts.BillItem', 'account', 'Account', 'string', 3, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.account.objid', 'treasury.facts.BillItem', 'account.objid', 'Account ID', 'string', 2, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.amount', 'treasury.facts.BillItem', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.billrefid', 'treasury.facts.BillItem', 'billrefid', 'Bill Ref ID', 'string', 7, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.discount', 'treasury.facts.BillItem', 'discount', 'Discount', 'decimal', 8, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.duedate', 'treasury.facts.BillItem', 'duedate', 'Due Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.fromdate', 'treasury.facts.BillItem', 'fromdate', 'From Date', 'date', 14, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.interest', 'treasury.facts.BillItem', 'interest', 'Interest', 'decimal', 11, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.month', 'treasury.facts.BillItem', 'month', 'Month', 'integer', 13, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.org', 'treasury.facts.BillItem', 'org', 'Org', 'string', 10, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'enterprise.facts.Org', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.parentaccount', 'treasury.facts.BillItem', 'parentaccount', 'Parent Account', 'string', 9, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.paypriority', 'treasury.facts.BillItem', 'paypriority', 'Pay Priority', 'integer', 18, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.refid', 'treasury.facts.BillItem', 'refid', 'Ref ID', 'string', 16, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.remarks', 'treasury.facts.BillItem', 'remarks', 'Remarks', 'string', 17, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.sortorder', 'treasury.facts.BillItem', 'sortorder', 'Sort Order', 'integer', 19, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.surcharge', 'treasury.facts.BillItem', 'surcharge', 'Surcharge', 'decimal', 5, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.tag', 'treasury.facts.BillItem', 'tag', 'Tag', 'string', 20, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.todate', 'treasury.facts.BillItem', 'todate', 'To Date', 'date', 15, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.txntype', 'treasury.facts.BillItem', 'txntype', 'Txn Type', 'string', 6, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.BillItem.year', 'treasury.facts.BillItem', 'year', 'Year', 'integer', 12, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.CollectionGroup.objid', 'treasury.facts.CollectionGroup', 'objid', 'Name', 'string', 1, 'lookup', 'collectiongroup:lookup', 'objid', 'name', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DecimalInfo.name', 'treasury.facts.DecimalInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_decimal:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DecimalInfo.value', 'treasury.facts.DecimalInfo', 'value', 'Value', 'decimal', 2, 'decimal', NULL, NULL, NULL, NULL, NULL, 1, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.date', 'treasury.facts.DueDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.day', 'treasury.facts.DueDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.month', 'treasury.facts.DueDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.qtr', 'treasury.facts.DueDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.year', 'treasury.facts.DueDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.ExcessPayment.amount', 'treasury.facts.ExcessPayment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.HolidayFact.id', 'treasury.facts.HolidayFact', 'id', 'ID', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.account', 'treasury.facts.InterestItem', 'account', 'Account', 'string', 2, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.amount', 'treasury.facts.InterestItem', 'amount', 'Amount', 'decimal', 3, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.parent', 'treasury.facts.InterestItem', 'parent', 'Parent BillItem', 'string', 1, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.duedate', 'treasury.facts.MonthEntry', 'duedate', 'Due date', 'date', 13, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.first', 'treasury.facts.MonthEntry', 'first', 'First', 'boolean', 11, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.fromdate', 'treasury.facts.MonthEntry', 'fromdate', 'From Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.fromday', 'treasury.facts.MonthEntry', 'fromday', 'From Day', 'integer', 6, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.index', 'treasury.facts.MonthEntry', 'index', 'Index', 'integer', 10, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.last', 'treasury.facts.MonthEntry', 'last', 'Last', 'boolean', 12, 'boolean', NULL, NULL, NULL, NULL, NULL, NULL, 'boolean', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.maxdays', 'treasury.facts.MonthEntry', 'maxdays', 'Month Max Days', 'integer', 9, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.month', 'treasury.facts.MonthEntry', 'month', 'Month', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.numdays', 'treasury.facts.MonthEntry', 'numdays', 'No. of Days', 'integer', 8, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.qtr', 'treasury.facts.MonthEntry', 'qtr', 'Qtr', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.todate', 'treasury.facts.MonthEntry', 'todate', 'To Date', 'date', 5, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.today', 'treasury.facts.MonthEntry', 'today', 'To Day', 'integer', 7, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.MonthEntry.year', 'treasury.facts.MonthEntry', 'year', 'Year', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Payment.amount', 'treasury.facts.Payment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.RevenueShare.amount', 'treasury.facts.RevenueShare', 'amount', 'Amount', 'decimal', 3, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.RevenueShare.payableaccount', 'treasury.facts.RevenueShare', 'payableaccount', 'Payable Account', 'string', 2, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.RevenueShare.refaccount', 'treasury.facts.RevenueShare', 'refaccount', 'Reference Account', 'string', 1, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SampleItem.name', 'treasury.facts.SampleItem', 'name', 'Name', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SampleItem.numunit', 'treasury.facts.SampleItem', 'numunit', 'No. of Units', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SampleItem.status', 'treasury.facts.SampleItem', 'status', 'Status', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.account', 'treasury.facts.SurchargeItem', 'account', 'Account', 'string', 2, 'lookup', 'revenueitem:lookup', 'objid', 'title', NULL, NULL, NULL, 'object', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.amount', 'treasury.facts.SurchargeItem', 'amount', 'Amount', 'decimal', 3, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.parent', 'treasury.facts.SurchargeItem', 'parent', 'Parent Bill Item', 'string', 1, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.txntype', 'treasury.facts.SurchargeItem', 'txntype', 'Txn Type', 'string', 4, 'lookup', 'billitem_txntype:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SystemDate.date', 'treasury.facts.SystemDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SystemDate.day', 'treasury.facts.SystemDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SystemDate.month', 'treasury.facts.SystemDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SystemDate.qtr', 'treasury.facts.SystemDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SystemDate.year', 'treasury.facts.SystemDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.date', 'treasury.facts.VarDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.day', 'treasury.facts.VarDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.month', 'treasury.facts.VarDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.qtr', 'treasury.facts.VarDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.tag', 'treasury.facts.VarDate', 'tag', 'Tag', 'string', 6, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDate.year', 'treasury.facts.VarDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDecimal.tag', 'treasury.facts.VarDecimal', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarDecimal.value', 'treasury.facts.VarDecimal', 'value', 'Value', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarInteger.tag', 'treasury.facts.VarInteger', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarInteger.value', 'treasury.facts.VarInteger', 'value', 'Value', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarString.tag', 'treasury.facts.VarString', 'tag', 'Tag', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.VarString.value', 'treasury.facts.VarString', 'value', 'Value', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.appdate', 'vehicle.facts.VehicleApplication', 'appdate', 'App Date', 'date', 4, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.apptype', 'vehicle.facts.VehicleApplication', 'apptype', 'App Type', 'string', 1, 'lov', NULL, NULL, NULL, NULL, NULL, NULL, 'string', 'VEHICLE_APP_TYPE');
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.appyear', 'vehicle.facts.VehicleApplication', 'appyear', 'App Year', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.prevexpirydate', 'vehicle.facts.VehicleApplication', 'prevexpirydate', 'Prev Expiry Date', 'date', 5, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.vehicletype', 'vehicle.facts.VehicleApplication', 'vehicletype', 'Vehicle Type', 'string', 2, 'lookup', 'vehicletype:lookup', 'objid', 'objid', NULL, NULL, NULL, 'string', 'VEHICLE_TXNTYPE');
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleFranchise.controlno', 'vehicle.facts.VehicleFranchise', 'controlno', 'Control No', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleFranchise.dtregistered', 'vehicle.facts.VehicleFranchise', 'dtregistered', 'Date Registered', 'date', 2, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.bodyno', 'vehicle.facts.VehicleUnit', 'bodyno', 'Body No', 'string', 4, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.chassisno', 'vehicle.facts.VehicleUnit', 'chassisno', 'Chassis No', 'string', 9, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.color', 'vehicle.facts.VehicleUnit', 'color', 'Color', 'string', 8, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.controlno', 'vehicle.facts.VehicleUnit', 'controlno', 'Control No', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.engineno', 'vehicle.facts.VehicleUnit', 'engineno', 'Engine No', 'string', 3, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.make', 'vehicle.facts.VehicleUnit', 'make', 'Make', 'string', 6, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.model', 'vehicle.facts.VehicleUnit', 'model', 'Model', 'string', 7, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.plateno', 'vehicle.facts.VehicleUnit', 'plateno', 'Plate No', 'string', 2, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.sidecarcolor', 'vehicle.facts.VehicleUnit', 'sidecarcolor', 'Sidecar Color', 'string', 10, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.sidecarno', 'vehicle.facts.VehicleUnit', 'sidecarno', 'Sidecarno', 'string', 5, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_rulegroup
-- ----------------------------
DROP TABLE IF EXISTS `sys_rulegroup`;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`),
  KEY `ruleset` (`ruleset`),
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rulegroup
-- ----------------------------
BEGIN;
INSERT INTO `sys_rulegroup` VALUES ('after-compute-fee', 'vehiclebilling', 'After Compute Fee', 3);
INSERT INTO `sys_rulegroup` VALUES ('apply-payment', 'vehiclebilling', 'Apply Payment', 7);
INSERT INTO `sys_rulegroup` VALUES ('ask-info', 'vehicleassessment', 'Ask Info', 1);
INSERT INTO `sys_rulegroup` VALUES ('ask-info', 'vehiclebilling', 'Ask Info', 1);
INSERT INTO `sys_rulegroup` VALUES ('compute-fee', 'vehicleassessment', 'Compute Fee', 3);
INSERT INTO `sys_rulegroup` VALUES ('compute-fee', 'vehiclebilling', 'Compute Fee', 2);
INSERT INTO `sys_rulegroup` VALUES ('discount', 'vehiclebilling', 'Compute Discount', 4);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'vehicleassessment', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'vehiclebilling', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('initial', 'vehicledates', 'Initial', 0);
INSERT INTO `sys_rulegroup` VALUES ('interest', 'vehiclebilling', 'Compute Interest', 6);
INSERT INTO `sys_rulegroup` VALUES ('post-ask-info', 'vehicleassessment', 'After Ask Info', 2);
INSERT INTO `sys_rulegroup` VALUES ('summary', 'vehicleassessment', 'Summary', 4);
INSERT INTO `sys_rulegroup` VALUES ('summary', 'vehiclebilling', 'Summary', 8);
INSERT INTO `sys_rulegroup` VALUES ('surcharge', 'vehiclebilling', 'Compute Surcharge', 5);
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset`;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset` VALUES ('vehicleassessment', 'Vehicle Assessment', 'vehicleassessment', 'VEHICLE', 'RULE_AUTHOR', NULL);
INSERT INTO `sys_ruleset` VALUES ('vehiclebilling', 'Vehicle Reg. Billing', 'vehiclebilling', 'VEHICLE', 'RULE_AUTHOR', NULL);
INSERT INTO `sys_ruleset` VALUES ('vehicledates', 'Vehicle Expiry Dates', 'vehicledates', 'VEHICLE', 'RULE_AUTHOR', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset_actiondef
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`),
  KEY `actiondef` (`actiondef`),
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset_actiondef
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.AddSystemInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.AskInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'enterprise.actions.AskInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.ThrowException');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'treasury.actions.AddBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddDueDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicledates', 'treasury.actions.AddDueDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddSurchargeItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.ApplyPayment');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.SetBillItemProperty');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'treasury.actions.SummarizeBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.SummarizeBillItem');
COMMIT;

-- ----------------------------
-- Table structure for sys_ruleset_fact
-- ----------------------------
DROP TABLE IF EXISTS `sys_ruleset_fact`;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`),
  KEY `rulefact` (`rulefact`),
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ruleset_fact
-- ----------------------------
BEGIN;
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'com.rameses.rules.common.CurrentDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'com.rameses.rules.common.CurrentDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'enterprise.facts.BooleanInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'enterprise.facts.BooleanInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'enterprise.facts.DateInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'enterprise.facts.DateInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'enterprise.facts.IntegerInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'enterprise.facts.IntegerInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'enterprise.facts.StringArrayInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'enterprise.facts.StringArrayInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'enterprise.facts.StringInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'enterprise.facts.StringInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.AppDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'treasury.facts.BillDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.BillDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'treasury.facts.BillDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'treasury.facts.BillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.BillItem');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'treasury.facts.DecimalInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.DecimalInfo');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.DueDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.ExcessPayment');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.InterestItem');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.Payment');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.SurchargeItem');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'treasury.facts.SystemDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'treasury.facts.SystemDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'treasury.facts.SystemDate');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'vehicle.facts.VehicleApplication');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'vehicle.facts.VehicleApplication');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'vehicle.facts.VehicleApplication');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'vehicle.facts.VehicleFranchise');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'vehicle.facts.VehicleFranchise');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'vehicle.facts.VehicleUnit');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'vehicle.facts.VehicleUnit');
INSERT INTO `sys_ruleset_fact` VALUES ('vehicledates', 'vehicle.facts.VehicleUnit');
COMMIT;

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
BEGIN;
INSERT INTO `sys_sequence` VALUES ('08-003', 2);
INSERT INTO `sys_sequence` VALUES ('AFSERIALFORWARD', 288);
INSERT INTO `sys_sequence` VALUES ('ASSESSMENT_NOTICE-2017', 2);
INSERT INTO `sys_sequence` VALUES ('ASSESSMENT_NOTICE-2018', 2);
INSERT INTO `sys_sequence` VALUES ('B154201611', 4767);
INSERT INTO `sys_sequence` VALUES ('B154201612', 134);
INSERT INTO `sys_sequence` VALUES ('B154201701', 692);
INSERT INTO `sys_sequence` VALUES ('B154201702', 182);
INSERT INTO `sys_sequence` VALUES ('B154201703', 171);
INSERT INTO `sys_sequence` VALUES ('B154201704', 94);
INSERT INTO `sys_sequence` VALUES ('B154201705', 95);
INSERT INTO `sys_sequence` VALUES ('B154201706', 107);
INSERT INTO `sys_sequence` VALUES ('B154201707', 66);
INSERT INTO `sys_sequence` VALUES ('B154201708', 71);
INSERT INTO `sys_sequence` VALUES ('B154201709', 64);
INSERT INTO `sys_sequence` VALUES ('B154201710', 46);
INSERT INTO `sys_sequence` VALUES ('B154201711', 48);
INSERT INTO `sys_sequence` VALUES ('B154201712', 13);
INSERT INTO `sys_sequence` VALUES ('B154201801', 165);
INSERT INTO `sys_sequence` VALUES ('B154201802', 114);
INSERT INTO `sys_sequence` VALUES ('B154201803', 84);
INSERT INTO `sys_sequence` VALUES ('B154201804', 70);
INSERT INTO `sys_sequence` VALUES ('B154201805', 41);
INSERT INTO `sys_sequence` VALUES ('B1542019000000', 3);
INSERT INTO `sys_sequence` VALUES ('B1732019000000', 5);
INSERT INTO `sys_sequence` VALUES ('BCnull2019000000', 5);
INSERT INTO `sys_sequence` VALUES ('Bnull2019000000', 4);
INSERT INTO `sys_sequence` VALUES ('Bnull2019000001N', 2);
INSERT INTO `sys_sequence` VALUES ('BP-2016', 5);
INSERT INTO `sys_sequence` VALUES ('BP-2017', 5690);
INSERT INTO `sys_sequence` VALUES ('BP-2018', 5351);
INSERT INTO `sys_sequence` VALUES ('BP1732019000000', 4);
INSERT INTO `sys_sequence` VALUES ('BP_AMEND_LOG', 4322);
INSERT INTO `sys_sequence` VALUES ('BUSINESS_REDFLAG', 1169);
INSERT INTO `sys_sequence` VALUES ('CHANGEINFO201811', 66);
INSERT INTO `sys_sequence` VALUES ('CM', 4);
INSERT INTO `sys_sequence` VALUES ('DV', 15);
INSERT INTO `sys_sequence` VALUES ('INDIVIDUAL_ENTITY', 65630);
INSERT INTO `sys_sequence` VALUES ('IRAF', 5);
INSERT INTO `sys_sequence` VALUES ('JURIDICAL_ENTITY', 2727);
INSERT INTO `sys_sequence` VALUES ('LIQ', 3);
INSERT INTO `sys_sequence` VALUES ('LIQ-GLT', 2);
INSERT INTO `sys_sequence` VALUES ('LIQ-GMG', 18);
INSERT INTO `sys_sequence` VALUES ('LOANAPP', 2);
INSERT INTO `sys_sequence` VALUES ('MAPP0201C1', 2);
INSERT INTO `sys_sequence` VALUES ('MAPP2017', 2);
INSERT INTO `sys_sequence` VALUES ('MAPP2017C1', 2);
INSERT INTO `sys_sequence` VALUES ('MAPP2017null', 2);
INSERT INTO `sys_sequence` VALUES ('MAPP2018', 14);
INSERT INTO `sys_sequence` VALUES ('MAPP2018C1', 3);
INSERT INTO `sys_sequence` VALUES ('MMM2018', 18);
INSERT INTO `sys_sequence` VALUES ('MTOP-2018', 74);
INSERT INTO `sys_sequence` VALUES ('MULTIPLE_ENTITY', 17850);
INSERT INTO `sys_sequence` VALUES ('nullN', 2);
INSERT INTO `sys_sequence` VALUES ('PED-2018-06', 5);
INSERT INTO `sys_sequence` VALUES ('REM', 11);
INSERT INTO `sys_sequence` VALUES ('REM-AA', 356);
INSERT INTO `sys_sequence` VALUES ('REM-AJUEGO', 7);
INSERT INTO `sys_sequence` VALUES ('REM-CA', 334);
INSERT INTO `sys_sequence` VALUES ('REM-CBS', 3);
INSERT INTO `sys_sequence` VALUES ('REM-CG', 3);
INSERT INTO `sys_sequence` VALUES ('REM-GLT', 52);
INSERT INTO `sys_sequence` VALUES ('REM-MNIZAG', 2);
INSERT INTO `sys_sequence` VALUES ('REM-NB', 345);
INSERT INTO `sys_sequence` VALUES ('REM-TBM', 340);
INSERT INTO `sys_sequence` VALUES ('REM-VOM', 32);
INSERT INTO `sys_sequence` VALUES ('RPTBILL-17', 58);
INSERT INTO `sys_sequence` VALUES ('RPTBILL-18', 6);
INSERT INTO `sys_sequence` VALUES ('RPTCERTIFICATION', 4);
INSERT INTO `sys_sequence` VALUES ('RT154', 33590);
INSERT INTO `sys_sequence` VALUES ('TRI-2019010000', 11);
INSERT INTO `sys_sequence` VALUES ('TRI-2019020000', 28);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-01-001', 945);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-01-002', 2543);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-01-003', 2039);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-01-004', 2554);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-01-011', 1560);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-02-005', 2771);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-02-010', 1154);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-02-013', 1125);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-02-015', 951);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-03-007', 6053);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-03-008', 4410);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-04-006', 580);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-04-009', 4352);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-04-012', 1706);
INSERT INTO `sys_sequence` VALUES ('UNIQUE_TDNO-154-04-014', 927);
INSERT INTO `sys_sequence` VALUES ('VP-2018', 9);
COMMIT;

-- ----------------------------
-- Table structure for sys_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_usergroup
-- ----------------------------
BEGIN;
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.MASTER', 'VEHICLE MASTER', 'VEHICLE', NULL, NULL, 'MASTER');
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.RULE_AUTHOR', 'VEHICLE RULE_AUTHOR', 'VEHICLE', NULL, NULL, 'RULE_AUTHOR');
COMMIT;

-- ----------------------------
-- Table structure for sys_wf
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf`;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wf
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf` VALUES ('vehicle_application', 'Vehicle Application', 'VEHICLE');
COMMIT;

-- ----------------------------
-- Table structure for sys_wf_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf_node`;
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

-- ----------------------------
-- Records of sys_wf_node
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf_node` VALUES ('approval', 'vehicle_application', 'For Approval', 'state', 4, 0, 'VEHICLE', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[422,122],size:[100,50]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('assessment', 'vehicle_application', 'Assessment', 'state', 3, 0, 'VEHICLE', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[278,39],size:[96,56]]', '[show_assess:true]', 1);
INSERT INTO `sys_wf_node` VALUES ('decide-payment', 'vehicle_application', 'Payment Decision', 'decision', 6, 0, NULL, NULL, '[fillColor:\"#c0c0c0\",type:\"decision\",pos:[765,183],size:[90,65]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('draft', 'vehicle_application', 'Draft', 'state', 2, 0, 'VEHICLE', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[135,79],size:[87,50]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('end', 'vehicle_application', 'End', 'end', 8, 0, 'VEHICLE', NULL, '[fillColor:\"#ff0000\",type:\"end\",pos:[1099,210],size:[32,32]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('payment', 'vehicle_application', 'For Payment', 'state', 5, 0, 'VEHICLE', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[594,146],size:[100,50]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('release', 'vehicle_application', 'For Release', 'state', 7, 0, 'VEHICLE', NULL, '[fillColor:\"#c0c0c0\",type:\"state\",pos:[951,99],size:[100,50]]', '[show_issue_permit:true]', 1);
INSERT INTO `sys_wf_node` VALUES ('start', 'vehicle_application', 'Start', 'start', 1, 0, 'VEHICLE', NULL, '[fillColor:\"#00ff00\",type:\"start\",pos:[62,37],size:[32,32]]', '[:]', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_wf_transition
-- ----------------------------
DROP TABLE IF EXISTS `sys_wf_transition`;
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

-- ----------------------------
-- Records of sys_wf_transition
-- ----------------------------
BEGIN;
INSERT INTO `sys_wf_transition` VALUES ('approval', 'vehicle_application', 'revert', 'assessment', 0, NULL, '[:]', NULL, 'Revert', '[points:[422,151,316,151,316,94],type:\"arrow\",pos:[316,94],size:[106,57]]');
INSERT INTO `sys_wf_transition` VALUES ('approval', 'vehicle_application', 'submit', 'payment', 0, NULL, '[:]', NULL, 'Approve for Payment', '[points:[522,148,594,169],type:\"arrow\",pos:[522,148],size:[72,21]]');
INSERT INTO `sys_wf_transition` VALUES ('approval', 'vehicle_application', 'approve-capture', 'release', 0, NULL, '[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]', NULL, 'Approve (Capture Paid)', '[points:[482,172,551,338,717,405,980,287,976,150,976,149],type:\"arrow\",pos:[482,149],size:[498,256]]');
INSERT INTO `sys_wf_transition` VALUES ('assessment', 'vehicle_application', 'submit', 'approval', 0, NULL, '[:]', NULL, 'Submit for Approval', '[points:[375,63,474,62,477,125],type:\"arrow\",pos:[375,62],size:[102,63]]');
INSERT INTO `sys_wf_transition` VALUES ('assessment', 'vehicle_application', 'revert', 'draft', 1, NULL, '[:]', NULL, 'Revert', '[points:[278,80,222,96],type:\"arrow\",pos:[222,80],size:[56,16]]');
INSERT INTO `sys_wf_transition` VALUES ('decide-payment', 'vehicle_application', 'fail', 'payment', 0, 'amtdue != 0', '[:]', NULL, 'Payment Failed', '[points:[809,249,810,298,644,299,642,196],type:\"arrow\",pos:[642,196],size:[168,103]]');
INSERT INTO `sys_wf_transition` VALUES ('decide-payment', 'vehicle_application', 'success', 'release', 0, 'amtdue == 0', '[:]', NULL, 'Success Pay', '[points:[809,185,809,142,954,124],type:\"arrow\",pos:[809,124],size:[145,61]]');
INSERT INTO `sys_wf_transition` VALUES ('draft', 'vehicle_application', 'forapproval', 'approval', 5, NULL, '[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]', NULL, 'For Approval (Capture)', '[points:[189,129,223,203,349,234,436,172],type:\"arrow\",pos:[189,129],size:[247,105]]');
INSERT INTO `sys_wf_transition` VALUES ('draft', 'vehicle_application', 'submit', 'assessment', 0, NULL, '[:]', NULL, 'Submit for Assessment', '[points:[222,113,243,119,278,56],type:\"arrow\",pos:[222,56],size:[56,63]]');
INSERT INTO `sys_wf_transition` VALUES ('payment', 'vehicle_application', 'reverse-payment', 'approval', 10, NULL, '[:]', NULL, 'Reverse Payment', '[points:[627,146,629,95,533,72,518,122],type:\"arrow\",pos:[518,72],size:[111,74]]');
INSERT INTO `sys_wf_transition` VALUES ('payment', 'vehicle_application', 'post', 'decide-payment', 0, NULL, '[visible:false]', NULL, 'Post Payment', '[points:[694,184,727,185,729,218,769,219],type:\"arrow\",pos:[694,184],size:[75,35]]');
INSERT INTO `sys_wf_transition` VALUES ('release', 'vehicle_application', 'submit', 'end', 0, NULL, '[:]', NULL, 'Release', '[points:[1020,149,1102,210],type:\"arrow\",pos:[1020,149],size:[82,61]]');
INSERT INTO `sys_wf_transition` VALUES ('start', 'vehicle_application', 'start', 'draft', 0, NULL, '[:]', NULL, 'Submit', '[points:[94,57,135,91],type:\"arrow\",pos:[94,57],size:[41,34]]');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application`;
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

-- ----------------------------
-- Records of vehicle_application
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_application` VALUES ('VAPP-225dbdaf:1695621ab86:-7ffd', NULL, NULL, 'TRI-2019030001', '2019-03-07', 'NEW', 'ONLINE', '2019-03-07 11:10:41', NULL, NULL, NULL, NULL, '2019-03-07', NULL, NULL, 50.00);
INSERT INTO `vehicle_application` VALUES ('VAPP-4c143630:169861f4f39:-7fdc', NULL, NULL, 'TRI-2019030004', '2019-03-16', 'NEW', 'ONLINE', '2019-03-16 18:57:12', NULL, NULL, 'asas', NULL, '2019-03-16', 'VPERM3637f4d0:1698665001d:-7fb1', NULL, 50.00);
INSERT INTO `vehicle_application` VALUES ('VAPP-6182c0b7:1698bc1eaaa:-7fca', NULL, NULL, 'TRI-2019030006', '2019-03-17', 'CHANGE_OWNER', 'ONLINE', '2019-03-17 21:35:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vehicle_application` VALUES ('VAPP19c565f3:1695c97d599:-7fe3', NULL, NULL, 'TRI-2019030003', '2019-03-08', 'CHANGE_OWNER', 'ONLINE', '2019-03-08 17:24:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00);
INSERT INTO `vehicle_application` VALUES ('VAPP48046b0e:1690a0fb606:-7ff1', NULL, NULL, 'TRI-2019020029', '2019-02-20', 'NEW', 'CAPTURE', '2019-02-20 16:47:06', NULL, NULL, 'sample', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `vehicle_application` VALUES ('VAPP48046b0e:1690a0fb606:-7ffd', NULL, NULL, 'TRI-2019020028', '2019-02-20', 'NEW', 'ONLINE', '2019-02-20 16:39:55', NULL, NULL, NULL, NULL, NULL, 'VPERM-2738a4fe:1691d554d32:-7fff', NULL, 100.00);
INSERT INTO `vehicle_application` VALUES ('VAPP7435c503:1698be6666b:-7ff6', 'VFYR7435c503:1698be6666b:-7ffa', 'VINFO7435c503:1698be6666b:-7ffb', 'TRI-2019030007', '2019-03-17', 'NEW', 'ONLINE', '2019-03-17 21:47:07', NULL, NULL, 'sample mtop', 'VAPPTSK7435c503:1698be6666b:-7f7c', '2019-03-17', 'VPERM7435c503:1698be6666b:-7f82', NULL, 50.00);
INSERT INTO `vehicle_application` VALUES ('VAPPb8d288:1691e06eaca:-7ffe', NULL, NULL, 'TRI-2019020031', '2019-02-24', 'CHANGE_OWNER_UNIT', 'ONLINE', '2019-02-24 13:42:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application_fee
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_fee`;
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

-- ----------------------------
-- Records of vehicle_application_fee
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_application_fee` VALUES ('VAPPF7435c503:1698be6666b:-7fc6', 'VAPP7435c503:1698be6666b:-7ff6', 'REVITEM-46b788af:140b8f5265d:-7f48', '585-0002', 'OCCUPATION FEES - EMPLOYEES/PERSONNEL', 50.0000, 50.0000, NULL, 1000);
INSERT INTO `vehicle_application_fee` VALUES ('VAPPF7435c503:1698be6666b:-7fc7', 'VAPP7435c503:1698be6666b:-7ff6', 'REVITEM217a91b:1409e6ae44e:-7ea7', '584-0002', 'FRANCHISE TAX - MTOP', 100.0000, 100.0000, NULL, 1000);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application_info
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_info`;
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

-- ----------------------------
-- Records of vehicle_application_info
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_application_info` VALUES ('VAPPI-4c143630:169861f4f39:-7f49', 'VAPP-4c143630:169861f4f39:-7fdc', 'NO_OF_EMPLOYEE', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_application_info` VALUES ('VAPPI-61d5d657:16956523ddd:-7ffa', 'VAPP-225dbdaf:1695621ab86:-7ffd', 'NO_OF_EMPLOYEE', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_application_info` VALUES ('VAPPI-61d5d657:16956523ddd:-8000', 'VAPP48046b0e:1690a0fb606:-7ffd', 'NO_OF_EMPLOYEE', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_application_info` VALUES ('VAPPI19c565f3:1695c97d599:-7fc7', 'VAPP19c565f3:1695c97d599:-7fe3', 'NO_OF_EMPLOYEE', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_application_info` VALUES ('VAPPI7435c503:1698be6666b:-7fc8', 'VAPP7435c503:1698be6666b:-7ff6', 'NO_OF_EMPLOYEE', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application_task
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_task`;
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

-- ----------------------------
-- Records of vehicle_application_task
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7f7c', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'end', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 21:55:04', 'VAPPTSK7435c503:1698be6666b:-7f99');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7f99', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'release', '2019-03-17 21:48:01', '2019-03-17 21:55:04', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', 'balance unpaid:0.0000', '2019-03-17 21:48:01', 'VAPPTSK7435c503:1698be6666b:-7fae');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7fae', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'payment', NULL, '2019-03-17 21:48:01', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, '2019-03-17 21:47:24', 'VAPPTSK7435c503:1698be6666b:-7fbc');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7fbc', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'approval', NULL, '2019-03-17 21:47:24', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, '2019-03-17 21:47:21', 'VAPPTSK7435c503:1698be6666b:-7fd8');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7fd8', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'assessment', NULL, '2019-03-17 21:47:21', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, '2019-03-17 21:47:12', 'VAPPTSK7435c503:1698be6666b:-7ff0');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7ff0', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'draft', '2019-03-17 21:47:07', '2019-03-17 21:47:12', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, '2019-03-17 21:47:08', 'VAPPTSK7435c503:1698be6666b:-7ff4');
INSERT INTO `vehicle_application_task` VALUES ('VAPPTSK7435c503:1698be6666b:-7ff4', 'VAPP7435c503:1698be6666b:-7ff6', NULL, 'start', '2019-03-17 21:47:08', '2019-03-17 21:47:08', NULL, NULL, 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, '2019-03-17 21:47:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application_unit
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_unit`;
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

-- ----------------------------
-- Records of vehicle_application_unit
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_application_unit` VALUES ('VAUNIT7435c503:1698be6666b:-7ff5', 'VAPP7435c503:1698be6666b:-7ff6', 'VUNIT7435c503:1698be6666b:-7ff7');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_application_unit_dropped
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_unit_dropped`;
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

-- ----------------------------
-- Table structure for vehicle_billitem_txntype
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_billitem_txntype`;
CREATE TABLE `vehicle_billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_billitem_txntype
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_billitem_txntype` VALUES ('FEE', 'FEE');
INSERT INTO `vehicle_billitem_txntype` VALUES ('INTEREST', 'INTEREST');
INSERT INTO `vehicle_billitem_txntype` VALUES ('SURCHARGE', 'SURCHARGE');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_franchise
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_franchise`;
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

-- ----------------------------
-- Records of vehicle_franchise
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190001', 'OPEN', 'MTOP-20190001', 'tricycle', 'VFYR7435c503:1698be6666b:-7ffa');
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190002', 'OPEN', 'MTOP-20190002', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190003', 'OPEN', 'MTOP-20190003', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190004', 'OPEN', 'MTOP-20190004', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190005', 'OPEN', 'MTOP-20190005', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190006', 'OPEN', 'MTOP-20190006', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190007', 'OPEN', 'MTOP-20190007', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190008', 'OPEN', 'MTOP-20190008', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190009', 'OPEN', 'MTOP-20190009', 'tricycle', NULL);
INSERT INTO `vehicle_franchise` VALUES ('MTOP-20190010', 'OPEN', 'MTOP-20190010', 'tricycle', NULL);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_franchise_generalinfo
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_franchise_generalinfo`;
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

-- ----------------------------
-- Records of vehicle_franchise_generalinfo
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_franchise_generalinfo` VALUES ('VINFO7435c503:1698be6666b:-7ffb', 'IND-1001d137:15dde15991e:-1488', 'LUNGAT, LIGAYA', 'ADDR-1dd97113:15dde44601e:-19d7', 'DAO, TAGBILARAN CITY', NULL, NULL, NULL, 'MTOP-20190001');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_franchise_year
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_franchise_year`;
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

-- ----------------------------
-- Records of vehicle_franchise_year
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_franchise_year` VALUES ('VFYR7435c503:1698be6666b:-7ffa', 2019, 'MTOP-20190001', 'VINFO7435c503:1698be6666b:-7ffb', 'VAPP7435c503:1698be6666b:-7ff6', NULL, '2020-01-01');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_payment
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_payment`;
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

-- ----------------------------
-- Records of vehicle_payment
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_payment` VALUES ('RCT49a1ccb4:1698be7738f:-7ff8', 'VAPP7435c503:1698be6666b:-7ff6', NULL, NULL, 'RCT49a1ccb4:1698be7738f:-7ff8', 'cashreceipt', 'A5100110', '2019-03-17', 150.0000, 0, 'ONLINE', NULL);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_payment_item`;
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

-- ----------------------------
-- Records of vehicle_payment_item
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_payment_item` VALUES ('RCTI49a1ccb4:1698be7738f:-7fef', 'RCT49a1ccb4:1698be7738f:-7ff8', NULL, NULL, 'REVITEM217a91b:1409e6ae44e:-7ea7', '584-0002', 'FRANCHISE TAX - MTOP', 100.0000, 0.0000, 0.0000, 0.0000, 'VAPPF7435c503:1698be6666b:-7fc7', 'vehicle_application_fee', NULL);
INSERT INTO `vehicle_payment_item` VALUES ('RCTI49a1ccb4:1698be7738f:-7ff0', 'RCT49a1ccb4:1698be7738f:-7ff8', NULL, NULL, 'REVITEM-46b788af:140b8f5265d:-7f48', '585-0002', 'OCCUPATION FEES - EMPLOYEES/PERSONNEL', 50.0000, 0.0000, 0.0000, 0.0000, 'VAPPF7435c503:1698be6666b:-7fc6', 'vehicle_application_fee', NULL);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_permit
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_permit`;
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

-- ----------------------------
-- Records of vehicle_permit
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_permit` VALUES ('VPERM7435c503:1698be6666b:-7f82', 'ACTIVE', 'MTOP-00000002', 'STANDARD', '2019-03-17', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN . ADMIN', NULL, 'VAPP7435c503:1698be6666b:-7ff6', 'ONLINE');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_unit
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_unit`;
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

-- ----------------------------
-- Records of vehicle_unit
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_unit` VALUES ('VUNIT7435c503:1698be6666b:-7ff7', '888-999-001', 'ENG01', 'BODY777', NULL, 'HONDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_variable
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_variable`;
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

-- ----------------------------
-- Records of vehicle_variable
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_variable` VALUES ('NO_OF_EMPLOYEE', 'DRAFT', 'NO_OF_EMPLOYEE', 'NO. OF EMPLOYEE', NULL, 'integer', NULL, 0, 0, '[]');
INSERT INTO `vehicle_variable` VALUES ('NO_OF_PERSON', 'DRAFT', 'NO_OF_PERSON', 'NO. OF PERSON', NULL, 'integer', NULL, 0, 0, '[]');
INSERT INTO `vehicle_variable` VALUES ('NUM_UNITS', 'DRAFT', 'NUM_UNITS', 'NUM UNITS', NULL, 'integer', NULL, 1, 0, '[]');
COMMIT;

-- ----------------------------
-- Table structure for vehicletype
-- ----------------------------
DROP TABLE IF EXISTS `vehicletype`;
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

-- ----------------------------
-- Records of vehicletype
-- ----------------------------
BEGIN;
INSERT INTO `vehicletype` VALUES ('boat', 'BOAT', NULL, 0, NULL, 0, '.*', NULL, NULL, 'YEAR');
INSERT INTO `vehicletype` VALUES ('ebike', 'E-BIKE', 'EB-[yyyy][MM][%06d]', NULL, 'EBAPP-[yyyy][MM][%06d]', 0, '.*', NULL, NULL, 'YEAR');
INSERT INTO `vehicletype` VALUES ('motorcycle', 'MOTORIZED TRICYCLE OPERATORS PERMIT', 'MMM[yyyy][%06d]', NULL, 'MAPP[yyyy][cluster][%06d]', 0, 'plateno|engineno|bodyno|driver.name|remarks', NULL, 'MP[yyyy]-[MM]-[cluster][%06d]', 'YEAR');
INSERT INTO `vehicletype` VALUES ('pedicab', 'PEDICAB', 'PED-[yyyy]-[MM][%06d]', 2, 'PEDAPP-[yyyy]-[MM][%06d]', 0, 'plateno|engineno|bodyno|sidecarno|make|model|color|chassisno|sidecarcolor|crname|driver.name|remarks', NULL, NULL, 'YEAR');
INSERT INTO `vehicletype` VALUES ('sikad', 'SIKAD', 'SK-[yyyy][MM][%05d]', NULL, 'SKA-[yyyy][MM][%05d]', 0, '.*', NULL, NULL, 'YEAR');
INSERT INTO `vehicletype` VALUES ('tricycle', 'MTOP', 'MTOP-[yyyy][%04d]', 1, 'TRI-[yyyy][MM][%04d]', 10, 'plateno|engineno|bodyno|make', NULL, 'MTOP-[%08d]', 'YEAR');
INSERT INTO `vehicletype` VALUES ('van', 'VAN', 'V[yyyy][%8d]', NULL, 'VA[yyyy][%8d]', 0, 'plateno|engineno|bodyno|sidecarno|make|model|color|chassisno|sidecarcolor|crname|driver.name|remarks', NULL, 'VAN-[yyyy][%8d]', 'YEAR');
COMMIT;

-- ----------------------------
-- View structure for vw_vehicle_application
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_application`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_application` AS select `va`.`objid` AS `objid`,`va`.`franchiseyearid` AS `franchiseyearid`,`va`.`geninfoid` AS `geninfoid`,`va`.`appno` AS `appno`,`va`.`appdate` AS `appdate`,`va`.`apptype` AS `apptype`,`va`.`txnmode` AS `txnmode`,`va`.`dtcreated` AS `dtcreated`,`va`.`createdby_objid` AS `createdby_objid`,`va`.`createdby_name` AS `createdby_name`,`va`.`particulars` AS `particulars`,`va`.`taskid` AS `taskid`,`va`.`dtapproved` AS `dtapproved`,`va`.`permitid` AS `permitid`,`va`.`prevappid` AS `prevappid`,`va`.`amount` AS `amount`,`vf`.`objid` AS `franchiseid`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vf`.`controlno` AS `controlno`,`vfy`.`year` AS `year`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfgi`.`mobileno` AS `mobileno`,`vfgi`.`phoneno` AS `phoneno`,`vfgi`.`email` AS `email`,`vat`.`state` AS `task_state`,`vat`.`startdate` AS `task_startdate`,`vat`.`enddate` AS `task_enddate`,`vat`.`assignee_objid` AS `task_assignee_objid`,`vat`.`assignee_name` AS `task_assignee_name`,`vat`.`actor_objid` AS `task_actor_objid`,`vat`.`actor_name` AS `task_actor_name`,`vfy`.`renewaldate` AS `renewaldate`,`vp`.`permitno` AS `permit_permitno`,`vp`.`permittype` AS `permit_permittype`,`vp`.`dtissued` AS `permit_dtissued`,`vp`.`expirydate` AS `permit_expirydate`,`vp`.`issuedby_name` AS `permit_issuedby_name` from (((((`vehicle_application` `va` join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`))) join `vehicle_franchise_generalinfo` `vfgi` on((`va`.`geninfoid` = `vfgi`.`objid`))) left join `vehicle_application_task` `vat` on((`va`.`taskid` = `vat`.`taskid`))) left join `vehicle_permit` `vp` on((`vp`.`objid` = `va`.`permitid`)));

-- ----------------------------
-- View structure for vw_vehicle_franchise
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_franchise`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_franchise` AS select `vf`.`objid` AS `objid`,`vf`.`state` AS `state`,`vf`.`controlno` AS `controlno`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vf`.`currentyearid` AS `currentyearid`,`vfy`.`year` AS `year`,`vfgi`.`objid` AS `geninfoid`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfy`.`renewaldate` AS `renewaldate` from ((`vehicle_franchise` `vf` left join `vehicle_franchise_year` `vfy` on((`vf`.`currentyearid` = `vfy`.`objid`))) left join `vehicle_franchise_generalinfo` `vfgi` on((`vfy`.`geninfoid` = `vfgi`.`objid`)));

-- ----------------------------
-- View structure for vw_vehicle_franchise_unit_active
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_franchise_unit_active`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_franchise_unit_active` AS select `vau`.`objid` AS `objid`,`vau`.`appid` AS `appid`,`vau`.`unitid` AS `unitid`,`vf`.`objid` AS `franchiseid`,`va`.`apptype` AS `apptype`,`va`.`appno` AS `appno` from ((((`vehicle_application_unit` `vau` join `vehicle_application` `va` on((`vau`.`appid` = `va`.`objid`))) join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vf`.`currentyearid` = `vfy`.`objid`))) left join `vehicle_application_unit_dropped` `vaud` on((`vaud`.`appunitid` = `vau`.`objid`))) where isnull(`vaud`.`objid`);

-- ----------------------------
-- View structure for vw_vehicle_franchise_year
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_franchise_year`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_franchise_year` AS select `vfy`.`objid` AS `objid`,`vfy`.`year` AS `year`,`vf`.`controlno` AS `controlno`,`vf`.`vehicletypeid` AS `vehicletypeid`,`vfgi`.`owner_objid` AS `owner_objid`,`vfgi`.`owner_name` AS `owner_name`,`vfgi`.`owner_address_objid` AS `owner_address_objid`,`vfgi`.`owner_address_text` AS `owner_address_text`,`vfy`.`renewaldate` AS `renewaldate` from ((`vehicle_franchise_year` `vfy` join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`))) join `vehicle_franchise_generalinfo` `vfgi` on((`vfy`.`geninfoid` = `vfgi`.`objid`)));

-- ----------------------------
-- View structure for vw_vehicle_permit
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_permit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_permit` AS select `vp`.`objid` AS `objid`,`vp`.`state` AS `state`,`vp`.`permitno` AS `permitno`,`vp`.`permittype` AS `permittype`,`vp`.`dtissued` AS `dtissued`,`vp`.`issuedby_objid` AS `issuedby_objid`,`vp`.`issuedby_name` AS `issuedby_name`,`vp`.`expirydate` AS `expirydate`,`vp`.`appid` AS `appid`,`vp`.`txnmode` AS `txnmode`,`vf`.`controlno` AS `controlno`,`va`.`appno` AS `appno`,`va`.`appdate` AS `appdate`,`vg`.`owner_objid` AS `owner_objid`,`vg`.`owner_name` AS `owner_name`,`vg`.`owner_address_text` AS `owner_address_text`,`vg`.`phoneno` AS `phoneno`,`vg`.`email` AS `email`,`vg`.`mobileno` AS `mobileno` from ((((`vehicle_permit` `vp` join `vehicle_application` `va` on((`vp`.`appid` = `va`.`objid`))) join `vehicle_franchise_generalinfo` `vg` on((`va`.`geninfoid` = `vg`.`objid`))) join `vehicle_franchise_year` `vfy` on((`va`.`franchiseyearid` = `vfy`.`objid`))) join `vehicle_franchise` `vf` on((`vfy`.`franchiseid` = `vf`.`objid`)));

-- ----------------------------
-- View structure for vw_vehicle_unit
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_unit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_unit` AS select `fy`.`year` AS `year`,`vf`.`controlno` AS `controlno`,`vgi`.`owner_objid` AS `owner_objid`,`vgi`.`owner_name` AS `owner_name`,`vu`.`objid` AS `objid`,`vu`.`plateno` AS `plateno`,`vu`.`engineno` AS `engineno`,`vu`.`bodyno` AS `bodyno`,`vu`.`sidecarno` AS `sidecarno`,`vu`.`make` AS `make`,`vu`.`model` AS `model`,`vu`.`color` AS `color`,`vu`.`chassisno` AS `chassisno`,`vu`.`sidecarcolor` AS `sidecarcolor`,`vu`.`crname` AS `crname`,`vu`.`driver_objid` AS `driver_objid`,`vu`.`driver_name` AS `driver_name`,`vu`.`remarks` AS `remarks`,`vt`.`objid` AS `vehicletype_objid`,`vt`.`title` AS `vehicletype_title`,`vt`.`allowedfields` AS `vehicletype_allowedfields` from ((((((`vehicle_unit` `vu` join `vehicle_application_unit` `vau` on((`vau`.`unitid` = `vu`.`objid`))) join `vehicle_application` `va` on((`vau`.`appid` = `va`.`objid`))) join `vehicle_franchise_year` `fy` on((`va`.`franchiseyearid` = `fy`.`objid`))) join `vehicle_franchise_generalinfo` `vgi` on((`fy`.`geninfoid` = `vgi`.`objid`))) join `vehicle_franchise` `vf` on((`fy`.`franchiseid` = `vf`.`objid`))) join `vehicletype` `vt` on((`vf`.`vehicletypeid` = `vt`.`objid`))) where (not(`vau`.`objid` in (select `vehicle_application_unit_dropped`.`appunitid` from `vehicle_application_unit_dropped`)));

-- ----------------------------
-- View structure for vw_vehicle_unit_snapshot
-- ----------------------------
DROP VIEW IF EXISTS `vw_vehicle_unit_snapshot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_vehicle_unit_snapshot` AS select `vau`.`objid` AS `objid`,`va`.`appno` AS `appno`,`va`.`apptype` AS `apptype`,`va`.`objid` AS `appid`,`va`.`permitid` AS `permitid`,`va2`.`appno` AS `histappno`,`va`.`appdate` AS `appdate`,`va`.`franchiseyearid` AS `franchiseyearid`,`vu`.`objid` AS `unit_objid`,`vu`.`plateno` AS `unit_plateno`,`vu`.`engineno` AS `unit_engineno`,`vu`.`bodyno` AS `unit_bodyno`,`vu`.`sidecarno` AS `unit_sidecarno`,`vu`.`make` AS `unit_make`,`vu`.`model` AS `unit_model`,`vu`.`color` AS `unit_color`,`vu`.`chassisno` AS `unit_chassisno`,`vu`.`sidecarcolor` AS `unit_sidecarcolor`,`vu`.`crname` AS `unit_crname`,`vu`.`driver_objid` AS `unit_driver_objid`,`vu`.`driver_name` AS `unit_driver_name`,`vu`.`remarks` AS `unit_remarks` from (((((`vehicle_application` `va` join `vehicle_application` `va2` on((`va2`.`franchiseyearid` = `va`.`franchiseyearid`))) join `vehicle_application_unit` `vau` on((`vau`.`appid` = `va2`.`objid`))) join `vehicle_unit` `vu` on((`vau`.`unitid` = `vu`.`objid`))) left join `vehicle_application_unit_dropped` `vaud` on((`vaud`.`appunitid` = `vau`.`objid`))) left join `vehicle_application` `vauda` on((`vaud`.`appid` = `vauda`.`objid`))) where ((`va2`.`dtcreated` <= `va`.`dtcreated`) and (isnull(`vauda`.`dtcreated`) or (`vauda`.`dtcreated` > `va`.`dtcreated`))) order by `va`.`dtcreated`;

SET FOREIGN_KEY_CHECKS = 1;
