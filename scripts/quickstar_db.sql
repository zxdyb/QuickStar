CREATE DATABASE IF NOT EXISTS QuickStarDB DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use QuickStarDB;

DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` ( #系统用户信息
  `id` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userpassword` varchar(100) DEFAULT '',
  `typeinfo` int(11) NOT NULL DEFAULT '0',
  `aliasname` varchar(128), #用户别名
  `email` varchar(128) NOT NULL, #用户邮箱
  `apptype` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  `extend` varchar(4000) DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX index_ref1(userid),
  INDEX index_ref2(username, createdate),
  INDEX index_ref3(status),
  INDEX index_ref4(createdate)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


######################################################################
DROP TABLE IF EXISTS `t_customer_type`;
CREATE TABLE `t_customer_type` ( #客户类型
  `id` varchar(36) NOT NULL,
  `ctid` varchar(36) NOT NULL, #客户类型ID
  `name` varchar(100) NOT NULL, #客户类型名称
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  `extend` varchar(4000) DEFAULT ''
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_customer_info`;
CREATE TABLE `t_customer_info` ( #客户信息
  `id` varchar(36) NOT NULL,
  `cid` varchar(36) NOT NULL, #客户ID
  `name` varchar(100) NOT NULL,
  `sex` int(2) DEFAULT '0', #0女，1男
  `aliasname` varchar(100) DEFAULT '',
  `address` varchar(200) DEFAULT '',
  `phone` varchar(100) DEFAULT '',
  `qq` varchar(100) DEFAULT '',
  `webchat` varchar(100) DEFAULT '',
  `taobao` varchar(100) DEFAULT '',
  `zhifubao` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `receive_address` varchar(100) DEFAULT '',
  `bank` varchar(100) DEFAULT '', #开户行
  `account_bank` varchar(100) DEFAULT '', #账号
  `duty_number` varchar(100) DEFAULT '', #税号
  `fax_number` varchar(100) DEFAULT '', #传真号
  `customer_typeid` varchar(100) NOT NULL, #客户类型ID
  `createdate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  `extend` varchar(4000) DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX index_ref1(name),
  INDEX index_ref2(name, createdate)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


######################################################################
#商品类型===》商品
#       |===》供应商
######################################################################
DROP TABLE IF EXISTS `t_commodity_measurement_unit`;
CREATE TABLE `t_commodity_measurement_unit` ( #商品计量单位
  `id` varchar(36) NOT NULL,
  `muid` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_commodity_type`;
CREATE TABLE `t_commodity_type` ( #商品类型
  `id` varchar(36) NOT NULL,
  `ctid` varchar(36) NOT NULL,
  `parent_tid` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_commodity_supplier`;
CREATE TABLE `t_commodity_supplier` ( #商品供应商信息
  `id` varchar(36) NOT NULL,
  `csid` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `aliasname` varchar(100) DEFAULT '',
  `code` varchar(100) NOT NULL, #编码（条形码）
  `address` varchar(200) DEFAULT '',
  `contacts` varchar(100) DEFAULT '', #联系人
  `phone` varchar(100) DEFAULT '',
  `qq` varchar(100) DEFAULT '',
  `webchat` varchar(100) DEFAULT '',
  `taobao` varchar(100) DEFAULT '',
  `zhifubao` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `receive_address` varchar(100) DEFAULT '',
  `bank` varchar(100) DEFAULT '', #开户行
  `account_bank` varchar(100) DEFAULT '', #账号
  `duty_number` varchar(100) DEFAULT '', #税号
  `fax_number` varchar(100) DEFAULT '', #传真号
  `commodity_typeid` varchar(36) NOT NULL, #商品类型ID
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_commodity_price_rate`;
CREATE TABLE `t_commodity_price_rate` ( #商品价格倍率
  `id` varchar(36) NOT NULL,
  `cprid` varchar(36) NOT NULL,
  `name` varchar(200) NOT NULL,
  `rate` varchar(200) NOT NULL, #倍率
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_commodity_info`;
CREATE TABLE `t_commodity_info` ( #商品信息
  `id` varchar(36) NOT NULL,
  `cinfoid` varchar(36) NOT NULL, #商品ID
  `name` varchar(100) NOT NULL, #商品名称
  `code` varchar(100) NOT NULL, #商品编码（条形码）
  `aliasname` varchar(100) DEFAULT '',
  `commodity_typeid` varchar(100) DEFAULT '', #商品类型ID
  `specification_model` varchar(200) DEFAULT '', #规格型号
  `measurement_unit_id` varchar(100) DEFAULT '', #计量单位ID
  `supplier_id` varchar(100) DEFAULT '', #供应商ID
  `price_for_sale` varchar(100) DEFAULT '', #销售价格
  `price_for_buy` varchar(100) DEFAULT '', #采购价格
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  `extend` varchar(4000) DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX index_ref1(name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

######################################################################
#仓库===》商品1
#   |===》商品2
######################################################################
DROP TABLE IF EXISTS `t_commodity_warehouse`;
CREATE TABLE `t_commodity_warehouse` ( #商品仓库
  `id` varchar(36) NOT NULL,
  `cwid` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_commodity_warehouse_list`;
CREATE TABLE `t_commodity_warehouse_list` ( #仓库商品列表
  `id` varchar(36) NOT NULL,
  `cwlid` varchar(36) NOT NULL, #商品仓库列表ID
  `cinfoid` varchar(36) NOT NULL, #商品ID
  `num` int(11) NOT NULL, #个数
  `price` varchar(100) NOT NULL, #库存单价
  `sum` varchar(100) NOT NULL, #金额
  `createdate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0', #0正常，1删除
  `extend` varchar(4000) DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX index_ref1(cinfoid)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

