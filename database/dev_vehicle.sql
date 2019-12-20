/*
 Navicat Premium Data Transfer

 Source Server         : etracs-mysql
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : dev_vehicle

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 20/12/2019 15:15:58
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
INSERT INTO `sys_rule` VALUES ('RUL-57c2d992:164ee592b63:-7e1f', 'DEPLOYED', 'MOTORCYCLE_RENEWAL_DATE', 'vehicledates', 'initial', 'MOTORCYCLE RENEWAL DATE', NULL, 50000, NULL, NULL, '2018-07-31 11:29:18', 'USR-1b82c604:14cc29913bb:-7fec', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-63d80782:16f0ef8d63b:-7da6', 'DEPLOYED', 'DROP_UNIT', 'vehicleassessment', 'compute-fee', 'DROP UNIT', NULL, 50000, NULL, NULL, '2019-12-16 21:52:56', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL-79820a3e:16f0c625123:-6529', 'APPROVED', 'MTOP_EXPIRYDATE', 'vehicledates', 'initial', 'MTOP EXPIRY DATE', NULL, 50000, NULL, NULL, '2019-12-16 11:01:30', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL17933c33:16f0d58ef1c:-710c', 'DEPLOYED', 'MTOP_NEW_FEES', 'vehicleassessment', 'compute-fee', 'MTOP_NEW_FEES', NULL, 50000, NULL, NULL, '2019-12-16 14:45:58', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL17933c33:16f0d58ef1c:-78e5', 'DEPLOYED', 'MTOP_NEW_AND_RENEW_FEES', 'vehicleassessment', 'compute-fee', 'MTOP_NEW_AND_RENEW_FEES', NULL, 50000, NULL, NULL, '2019-12-16 14:39:24', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL25a92016:16f12b9d331:-6cd9', 'DEPLOYED', 'MOTORBOAT_FEE', 'vehicleassessment', 'compute-fee', 'MOTORBOAT FEE	', NULL, 50000, NULL, NULL, '2019-12-17 15:41:03', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL25a92016:16f12b9d331:-7494', 'DEPLOYED', 'MOTORBOAT_EXPIRY_DATE', 'vehicledates', 'initial', 'MOTORBOAT_EXPIRY_DATE', NULL, 50000, NULL, NULL, '2019-12-17 15:25:38', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL351e5058:16f0df7bfd7:-73ce', 'DEPLOYED', 'CHANGE_OWNER_UNIT', 'vehicleassessment', 'compute-fee', 'CHANGE OWNER UNIT', NULL, 50000, NULL, NULL, '2019-12-16 17:18:10', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL351e5058:16f0df7bfd7:-74c0', 'DEPLOYED', 'CHANGE_OWNER', 'vehicleassessment', 'compute-fee', 'CHANGE OWNER', NULL, 50000, NULL, NULL, '2019-12-16 17:17:26', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL351e5058:16f0df7bfd7:-7864', 'DEPLOYED', 'CHANGE_UNIT', 'vehicleassessment', 'compute-fee', 'CHANGE UNIT', NULL, 50000, NULL, NULL, '2019-12-16 17:15:43', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL3cf2bbd6:16ef4232a61:-7d8e', 'APPROVED', 'APPLY_PAYMENT', 'vehiclebilling', 'apply-payment', 'APPLY PAYMENT TO HANDLE PARTIAL PAYMENT', NULL, 50000, NULL, NULL, '2019-12-12 10:30:15', 'anzanoe', 'ANZANOE', 1);
INSERT INTO `sys_rule` VALUES ('RUL4adb13dd:16c88dfc11c:-7b80', 'APPROVED', 'SET_BILL_ITEM_DUE_DATE', 'vehiclebilling', 'initial', 'set billitem due dates', NULL, 50000, NULL, NULL, '2019-08-13 11:02:50', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
INSERT INTO `sys_rule` VALUES ('RUL9c39035:16f0d95ddf6:-7cf8', 'DEPLOYED', 'MTOP_SURCHARGE_PER_YEAR', 'vehiclebilling', 'surcharge', 'MTOP_SURCHARGE_PER_YEAR', NULL, 50000, NULL, NULL, '2019-12-16 15:28:05', 'USR-6bf98eba:1254696a2c9:-7ff6', 'ADMIN', 1);
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
INSERT INTO `sys_rule_action` VALUES ('RA437a7884:16f0efafa31:-7ff8', 'RUL-63d80782:16f0ef8d63b:-7da6', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RA716ac8c6:16f0db01197:-7f9e', 'RUL351e5058:16f0df7bfd7:-73ce', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RA716ac8c6:16f0db01197:-7fa7', 'RUL351e5058:16f0df7bfd7:-74c0', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-13e7ffc3:16c88adffee:-7a6a', 'RUL-57c2d992:164ee592b63:-7e1f', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT-79820a3e:16f0c625123:-63da', 'RUL-79820a3e:16f0c625123:-6529', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-6f00', 'RUL17933c33:16f0d58ef1c:-710c', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-71f9', 'RUL17933c33:16f0d58ef1c:-78e5', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-72fd', 'RUL17933c33:16f0d58ef1c:-78e5', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-740a', 'RUL17933c33:16f0d58ef1c:-78e5', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-7519', 'RUL17933c33:16f0d58ef1c:-78e5', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT17933c33:16f0d58ef1c:-7627', 'RUL17933c33:16f0d58ef1c:-78e5', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT25a92016:16f12b9d331:-6a80', 'RUL25a92016:16f12b9d331:-6cd9', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT25a92016:16f12b9d331:-7371', 'RUL25a92016:16f12b9d331:-7494', 'treasury.actions.AddVarDate', 'add-vardate', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT351e5058:16f0df7bfd7:-75a2', 'RUL351e5058:16f0df7bfd7:-7864', 'treasury.actions.AddBillItem', 'add-billitem', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT3cf2bbd6:16ef4232a61:-7bfe', 'RUL3cf2bbd6:16ef4232a61:-7d8e', 'treasury.actions.ApplyPayment', 'apply-payment', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT4adb13dd:16c88dfc11c:-7475', 'RUL4adb13dd:16c88dfc11c:-7b80', 'treasury.actions.SetBillItemProperty', 'set-billitem-property', 0);
INSERT INTO `sys_rule_action` VALUES ('RACT4e9b2048:16f0da608f1:-7c28', 'RUL9c39035:16f0d95ddf6:-7cf8', 'treasury.actions.AddBillItem', 'add-billitem', 0);
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
INSERT INTO `sys_rule_action_param` VALUES ('RAP437a7884:16f0efafa31:-7ff5', 'RA437a7884:16f0efafa31:-7ff8', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP437a7884:16f0efafa31:-7ff6', 'RA437a7884:16f0efafa31:-7ff8', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHANGE_OWNERSHIP', 'CHANGE OF OWNERSHIP', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP437a7884:16f0efafa31:-7ff7', 'RA437a7884:16f0efafa31:-7ff8', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '1000', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7f9b', 'RA716ac8c6:16f0db01197:-7f9e', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '1000', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7f9c', 'RA716ac8c6:16f0db01197:-7f9e', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHANGE_OWNERSHIP', 'CHANGE OF OWNERSHIP', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7f9d', 'RA716ac8c6:16f0db01197:-7f9e', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7fa4', 'RA716ac8c6:16f0db01197:-7fa7', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7fa5', 'RA716ac8c6:16f0db01197:-7fa7', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHANGE_OWNERSHIP', 'CHANGE OF OWNERSHIP', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RAP716ac8c6:16f0db01197:-7fa6', 'RA716ac8c6:16f0db01197:-7fa7', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '500', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-13e7ffc3:16c88adffee:-7a42', 'RACT-13e7ffc3:16c88adffee:-7a6a', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'int yr = @YEAR( APPDATE  );\nint mon = @MONTH( APPDATE  );\nint day = @DAY( APPDATE  );\nif( mon < 10 ) {\n     return @DATE( yr , 10,  31 );    \n};\nelse {\n     return @DATE( yr + 1, 10, 31 );\n};', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-13e7ffc3:16c88adffee:-7a58', 'RACT-13e7ffc3:16c88adffee:-7a6a', 'treasury.actions.AddVarDate.tag', 'expirydate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-79820a3e:16f0c625123:-63b2', 'RACT-79820a3e:16f0c625123:-63da', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, '@DATE( YR + 1, 10, 31 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT-79820a3e:16f0c625123:-63c8', 'RACT-79820a3e:16f0c625123:-63da', 'treasury.actions.AddVarDate.tag', 'permitexpirydate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-6e13', 'RACT17933c33:16f0d58ef1c:-6f00', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-6e45', 'RACT17933c33:16f0d58ef1c:-6f00', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SIDECAR_PLATENO', 'PLATENO FOR SIDECAR', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-6e92', 'RACT17933c33:16f0d58ef1c:-6f00', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-7149', 'RACT17933c33:16f0d58ef1c:-71f9', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-717a', 'RACT17933c33:16f0d58ef1c:-71f9', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'STICKER', 'STICKER', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-71c6', 'RACT17933c33:16f0d58ef1c:-71f9', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-724d', 'RACT17933c33:16f0d58ef1c:-72fd', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-727e', 'RACT17933c33:16f0d58ef1c:-72fd', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DRIVERS_AFFIDAVIT', 'DRIVERS AFFIDAVIT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-72ca', 'RACT17933c33:16f0d58ef1c:-72fd', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-7352', 'RACT17933c33:16f0d58ef1c:-740a', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-7387', 'RACT17933c33:16f0d58ef1c:-740a', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TARIFF_FEE', 'TARIFF FEE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-73d7', 'RACT17933c33:16f0d58ef1c:-740a', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-7453', 'RACT17933c33:16f0d58ef1c:-7519', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-749a', 'RACT17933c33:16f0d58ef1c:-7519', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ANNUAL_BUSINESS_PERMIT', 'ANNUAL BUSINESS PERMIT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-74e6', 'RACT17933c33:16f0d58ef1c:-7519', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-7575', 'RACT17933c33:16f0d58ef1c:-7627', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '1000', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-75a8', 'RACT17933c33:16f0d58ef1c:-7627', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FRANCHISE_FEE', 'FRANCHISE FEE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT17933c33:16f0d58ef1c:-75f4', 'RACT17933c33:16f0d58ef1c:-7627', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT25a92016:16f12b9d331:-69ca', 'RACT25a92016:16f12b9d331:-6a80', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '100', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT25a92016:16f12b9d331:-69ff', 'RACT25a92016:16f12b9d331:-6a80', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOTORBOAT_FEE', 'MOTOR BOAT', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT25a92016:16f12b9d331:-6a4d', 'RACT25a92016:16f12b9d331:-6a80', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT25a92016:16f12b9d331:-7349', 'RACT25a92016:16f12b9d331:-7371', 'treasury.actions.AddVarDate.date', NULL, NULL, NULL, NULL, 'int yr = @YEAR(   APPDATE );\nint mon = @MONTH( APPDATE  );\n\nif( mon < 3 ) {\n     return @DATE( yr-1, 3, 31 );\n};\nelse {\n     return @DATE( yr , 3, 31); \n};\n', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT25a92016:16f12b9d331:-735f', 'RACT25a92016:16f12b9d331:-7371', 'treasury.actions.AddVarDate.tag', 'expirydate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT351e5058:16f0df7bfd7:-74ee', 'RACT351e5058:16f0df7bfd7:-75a2', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '500', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT351e5058:16f0df7bfd7:-7523', 'RACT351e5058:16f0df7bfd7:-75a2', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CHANGE_MOTOR_VEHICLE', 'CHANGE OF MOTOR VEHICLE', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT351e5058:16f0df7bfd7:-756f', 'RACT351e5058:16f0df7bfd7:-75a2', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT3cf2bbd6:16ef4232a61:-7bf2', 'RACT3cf2bbd6:16ef4232a61:-7bfe', 'treasury.actions.ApplyPayment.payment', NULL, NULL, 'RCOND3cf2bbd6:16ef4232a61:-7cd0', 'PMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT47877165:16c88fc2ebc:-7be1', 'RACT4adb13dd:16c88dfc11c:-7475', 'treasury.actions.SetBillItemProperty.billitem', NULL, NULL, 'RCOND4adb13dd:16c88dfc11c:-7ac9', 'BILLITEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT4adb13dd:16c88dfc11c:-7424', 'RACT4adb13dd:16c88dfc11c:-7475', 'treasury.actions.SetBillItemProperty.value', NULL, NULL, NULL, NULL, '@DATE( YR + 1, 1 , 20 )', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT4adb13dd:16c88dfc11c:-7456', 'RACT4adb13dd:16c88dfc11c:-7475', 'treasury.actions.SetBillItemProperty.fieldname', 'duedate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT4e9b2048:16f0da608f1:-71fc', 'RACT4e9b2048:16f0da608f1:-7c28', 'treasury.actions.AddBillItem.amount', NULL, NULL, NULL, NULL, '@MONTHDIFF(  @DATE( YR-1 , 11 , 1 ),  CDATE, 1 )  * 300', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT4e9b2048:16f0da608f1:-722f', 'RACT4e9b2048:16f0da608f1:-7c28', 'treasury.actions.AddBillItem.billcode', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE_PENALTY', 'PENALTY', NULL, NULL, NULL);
INSERT INTO `sys_rule_action_param` VALUES ('RULACT4e9b2048:16f0da608f1:-7bee', 'RACT4e9b2048:16f0da608f1:-7c28', 'treasury.actions.AddBillItem.year', NULL, NULL, NULL, NULL, 'YR', 'expression', NULL, NULL, NULL, NULL, NULL, NULL);
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
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddInfo', 'add-info', 'Add Info', 0, 'add-info', 'ENTERPRISE', 'enterprise.actions.AddInfo');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AddRequirement', 'add-requirement', 'Add Requirement', 1, 'add-requirement', 'ENTERPRISE', 'enterprise.actions.AddRequirement');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.AskInfo', 'ask-info', 'Ask Info', 0, 'ask-info', 'ENTERPRISE', 'enterprise.actions.AskInfo');
INSERT INTO `sys_rule_actiondef` VALUES ('enterprise.actions.ThrowException', 'throw-exeception', 'Throw Exception', 1, 'throw-exeception', 'ENTERPRISE', 'enterprise.actions.ThrowException');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddBillItem', 'add-billitem', 'Add Bill Item', 2, 'add-billitem', 'TREASURY', 'treasury.actions.AddBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddDiscountItem', 'add-discount-item', 'Add Discount', 3, 'add-discount-item', 'TREASURY', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddDueDate', 'add-duedate', 'Add Due Date', 1, 'add-duedate', 'TREASURY', 'treasury.actions.AddDueDate');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddExcessBillItem', 'add-excess-billitem', 'Add Excess Bill Item', 2, 'add-excess-billitem', 'TREASURY', 'treasury.actions.AddExcessBillItem');
INSERT INTO `sys_rule_actiondef` VALUES ('treasury.actions.AddInterestItem', 'add-interest-item', 'Add Interest', 3, 'add-interest-item', 'TREASURY', 'treasury.actions.AddInterestItem');
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
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddInfo.aggtype', 'enterprise.actions.AddInfo', 'aggtype', 3, 'Aggregate Type', NULL, 'lov', NULL, NULL, NULL, NULL, 'INFO_AGGREGATE_TYPES');
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddInfo.name', 'enterprise.actions.AddInfo', 'name', 1, 'Name', NULL, 'lookup', 'variableinfo:lookup', 'name', 'name', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddInfo.value', 'enterprise.actions.AddInfo', 'value', 2, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AddRequirement.type', 'enterprise.actions.AddRequirement', 'type', 1, 'Type', NULL, 'lookup', 'requirementtype:lookup', 'objid', 'title', NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AskInfo.name', 'enterprise.actions.AskInfo', 'name', 1, 'Name', NULL, 'lookup', 'variableinfo:lookup', 'name', 'name', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.AskInfo.value', 'enterprise.actions.AskInfo', 'value', 2, 'Default Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('enterprise.actions.ThrowException.msg', 'enterprise.actions.ThrowException', 'msg', 1, 'Message', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.amount', 'treasury.actions.AddBillItem', 'amount', 1, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.billcode', 'treasury.actions.AddBillItem', 'billcode', 4, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.refid', 'treasury.actions.AddBillItem', 'refid', 3, 'Ref ID', NULL, 'var', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.remarks', 'treasury.actions.AddBillItem', 'remarks', 2, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddBillItem.year', 'treasury.actions.AddBillItem', 'year', 5, 'Year', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.amount', 'treasury.actions.AddDiscountItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.billcode', 'treasury.actions.AddDiscountItem', 'billcode', 3, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDiscountItem.billitem', 'treasury.actions.AddDiscountItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDueDate.date', 'treasury.actions.AddDueDate', 'date', 1, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddDueDate.tag', 'treasury.actions.AddDueDate', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.amount', 'treasury.actions.AddExcessBillItem', 'amount', 1, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddExcessBillItem.billcode', 'treasury.actions.AddExcessBillItem', 'billcode', 2, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.amount', 'treasury.actions.AddInterestItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.billcode', 'treasury.actions.AddInterestItem', 'billcode', 3, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddInterestItem.billitem', 'treasury.actions.AddInterestItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.amount', 'treasury.actions.AddSurchargeItem', 'amount', 2, 'Amount', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.billcode', 'treasury.actions.AddSurchargeItem', 'billcode', 3, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddSurchargeItem.billitem', 'treasury.actions.AddSurchargeItem', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.date', 'treasury.actions.AddVarDate', 'date', 2, 'Date', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDate.tag', 'treasury.actions.AddVarDate', 'tag', 1, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.tag', 'treasury.actions.AddVarDecimal', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarDecimal.value', 'treasury.actions.AddVarDecimal', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.tag', 'treasury.actions.AddVarInteger', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarInteger.value', 'treasury.actions.AddVarInteger', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.tag', 'treasury.actions.AddVarString', 'tag', 2, 'Tag', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.AddVarString.value', 'treasury.actions.AddVarString', 'value', 1, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.ApplyPayment.payment', 'treasury.actions.ApplyPayment', 'payment', 1, 'Payment', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.Payment', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.billcode', 'treasury.actions.SetBillItemAccount', 'billcode', 2, 'Item code', NULL, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemAccount.billitem', 'treasury.actions.SetBillItemAccount', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.billitem', 'treasury.actions.SetBillItemProperty', 'billitem', 1, 'Bill Item', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.BillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.fieldname', 'treasury.actions.SetBillItemProperty', 'fieldname', 2, 'Property Field Name', 'string', 'string', NULL, 'billitem', NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SetBillItemProperty.value', 'treasury.actions.SetBillItemProperty', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.aggtype', 'treasury.actions.SummarizeBillItem', 'aggtype', 2, 'Aggregate Type', NULL, 'lov', NULL, NULL, NULL, NULL, 'SUMMARY_AGGREGATE_TYPE');
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.billitem', 'treasury.actions.SummarizeBillItem', 'billitem', 1, 'BillItem', NULL, 'var', NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.fields', 'treasury.actions.SummarizeBillItem', 'fields', 2, 'Group Fields', 'string', 'string', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.SummarizeBillItem.remarks', 'treasury.actions.SummarizeBillItem', 'remarks', 3, 'Remarks', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.fieldname', 'treasury.actions.UpdateFieldValue', 'fieldname', 2, 'Field name', NULL, 'fieldlist', NULL, 'object', NULL, NULL, NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.object', 'treasury.actions.UpdateFieldValue', 'object', 1, 'Object', NULL, 'var', NULL, NULL, NULL, 'obj', NULL);
INSERT INTO `sys_rule_actiondef_param` VALUES ('treasury.actions.UpdateFieldValue.value', 'treasury.actions.UpdateFieldValue', 'value', 3, 'Value', NULL, 'expression', NULL, NULL, NULL, NULL, NULL);
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
INSERT INTO `sys_rule_condition` VALUES ('RC437a7884:16f0efafa31:-7ffb', 'RUL-63d80782:16f0ef8d63b:-7da6', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC437a7884:16f0efafa31:-7ffd', 'RUL-63d80782:16f0ef8d63b:-7da6', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC716ac8c6:16f0db01197:-7fa0', 'RUL351e5058:16f0df7bfd7:-73ce', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC716ac8c6:16f0db01197:-7fa3', 'RUL351e5058:16f0df7bfd7:-73ce', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC716ac8c6:16f0db01197:-7faa', 'RUL351e5058:16f0df7bfd7:-74c0', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RC716ac8c6:16f0db01197:-7fac', 'RUL351e5058:16f0df7bfd7:-74c0', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND-79820a3e:16f0c625123:-64d9', 'RUL-79820a3e:16f0c625123:-6529', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND17933c33:16f0d58ef1c:-707a', 'RUL17933c33:16f0d58ef1c:-710c', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND17933c33:16f0d58ef1c:-769b', 'RUL17933c33:16f0d58ef1c:-78e5', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND17933c33:16f0d58ef1c:-7853', 'RUL17933c33:16f0d58ef1c:-78e5', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND25a92016:16f12b9d331:-6af4', 'RUL25a92016:16f12b9d331:-6cd9', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND25a92016:16f12b9d331:-6c47', 'RUL25a92016:16f12b9d331:-6cd9', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND25a92016:16f12b9d331:-744e', 'RUL25a92016:16f12b9d331:-7494', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND351e5058:16f0df7bfd7:-7616', 'RUL351e5058:16f0df7bfd7:-7864', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND351e5058:16f0df7bfd7:-77d2', 'RUL351e5058:16f0df7bfd7:-7864', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND3cf2bbd6:16ef4232a61:-7cd0', 'RUL3cf2bbd6:16ef4232a61:-7d8e', 'treasury.facts.Payment', 'treasury.facts.Payment', 'PMT', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND4adb13dd:16c88dfc11c:-7ac9', 'RUL4adb13dd:16c88dfc11c:-7b80', 'treasury.facts.BillItem', 'treasury.facts.BillItem', 'BILLITEM', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND4e9b2048:16f0da608f1:-7382', 'RUL9c39035:16f0d95ddf6:-7cf8', 'com.rameses.rules.common.CurrentDate', 'com.rameses.rules.common.CurrentDate', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND4e9b2048:16f0da608f1:-7b2b', 'RUL9c39035:16f0d95ddf6:-7cf8', 'vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'VAPP', 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition` VALUES ('RCOND4e9b2048:16f0da608f1:-7cab', 'RUL9c39035:16f0d95ddf6:-7cf8', 'vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0);
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
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-1c7c09d1:164ee5525b1:-7fd4', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"pedicab\",value:\"pedicab\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC437a7884:16f0efafa31:-7ff9', 'RC437a7884:16f0efafa31:-7ffb', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcad\",value:\"motorcad\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC437a7884:16f0efafa31:-7ffa', 'RC437a7884:16f0efafa31:-7ffb', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"DROP\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC437a7884:16f0efafa31:-7ffc', 'RC437a7884:16f0efafa31:-7ffd', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7f9f', 'RC716ac8c6:16f0db01197:-7fa0', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7fa1', 'RC716ac8c6:16f0db01197:-7fa3', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"CHANGE_OWNER_UNIT\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7fa2', 'RC716ac8c6:16f0db01197:-7fa3', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcad\",value:\"motorcad\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7fa8', 'RC716ac8c6:16f0db01197:-7faa', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcad\",value:\"motorcad\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7fa9', 'RC716ac8c6:16f0db01197:-7faa', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"CHANGE_OWNER\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC716ac8c6:16f0db01197:-7fab', 'RC716ac8c6:16f0db01197:-7fac', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-79820a3e:16f0c625123:-6436', 'RCOND-79820a3e:16f0c625123:-64d9', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST-79820a3e:16f0c625123:-64af', 'RCOND-79820a3e:16f0c625123:-64d9', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcad\",value:\"motorcad\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-6f99', 'RCOND17933c33:16f0d58ef1c:-707a', 'vehicle.facts.VehicleApplication.appyear', 'appyear', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-6ff9', 'RCOND17933c33:16f0d58ef1c:-707a', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"NEW\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-7050', 'RCOND17933c33:16f0d58ef1c:-707a', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcad\",value:\"motorcad\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-768b', 'RCOND17933c33:16f0d58ef1c:-769b', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-77d2', 'RCOND17933c33:16f0d58ef1c:-7853', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"NEW\",\"RENEW\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST17933c33:16f0d58ef1c:-7829', 'RCOND17933c33:16f0d58ef1c:-7853', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcad\",value:\"motorcad\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST23693274:16f0cc4aae6:-7da1', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'vehicle.facts.VehicleApplication.appdate', 'appdate', 'APPDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST25a92016:16f12b9d331:-6ae4', 'RCOND25a92016:16f12b9d331:-6af4', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST25a92016:16f12b9d331:-6bc2', 'RCOND25a92016:16f12b9d331:-6c47', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"NEW\",\"RENEW\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST25a92016:16f12b9d331:-6c1d', 'RCOND25a92016:16f12b9d331:-6c47', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorboat\",value:\"motorboat\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST25a92016:16f12b9d331:-73cb', 'RCOND25a92016:16f12b9d331:-744e', 'vehicle.facts.VehicleApplication.appdate', 'appdate', 'APPDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST25a92016:16f12b9d331:-7424', 'RCOND25a92016:16f12b9d331:-744e', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorboat\",value:\"motorboat\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST351e5058:16f0df7bfd7:-7606', 'RCOND351e5058:16f0df7bfd7:-7616', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST351e5058:16f0df7bfd7:-7714', 'RCOND351e5058:16f0df7bfd7:-77d2', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"CHANGE_UNIT\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST351e5058:16f0df7bfd7:-7798', 'RCOND351e5058:16f0df7bfd7:-77d2', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"motorcad\",value:\"motorcad\"],[key:\"tricycle\",value:\"tricycle\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST3cf2bbd6:16ef4232a61:-7cc0', 'RCOND3cf2bbd6:16ef4232a61:-7cd0', 'treasury.facts.Payment.amount', 'amount', 'AMT', 'greater than', '>', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST4adb13dd:16c88dfc11c:-7734', 'RCOND4adb13dd:16c88dfc11c:-7ac9', 'treasury.facts.BillItem.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST4e9b2048:16f0da608f1:-7346', 'RCOND4e9b2048:16f0da608f1:-7382', 'com.rameses.rules.common.CurrentDate.date', 'date', 'CDATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST4e9b2048:16f0da608f1:-7aaa', 'RCOND4e9b2048:16f0da608f1:-7b2b', 'vehicle.facts.VehicleApplication.apptype', 'apptype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[\"RENEW\"]', NULL, 1);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST4e9b2048:16f0da608f1:-7b01', 'RCOND4e9b2048:16f0da608f1:-7b2b', 'vehicle.facts.VehicleApplication.vehicletype', 'vehicletype', NULL, 'is any of the ff.', 'matches', NULL, NULL, NULL, NULL, NULL, NULL, '[[key:\"tricycle\",value:\"tricycle\"],[key:\"motorcad\",value:\"motorcad\"]]', NULL, 0);
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCONST4e9b2048:16f0da608f1:-7c9b', 'RCOND4e9b2048:16f0da608f1:-7cab', 'vehicle.facts.VehicleAssessYear.year', 'year', 'YR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
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
INSERT INTO `sys_rule_condition_var` VALUES ('RC437a7884:16f0efafa31:-7ffb', 'RC437a7884:16f0efafa31:-7ffb', 'RUL-63d80782:16f0ef8d63b:-7da6', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC716ac8c6:16f0db01197:-7fa3', 'RC716ac8c6:16f0db01197:-7fa3', 'RUL351e5058:16f0df7bfd7:-73ce', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RC716ac8c6:16f0db01197:-7faa', 'RC716ac8c6:16f0db01197:-7faa', 'RUL351e5058:16f0df7bfd7:-74c0', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC437a7884:16f0efafa31:-7ffc', 'RC437a7884:16f0efafa31:-7ffd', 'RUL-63d80782:16f0ef8d63b:-7da6', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC716ac8c6:16f0db01197:-7f9f', 'RC716ac8c6:16f0db01197:-7fa0', 'RUL351e5058:16f0df7bfd7:-73ce', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCC716ac8c6:16f0db01197:-7fab', 'RC716ac8c6:16f0db01197:-7fac', 'RUL351e5058:16f0df7bfd7:-74c0', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND-79820a3e:16f0c625123:-64d9', 'RCOND-79820a3e:16f0c625123:-64d9', 'RUL-79820a3e:16f0c625123:-6529', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND17933c33:16f0d58ef1c:-707a', 'RCOND17933c33:16f0d58ef1c:-707a', 'RUL17933c33:16f0d58ef1c:-710c', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND17933c33:16f0d58ef1c:-7853', 'RCOND17933c33:16f0d58ef1c:-7853', 'RUL17933c33:16f0d58ef1c:-78e5', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND25a92016:16f12b9d331:-6c47', 'RCOND25a92016:16f12b9d331:-6c47', 'RUL25a92016:16f12b9d331:-6cd9', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND25a92016:16f12b9d331:-744e', 'RCOND25a92016:16f12b9d331:-744e', 'RUL25a92016:16f12b9d331:-7494', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND351e5058:16f0df7bfd7:-77d2', 'RCOND351e5058:16f0df7bfd7:-77d2', 'RUL351e5058:16f0df7bfd7:-7864', 'VAPP', 'vehicle.facts.VehicleApplication', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND3cf2bbd6:16ef4232a61:-7cd0', 'RCOND3cf2bbd6:16ef4232a61:-7cd0', 'RUL3cf2bbd6:16ef4232a61:-7d8e', 'PMT', 'treasury.facts.Payment', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND4adb13dd:16c88dfc11c:-7ac9', 'RCOND4adb13dd:16c88dfc11c:-7ac9', 'RUL4adb13dd:16c88dfc11c:-7b80', 'BILLITEM', 'treasury.facts.BillItem', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCOND4e9b2048:16f0da608f1:-7b2b', 'RCOND4e9b2048:16f0da608f1:-7b2b', 'RUL9c39035:16f0d95ddf6:-7cf8', 'VAPP', 'vehicle.facts.VehicleApplication', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST-79820a3e:16f0c625123:-6436', 'RCOND-79820a3e:16f0c625123:-64d9', 'RUL-79820a3e:16f0c625123:-6529', 'YR', 'integer', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST17933c33:16f0d58ef1c:-6f99', 'RCOND17933c33:16f0d58ef1c:-707a', 'RUL17933c33:16f0d58ef1c:-710c', 'YR', 'integer', 2);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST17933c33:16f0d58ef1c:-768b', 'RCOND17933c33:16f0d58ef1c:-769b', 'RUL17933c33:16f0d58ef1c:-78e5', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST23693274:16f0cc4aae6:-7da1', 'RC-1c7c09d1:164ee5525b1:-7fd5', 'RUL-57c2d992:164ee592b63:-7e1f', 'APPDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST25a92016:16f12b9d331:-6ae4', 'RCOND25a92016:16f12b9d331:-6af4', 'RUL25a92016:16f12b9d331:-6cd9', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST25a92016:16f12b9d331:-73cb', 'RCOND25a92016:16f12b9d331:-744e', 'RUL25a92016:16f12b9d331:-7494', 'APPDATE', 'date', 1);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST351e5058:16f0df7bfd7:-7606', 'RCOND351e5058:16f0df7bfd7:-7616', 'RUL351e5058:16f0df7bfd7:-7864', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST3cf2bbd6:16ef4232a61:-7cc0', 'RCOND3cf2bbd6:16ef4232a61:-7cd0', 'RUL3cf2bbd6:16ef4232a61:-7d8e', 'AMT', 'decimal', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST4adb13dd:16c88dfc11c:-7734', 'RCOND4adb13dd:16c88dfc11c:-7ac9', 'RUL4adb13dd:16c88dfc11c:-7b80', 'YR', 'integer', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST4e9b2048:16f0da608f1:-7346', 'RCOND4e9b2048:16f0da608f1:-7382', 'RUL9c39035:16f0d95ddf6:-7cf8', 'CDATE', 'date', 0);
INSERT INTO `sys_rule_condition_var` VALUES ('RCONST4e9b2048:16f0da608f1:-7c9b', 'RCOND4e9b2048:16f0da608f1:-7cab', 'RUL9c39035:16f0d95ddf6:-7cf8', 'YR', 'integer', 0);
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
INSERT INTO `sys_rule_deployed` VALUES ('RUL-57c2d992:164ee592b63:-7e1f', '\npackage vehicledates.MOTORCYCLE_RENEWAL_DATE;\nimport vehicledates.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORCYCLE_RENEWAL_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"pedicab|tricycle\",APPDATE:appdate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"APPDATE\", APPDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"tag\", \"expirydate\" );\n_p0.put( \"date\", (new ActionExpression(\"int yr = @YEAR( APPDATE  ); int mon = @MONTH( APPDATE  ); int day = @DAY( APPDATE  ); if( mon < 10 ) {      return @DATE( yr , 10,  31 );     }; else {      return @DATE( yr + 1, 10, 31 ); };\", bindings)) );\naction.execute( \"add-vardate\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL-63d80782:16f0ef8d63b:-7da6', '\npackage vehicleassessment.DROP_UNIT;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"DROP_UNIT\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcad|tricycle\",apptype matches \"DROP\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"1000\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"CHANGE_OWNERSHIP\", \"CHANGE OF OWNERSHIP\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL17933c33:16f0d58ef1c:-710c', '\npackage vehicleassessment.MTOP_NEW_FEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MTOP_NEW_FEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcad\",apptype matches \"NEW\",YR:appyear ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"SIDECAR_PLATENO\", \"PLATENO FOR SIDECAR\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL17933c33:16f0d58ef1c:-78e5', '\npackage vehicleassessment.MTOP_NEW_AND_RENEW_FEES;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MTOP_NEW_AND_RENEW_FEES\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcad\",apptype matches \"NEW|RENEW\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"STICKER\", \"STICKER\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\nMap _p1 = new HashMap();\n_p1.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p1.put( \"billcode\", new KeyValue(\"DRIVERS_AFFIDAVIT\", \"DRIVERS AFFIDAVIT\") );\n_p1.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p1,drools);\nMap _p2 = new HashMap();\n_p2.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p2.put( \"billcode\", new KeyValue(\"TARIFF_FEE\", \"TARIFF FEE\") );\n_p2.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p2,drools);\nMap _p3 = new HashMap();\n_p3.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p3.put( \"billcode\", new KeyValue(\"ANNUAL_BUSINESS_PERMIT\", \"ANNUAL BUSINESS PERMIT\") );\n_p3.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p3,drools);\nMap _p4 = new HashMap();\n_p4.put( \"amount\", (new ActionExpression(\"1000\", bindings)) );\n_p4.put( \"billcode\", new KeyValue(\"FRANCHISE_FEE\", \"FRANCHISE FEE\") );\n_p4.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p4,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL25a92016:16f12b9d331:-6cd9', '\npackage vehicleassessment.MOTORBOAT_FEE;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORBOAT_FEE\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorboat\",apptype matches \"NEW|RENEW\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"100\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"MOTORBOAT_FEE\", \"MOTOR BOAT\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL25a92016:16f12b9d331:-7494', '\npackage vehicledates.MOTORBOAT_EXPIRY_DATE;\nimport vehicledates.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MOTORBOAT_EXPIRY_DATE\"\n	agenda-group \"initial\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorboat\",APPDATE:appdate ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"APPDATE\", APPDATE );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"tag\", \"expirydate\" );\n_p0.put( \"date\", (new ActionExpression(\"int yr = @YEAR(   APPDATE ); int mon = @MONTH( APPDATE  );  if( mon < 3 ) {      return @DATE( yr-1, 3, 31 ); }; else {      return @DATE( yr , 3, 31);  }; \", bindings)) );\naction.execute( \"add-vardate\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL351e5058:16f0df7bfd7:-73ce', '\npackage vehicleassessment.CHANGE_OWNER_UNIT;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"CHANGE_OWNER_UNIT\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcad|tricycle\",apptype matches \"CHANGE_OWNER_UNIT\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"1000\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"CHANGE_OWNERSHIP\", \"CHANGE OF OWNERSHIP\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL351e5058:16f0df7bfd7:-74c0', '\npackage vehicleassessment.CHANGE_OWNER;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"CHANGE_OWNER\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcad|tricycle\",apptype matches \"CHANGE_OWNER\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"500\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"CHANGE_OWNERSHIP\", \"CHANGE OF OWNERSHIP\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL351e5058:16f0df7bfd7:-7864', '\npackage vehicleassessment.CHANGE_UNIT;\nimport vehicleassessment.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"CHANGE_UNIT\"\n	agenda-group \"compute-fee\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"motorcad|tricycle\",apptype matches \"CHANGE_UNIT\" ) \n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n		bindings.put(\"YR\", YR );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"500\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"CHANGE_MOTOR_VEHICLE\", \"CHANGE OF MOTOR VEHICLE\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
INSERT INTO `sys_rule_deployed` VALUES ('RUL9c39035:16f0d95ddf6:-7cf8', '\npackage vehiclebilling.MTOP_SURCHARGE_PER_YEAR;\nimport vehiclebilling.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"MTOP_SURCHARGE_PER_YEAR\"\n	agenda-group \"surcharge\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		 vehicle.facts.VehicleAssessYear (  YR:year ) \n		\n		VAPP: vehicle.facts.VehicleApplication (  vehicletype matches \"tricycle|motorcad\",apptype matches \"RENEW\" ) \n		\n		 com.rameses.rules.common.CurrentDate (  CDATE:date ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"CDATE\", CDATE );\n		\n		bindings.put(\"YR\", YR );\n		\n		bindings.put(\"VAPP\", VAPP );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"amount\", (new ActionExpression(\"@MONTHDIFF(  @DATE( YR-1 , 11 , 1 ),  CDATE, 1 )  * 300\", bindings)) );\n_p0.put( \"billcode\", new KeyValue(\"VEHICLE_PENALTY\", \"PENALTY\") );\n_p0.put( \"year\", (new ActionExpression(\"YR\", bindings)) );\naction.execute( \"add-billitem\",_p0,drools);\n\nend\n\n\n	');
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
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.Requirement', 'enterprise.facts.Requirement', 'Requirement', 'enterprise.facts.Requirement', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.StringArrayInfo', 'enterprise.facts.StringArrayInfo', 'String Array Info', 'enterprise.facts.StringArrayInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('enterprise.facts.StringInfo', 'enterprise.facts.StringInfo', 'String Info', 'enterprise.facts.StringInfo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.AppDate', 'treasury.facts.AppDate', 'Application Date', 'treasury.facts.AppDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Attribute', 'treasury.facts.Attribute', 'Attribute', 'treasury.facts.Attribute', 1, NULL, 'ATT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillDate', 'treasury.facts.BillDate', 'Bill Date', 'treasury.facts.BillDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.BillItem', 'treasury.facts.BillItem', 'Bill Item', 'treasury.facts.BillItem', 1, NULL, 'BILLITEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.DecimalInfo', 'treasury.facts.DecimalInfo', 'Decimal Info', 'treasury.facts.DecimalInfo', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ENTERPRISE', 'enterprise.facts.VariableInfo');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.DueDate', 'treasury.facts.DueDate', 'Due Date', 'treasury.facts.DueDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.ExcessPayment', 'treasury.facts.ExcessPayment', 'Excess Payment', 'treasury.facts.ExcessPayment', 5, NULL, 'EXPMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.HolidayFact', 'treasury.facts.HolidayFact', 'Holidays', 'treasury.facts.HolidayFact', 1, NULL, 'HOLIDAYS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.InterestItem', 'treasury.facts.InterestItem', 'Interest Item', 'treasury.facts.InterestItem', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.Payment', 'treasury.facts.Payment', 'Payment', 'treasury.facts.Payment', 5, NULL, 'PMT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.SurchargeItem', 'treasury.facts.SurchargeItem', 'Surcharge Item', 'treasury.facts.SurchargeItem', 4, NULL, 'SUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', 'treasury.facts.AbstractBillItem');
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.SystemDate', 'treasury.facts.SystemDate', 'System Date', 'treasury.facts.SystemDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDate', 'treasury.facts.VarDate', 'Variable Date', 'treasury.facts.VarDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarDecimal', 'treasury.facts.VarDecimal', 'Var Decimal', 'treasury.facts.VarDecimal', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarInteger', 'treasury.facts.VarInteger', 'Var Integer', 'treasury.facts.VarInteger', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('treasury.facts.VarString', 'treasury.facts.VarString', 'Var String', 'treasury.facts.VarString', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);
INSERT INTO `sys_rule_fact` VALUES ('vehicle.facts.VehicleApplication', 'vehicle.facts.VehicleApplication', 'Vehicle Application', 'vehicle.facts.VehicleApplication', 1, NULL, 'VAPP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE', NULL);
INSERT INTO `sys_rule_fact` VALUES ('vehicle.facts.VehicleAssessYear', 'vehicle.facts.VehicleAssessYear', 'Vehicle Assess Year', 'vehicle.facts.VehicleAssessYear', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VEHICLE', NULL);
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
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DecimalInfo.name', 'treasury.facts.DecimalInfo', 'name', 'Name', 'string', 1, 'lookup', 'variableinfo_decimal:lookup', 'name', 'name', NULL, NULL, 1, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DecimalInfo.value', 'treasury.facts.DecimalInfo', 'value', 'Value', 'decimal', 2, 'decimal', NULL, NULL, NULL, NULL, NULL, 1, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.date', 'treasury.facts.DueDate', 'date', 'Date', 'date', 1, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.day', 'treasury.facts.DueDate', 'day', 'Day', 'integer', 4, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.month', 'treasury.facts.DueDate', 'month', 'Month', 'integer', 3, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.qtr', 'treasury.facts.DueDate', 'qtr', 'Qtr', 'integer', 5, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.DueDate.year', 'treasury.facts.DueDate', 'year', 'Year', 'integer', 2, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.ExcessPayment.amount', 'treasury.facts.ExcessPayment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.HolidayFact.id', 'treasury.facts.HolidayFact', 'id', 'ID', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.amount', 'treasury.facts.InterestItem', 'amount', 'Amount', 'decimal', 2, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.billcode', 'treasury.facts.InterestItem', 'billcode', 'Item code', 'string', 3, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.InterestItem.parent', 'treasury.facts.InterestItem', 'parent', 'Parent BillItem', 'string', 1, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.Payment.amount', 'treasury.facts.Payment', 'amount', 'Amount', 'decimal', 1, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.amount', 'treasury.facts.SurchargeItem', 'amount', 'Amount', 'decimal', 2, 'decimal', NULL, NULL, NULL, NULL, NULL, NULL, 'decimal', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.billcode', 'treasury.facts.SurchargeItem', 'billcode', 'Item code', 'string', 3, 'lookup', 'vehicle_itemaccount:lookup', 'objid', 'title', NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('treasury.facts.SurchargeItem.parent', 'treasury.facts.SurchargeItem', 'parent', 'Parent Bill Item', 'string', 1, 'var', NULL, NULL, NULL, NULL, NULL, NULL, 'treasury.facts.AbstractBillItem', NULL);
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
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.lastfranchisedatepaid', 'vehicle.facts.VehicleApplication', 'lastfranchisedatepaid', 'Last Franchise Date Paid', 'date', 5, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleApplication.vehicletype', 'vehicle.facts.VehicleApplication', 'vehicletype', 'Vehicle Type', 'string', 2, 'lookup', 'vehicletype:lookup', 'objid', 'objid', NULL, NULL, NULL, 'string', 'VEHICLE_TXNTYPE');
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleAssessYear.year', 'vehicle.facts.VehicleAssessYear', 'year', 'Year', 'integer', 1, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, 'integer', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleFranchise.controlno', 'vehicle.facts.VehicleFranchise', 'controlno', 'Control No', 'string', 1, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleFranchise.startdate', 'vehicle.facts.VehicleFranchise', 'startdate', 'Start Date', 'date', 2, 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.appid', 'vehicle.facts.VehicleUnit', 'appid', 'App ID', 'string', 11, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
INSERT INTO `sys_rule_fact_field` VALUES ('vehicle.facts.VehicleUnit.apptype', 'vehicle.facts.VehicleUnit', 'apptype', 'App Type', 'string', 12, 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);
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
INSERT INTO `sys_ruleset` VALUES ('vehicledates', 'Vehicle Dates', 'vehicledates', 'VEHICLE', 'RULE_AUTHOR', NULL);
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
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.AddInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.AskInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'enterprise.actions.AskInfo');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'enterprise.actions.ThrowException');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicleassessment', 'treasury.actions.AddBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddBillItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddDiscountItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddDueDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicledates', 'treasury.actions.AddDueDate');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehiclebilling', 'treasury.actions.AddSurchargeItem');
INSERT INTO `sys_ruleset_actiondef` VALUES ('vehicledates', 'treasury.actions.AddVarDate');
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
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'com.rameses.rules.common.CurrentDate');
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
INSERT INTO `sys_ruleset_fact` VALUES ('vehicleassessment', 'vehicle.facts.VehicleAssessYear');
INSERT INTO `sys_ruleset_fact` VALUES ('vehiclebilling', 'vehicle.facts.VehicleAssessYear');
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
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.ADMIN', 'VEHICLE ADMIN', 'VEHICLE', NULL, NULL, 'ADMIN');
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.INFO', 'VEHICLE INFO', 'VEHICLE', NULL, NULL, 'INFO');
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.MASTER', 'VEHICLE MASTER', 'VEHICLE', NULL, NULL, 'MASTER');
INSERT INTO `sys_usergroup` VALUES ('VEHICLE.RULE_AUTHOR', 'VEHICLE RULE_AUTHOR', 'VEHICLE', NULL, NULL, 'RULE_AUTHOR');
COMMIT;

-- ----------------------------
-- Table structure for sys_var
-- ----------------------------
DROP TABLE IF EXISTS `sys_var`;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_var
-- ----------------------------
BEGIN;
INSERT INTO `sys_var` VALUES ('early_renewal_allowed_days', '30', NULL, 'integer', NULL);
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
INSERT INTO `sys_wf_node` VALUES ('approval', 'vehicle_application', 'For Approval', 'state', 4, 0, 'VEHICLE', 'APPROVER', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[422,122],size:[100,50]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('assessment', 'vehicle_application', 'Assessment', 'state', 3, 0, 'VEHICLE', 'ASSESSOR', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[278,39],size:[96,56]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('billing', 'vehicle_application', 'Billing', 'state', 5, 0, 'VEHICLE', 'ASSESSOR', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[511,234],size:[103,55]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('decide-payment', 'vehicle_application', 'Payment Decision', 'decision', 7, 0, NULL, NULL, '[type:\"decision\",fillColor:\"#c0c0c0\",pos:[765,183],size:[90,65]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('draft', 'vehicle_application', 'Draft', 'state', 2, 0, 'VEHICLE', 'RECEIVER', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[135,79],size:[87,50]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('end', 'vehicle_application', 'End', 'end', 9, 0, 'VEHICLE', NULL, '[type:\"end\",fillColor:\"#ff0000\",pos:[1099,210],size:[32,32]]', '[:]', NULL);
INSERT INTO `sys_wf_node` VALUES ('payment', 'vehicle_application', 'For Payment', 'state', 6, 0, 'VEHICLE', 'ADMIN', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[594,146],size:[100,50]]', '[:]', 0);
INSERT INTO `sys_wf_node` VALUES ('release', 'vehicle_application', 'For Release', 'state', 8, 0, 'VEHICLE', 'RELEASER', '[type:\"state\",fillColor:\"#c0c0c0\",pos:[956,84],size:[100,50]]', '[:]', 1);
INSERT INTO `sys_wf_node` VALUES ('start', 'vehicle_application', 'Start', 'start', 1, 0, 'VEHICLE', NULL, '[type:\"start\",fillColor:\"#00ff00\",pos:[62,37],size:[32,32]]', '[:]', NULL);
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
INSERT INTO `sys_wf_transition` VALUES ('approval', 'vehicle_application', 'approve', 'billing', 0, NULL, '[showConfirm:true,confirmMessage:\"You are about to approve this application. Proceed?\"]', NULL, 'Approve', '[points:[495,172,536,234],type:\"arrow\",pos:[495,172],size:[41,62]]');
INSERT INTO `sys_wf_transition` VALUES ('approval', 'vehicle_application', 'approve-capture', 'release', 0, NULL, '[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]', NULL, 'Approve (Capture Paid)', '[points:[482,172,506,316,723,339,904,275,976,150,981,134],type:\"arrow\",pos:[482,134],size:[499,205]]');
INSERT INTO `sys_wf_transition` VALUES ('assessment', 'vehicle_application', 'submit', 'approval', 0, NULL, '[:]', NULL, 'Submit for Approval', '[points:[375,63,474,62,477,125],type:\"arrow\",pos:[375,62],size:[102,63]]');
INSERT INTO `sys_wf_transition` VALUES ('assessment', 'vehicle_application', 'revert', 'draft', 1, NULL, '[:]', NULL, 'Revert', '[points:[278,80,222,96],type:\"arrow\",pos:[222,80],size:[56,16]]');
INSERT INTO `sys_wf_transition` VALUES ('billing', 'vehicle_application', 'submit', 'payment', 0, NULL, '[:]', NULL, 'Submit for Payment', '[points:[593,234,602,196],type:\"arrow\",pos:[593,196],size:[9,38]]');
INSERT INTO `sys_wf_transition` VALUES ('decide-payment', 'vehicle_application', 'fail', 'payment', 0, 'amtdue != 0', '[:]', NULL, 'Payment Failed', '[points:[809,249,810,298,644,299,642,196],type:\"arrow\",pos:[642,196],size:[168,103]]');
INSERT INTO `sys_wf_transition` VALUES ('decide-payment', 'vehicle_application', 'success', 'release', 0, 'amtdue == 0', '[:]', NULL, 'Success Pay', '[points:[809,185,809,142,959,109],type:\"arrow\",pos:[809,109],size:[150,76]]');
INSERT INTO `sys_wf_transition` VALUES ('draft', 'vehicle_application', 'forapproval', 'approval', 5, NULL, '[visibleWhen:\"#{  entity.txnmode == \'CAPTURE\' }\"]', NULL, 'For Approval (Capture)', '[points:[189,129,223,203,349,234,436,172],type:\"arrow\",pos:[189,129],size:[247,105]]');
INSERT INTO `sys_wf_transition` VALUES ('draft', 'vehicle_application', 'submit', 'assessment', 0, NULL, '[:]', NULL, 'Submit for Assessment', '[points:[222,113,243,119,278,56],type:\"arrow\",pos:[222,56],size:[56,63]]');
INSERT INTO `sys_wf_transition` VALUES ('payment', 'vehicle_application', 'reverse-payment', 'approval', 10, NULL, '[:]', NULL, 'Reverse Payment', '[points:[627,146,629,95,533,72,518,122],type:\"arrow\",pos:[518,72],size:[111,74]]');
INSERT INTO `sys_wf_transition` VALUES ('payment', 'vehicle_application', 'post', 'decide-payment', 0, NULL, '[visible:false]', NULL, 'Post Payment', '[points:[694,184,727,185,729,218,769,219],type:\"arrow\",pos:[694,184],size:[75,35]]');
INSERT INTO `sys_wf_transition` VALUES ('release', 'vehicle_application', 'release', 'end', 0, NULL, '[:]', NULL, 'Release', '[points:[1025,134,1102,210],type:\"arrow\",pos:[1025,134],size:[77,76]]');
INSERT INTO `sys_wf_transition` VALUES ('release', 'vehicle_application', 'void-payment', 'payment', 0, NULL, '[visibleWhen:\"#{ false }\"]', NULL, 'Void Payment', '[points:[972,84,878,33,741,72,668,146],type:\"arrow\",pos:[668,33],size:[304,113]]');
INSERT INTO `sys_wf_transition` VALUES ('start', 'vehicle_application', 'start', 'draft', 0, 'txnmode != \'CAPTURE\'', '[:]', NULL, 'Submit', '[points:[94,57,135,91],type:\"arrow\",pos:[94,57],size:[41,34]]');
INSERT INTO `sys_wf_transition` VALUES ('start', 'vehicle_application', 'start-capture', 'release', 0, 'txnmode == \'CAPTURE\'', '[:]', NULL, 'Start Capture', '[points:[85,69,208,337,747,385,984,335,991,134],type:\"arrow\",pos:[85,69],size:[906,316]]');
COMMIT;

-- ----------------------------
-- Table structure for vehicle_account
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_account`;
CREATE TABLE `vehicle_account` (
  `objid` varchar(50) NOT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  `owner_objid` varchar(50) DEFAULT NULL,
  `owner_type` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_address_objid` varchar(50) DEFAULT NULL,
  `owner_address_text` varchar(255) DEFAULT NULL,
  `contact_phoneno` varchar(50) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_mobileno` varchar(50) DEFAULT NULL,
  `lastfranchisedatepaid` date DEFAULT NULL,
  `barangay_objid` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(255) DEFAULT NULL,
  `supersederid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_application
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application`;
CREATE TABLE `vehicle_application` (
  `objid` varchar(50) NOT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `appyear` int(255) DEFAULT NULL,
  `appdate` date DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `particulars` varchar(150) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_appno` (`appno`),
  KEY `ix_taskid` (`taskid`),
  KEY `ix_appdate` (`appdate`),
  KEY `ix_dtfiled` (`dtcreated`),
  KEY `ix_filedby_objid` (`createdby_objid`),
  KEY `ix_filedby_name` (`createdby_name`),
  KEY `fk_vehicle_application_geninfoid` (`unitid`),
  CONSTRAINT `fk_vehicle_application_task` FOREIGN KEY (`taskid`) REFERENCES `vehicle_application_task` (`taskid`),
  CONSTRAINT `fk_vehicle_application_unitid` FOREIGN KEY (`unitid`) REFERENCES `vehicle_unit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_application_fee
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_application_fee`;
CREATE TABLE `vehicle_application_fee` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `year` int(255) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `amtpaid` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_parentid_itemid` (`appid`,`year`,`itemid`) USING BTREE,
  KEY `ix_appid` (`appid`),
  KEY `ix_item_objid` (`itemid`),
  CONSTRAINT `fk_vehicle_assessment_item_itemid` FOREIGN KEY (`itemid`) REFERENCES `vehicle_itemaccount` (`objid`),
  CONSTRAINT `fk_vehicle_assessment_item_parentid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_appid` (`appid`) USING BTREE,
  KEY `ix_name` (`name`) USING BTREE,
  CONSTRAINT `fk_vehicle_application_info_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for vehicle_driver
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_driver`;
CREATE TABLE `vehicle_driver` (
  `objid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `controlno` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `vehicletypeid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `entity_objid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `entity_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `entity_address_objid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `entity_address_text` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `license_refno` varchar(50) DEFAULT NULL,
  `license_expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_vehicle_driver_controlno` (`controlno`),
  UNIQUE KEY `uix_vehicle_driver_entityid_vehicletypeid` (`entity_objid`,`vehicletypeid`),
  KEY `vehicle_driver_vehicletypeid` (`vehicletypeid`),
  CONSTRAINT `vehicle_driver_vehicletypeid` FOREIGN KEY (`vehicletypeid`) REFERENCES `vehicletype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vehicle_driver_franchise
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_driver_franchise`;
CREATE TABLE `vehicle_driver_franchise` (
  `objid` varchar(50) NOT NULL,
  `driverid` varchar(50) DEFAULT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_driverid_franchiseid` (`driverid`,`franchiseid`),
  KEY `fk_vehicle_driver_franchise_franchiseid` (`franchiseid`),
  CONSTRAINT `fk_vehicle_driver_franchise_driverid` FOREIGN KEY (`driverid`) REFERENCES `vehicle_driver` (`objid`),
  CONSTRAINT `fk_vehicle_driver_franchise_franchiseid` FOREIGN KEY (`franchiseid`) REFERENCES `vehicle_franchise` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_franchise
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_franchise`;
CREATE TABLE `vehicle_franchise` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `controlno` varchar(50) DEFAULT NULL,
  `vehicletypeid` varchar(50) DEFAULT NULL,
  `acctid` varchar(50) DEFAULT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `permitid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_controlno` (`controlno`),
  KEY `ix_vehicletype` (`vehicletypeid`),
  KEY `fk_vehicle_franchise_unitid` (`unitid`),
  KEY `fk_vehicle_franchise_appid` (`appid`),
  KEY `fk_vehicle_franchise_permitid` (`permitid`),
  CONSTRAINT `fk_vehicle_franchise_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`),
  CONSTRAINT `fk_vehicle_franchise_permitid` FOREIGN KEY (`permitid`) REFERENCES `vehicle_permit` (`objid`),
  CONSTRAINT `fk_vehicle_franchise_unitid` FOREIGN KEY (`unitid`) REFERENCES `vehicle_unit` (`objid`),
  CONSTRAINT `fk_vehicle_franchise_vehicletypeid` FOREIGN KEY (`vehicletypeid`) REFERENCES `vehicletype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_itemaccount
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_itemaccount`;
CREATE TABLE `vehicle_itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_fund_objid` varchar(50) DEFAULT NULL,
  `sortorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle_itemaccount
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_itemaccount` VALUES ('ANNUAL_BUSINESS_PERMIT', 'ANNUAL BUSINESS PERMIT', NULL, NULL, NULL, NULL, 1);
INSERT INTO `vehicle_itemaccount` VALUES ('CHANGE_MOTOR_VEHICLE', 'CHANGE OF MOTOR VEHICLE', NULL, NULL, NULL, NULL, 6);
INSERT INTO `vehicle_itemaccount` VALUES ('CHANGE_OWNERSHIP', 'CHANGE OF OWNERSHIP', NULL, NULL, NULL, NULL, 7);
INSERT INTO `vehicle_itemaccount` VALUES ('DRIVERS_AFFIDAVIT', 'DRIVERS AFFIDAVIT', NULL, NULL, NULL, NULL, 4);
INSERT INTO `vehicle_itemaccount` VALUES ('FRANCHISE_FEE', 'FRANCHISE FEE', NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_itemaccount` VALUES ('MOTORBOAT_FEE', 'MOTOR BOAT', NULL, NULL, NULL, NULL, 0);
INSERT INTO `vehicle_itemaccount` VALUES ('SIDECAR_PLATENO', 'PLATENO FOR SIDECAR', NULL, NULL, NULL, NULL, 2);
INSERT INTO `vehicle_itemaccount` VALUES ('STICKER', 'STICKER', NULL, NULL, NULL, NULL, 5);
INSERT INTO `vehicle_itemaccount` VALUES ('TARIFF_FEE', 'TARIFF FEE', NULL, NULL, NULL, NULL, 3);
INSERT INTO `vehicle_itemaccount` VALUES ('VEHICLE_PENALTY', 'PENALTY', NULL, NULL, NULL, NULL, 8);
COMMIT;

-- ----------------------------
-- Table structure for vehicle_payment
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_payment`;
CREATE TABLE `vehicle_payment` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
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
  KEY `ix_txndate` (`txndate`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  CONSTRAINT `fk_vehicle_payment_appid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_payment_item`;
CREATE TABLE `vehicle_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `surcharge` decimal(16,4) DEFAULT NULL,
  `interest` decimal(16,4) DEFAULT NULL,
  `discount` decimal(16,4) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `fk_vehicle_payment_item_refid` (`refid`),
  CONSTRAINT `fk_vehicle_payment_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `vehicle_payment` (`objid`),
  CONSTRAINT `fk_vehicle_payment_item_refid` FOREIGN KEY (`refid`) REFERENCES `vehicle_application_fee` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_permit
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_permit`;
CREATE TABLE `vehicle_permit` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `permitno` varchar(50) DEFAULT NULL,
  `permittype` varchar(50) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `issuedby_objid` varchar(50) DEFAULT NULL,
  `issuedby_name` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(355) DEFAULT NULL,
  `supersederid` varchar(50) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_permitno` (`permitno`),
  UNIQUE KEY `fk_vehicle_permit_unitid` (`appid`) USING BTREE,
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `fk_vehicle_permit_supersederid` (`supersederid`),
  CONSTRAINT `fk_vehicle_permit_supersederid` FOREIGN KEY (`supersederid`) REFERENCES `vehicle_permit` (`objid`),
  CONSTRAINT `fk_vehicle_permit_unitid` FOREIGN KEY (`appid`) REFERENCES `vehicle_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_unit
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_unit`;
CREATE TABLE `vehicle_unit` (
  `objid` varchar(50) NOT NULL,
  `franchiseid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vehicle_unit_info
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_unit_info`;
CREATE TABLE `vehicle_unit_info` (
  `objid` varchar(50) NOT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `fieldid` varchar(50) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `decimalvalue` decimal(18,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `datevalue` date DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `ix_appid` (`unitid`) USING BTREE,
  KEY `ix_name` (`fieldid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `vehicle_variable` VALUES ('IS_ADDITIONAL', 'DRAFT', 'IS_ADDITIONAL', 'IS ADDITIONAL', NULL, 'boolean', NULL, 0, 0, '[]');
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
  `icon` blob,
  `permitnopattern` varchar(50) DEFAULT NULL,
  `renewalfrequency` varchar(10) DEFAULT NULL,
  `permithandler` varchar(100) DEFAULT NULL,
  `drivernopattern` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicletype
-- ----------------------------
BEGIN;
INSERT INTO `vehicletype` VALUES ('tricycle', 'TRICYCLE (MTOP)', 'TRI-[yyyy]-[%06d]', NULL, 'ATRI-[yyyy][MM]-[%04d]', NULL, 'TRIP-[org]-[yyyy]-[%04d]', 'YEAR', '', 'TRIP-[org]-[yyyy]-[%04d]');
COMMIT;

-- ----------------------------
-- Table structure for vehicletype_field
-- ----------------------------
DROP TABLE IF EXISTS `vehicletype_field`;
CREATE TABLE `vehicletype_field` (
  `objid` varchar(50) NOT NULL,
  `vehicletypeid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `required` smallint(255) DEFAULT NULL,
  `textwidth` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_vehicletype_name` (`name`,`vehicletypeid`) USING BTREE,
  KEY `fk_vehicletype_field_vehicletypeid` (`vehicletypeid`),
  CONSTRAINT `fk_vehicletype_field_vehicletypeid` FOREIGN KEY (`vehicletypeid`) REFERENCES `vehicletype` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicletype_field
-- ----------------------------
BEGIN;
INSERT INTO `vehicletype_field` VALUES ('tricycle-bodyno', 'tricycle', 'bodyno', 'Body No', 'text', NULL, 3, 1, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-chassisno', 'tricycle', 'chassisno', 'Chassis No', 'text', NULL, 10, NULL, 0);
INSERT INTO `vehicletype_field` VALUES ('tricycle-color', 'tricycle', 'color', 'Color', 'text', NULL, 6, 1, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-crname', 'tricycle', 'crname', 'CR Name', 'text', NULL, 7, NULL, 250);
INSERT INTO `vehicletype_field` VALUES ('tricycle-engineno', 'tricycle', 'engineno', 'Engine No', 'text', NULL, 2, 1, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-insurername', 'tricycle', 'insurername', 'Insurer Name', 'text', NULL, 8, NULL, 250);
INSERT INTO `vehicletype_field` VALUES ('tricycle-plateno', 'tricycle', 'plateno', 'Plate No', 'text', NULL, 1, 1, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-sidecarcolor', 'tricycle', 'sidecarcolor', 'Sidecar Color', 'text', NULL, 4, NULL, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-sidecarno', 'tricycle', 'sidecarno', 'Sidecar No', 'text', NULL, 5, NULL, NULL);
INSERT INTO `vehicletype_field` VALUES ('tricycle-toda', 'tricycle', 'toda', 'TODA No', 'text', NULL, 9, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
