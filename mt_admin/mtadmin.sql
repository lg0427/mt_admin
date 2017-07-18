-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 dmtadmin 的数据库结构
/*CREATE DATABASE IF NOT EXISTS `dmtadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
/*USE `dmtadmin`;*/


-- 导出  表 dmtadmin.dmt_auth_group 结构
CREATE TABLE IF NOT EXISTS `dmt_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_auth_group_access 结构
CREATE TABLE IF NOT EXISTS `dmt_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_auth_rule 结构
CREATE TABLE IF NOT EXISTS `dmt_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_buyeraddress 结构
CREATE TABLE IF NOT EXISTS `dmt_buyeraddress` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `receiver_name` varchar(50) NOT NULL COMMENT '收货人',
  `receiver_phonenum` varchar(32) NOT NULL COMMENT '手机号码',
  `receiver_address` varchar(255) NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017/2/10\n买家地址表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_category 结构
CREATE TABLE IF NOT EXISTS `dmt_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父类ID',
  `path` varchar(100) NOT NULL DEFAULT '0' COMMENT '分类路径',
  `imgpath` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `imgname` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `catename` varchar(255) NOT NULL COMMENT '分类名称',
  `des` varchar(255) NOT NULL COMMENT '分类描述',
  `status` enum('-1','1') NOT NULL DEFAULT '-1' COMMENT '分类状态',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `refreshtime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `prevcate` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_contacttype 结构
CREATE TABLE IF NOT EXISTS `dmt_contacttype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `callnum` varchar(255) DEFAULT NULL COMMENT '固定电话',
  `phonenum` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='create by chenpy 2016-12-8\n联系方法表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_flink 结构
CREATE TABLE IF NOT EXISTS `dmt_flink` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comname` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_goods 结构
CREATE TABLE IF NOT EXISTS `dmt_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `goodsimg` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goodscateid` int(11) NOT NULL COMMENT '商品分类ID',
  `goodscatename` varchar(50) NOT NULL COMMENT '分类名称',
  `goodsabstract` varchar(255) DEFAULT NULL COMMENT '商品简介',
  `goodscontent` text COMMENT '商品介绍',
  `goodsorig` float(10,2) unsigned DEFAULT '0.00' COMMENT '商品原价',
  `goodsprice` float(10,2) unsigned DEFAULT NULL COMMENT '商品价格',
  `goodsstatus` tinyint(2) NOT NULL DEFAULT '0' COMMENT '商品状态',
  `ismail` tinyint(1) NOT NULL COMMENT '是否包邮',
  `mailprice` float(6,2) DEFAULT '0.00' COMMENT '快递费用',
  `refreshtime` int(11) NOT NULL COMMENT '更新时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `res1` varchar(255) DEFAULT NULL COMMENT '备注',
  `res2` varchar(255) DEFAULT NULL COMMENT '备注2',
  `sendpoints` int(10) DEFAULT NULL COMMENT '赠送积分',
  `madein` varchar(100) DEFAULT NULL COMMENT '产地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017-2-7\n商品表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_goodscate 结构
CREATE TABLE IF NOT EXISTS `dmt_goodscate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) NOT NULL COMMENT '父类ID',
  `classify` varchar(50) NOT NULL COMMENT '分类名称',
  `cateimg` varchar(200) NOT NULL COMMENT '图片路径',
  `catedes` varchar(255) DEFAULT '' COMMENT '类简介',
  `catestatus` enum('1','-1') NOT NULL DEFAULT '-1' COMMENT '类状态',
  `cateaddtime` varchar(32) NOT NULL COMMENT '类添加时间',
  `res1` varchar(255) DEFAULT NULL COMMENT '备注',
  `res2` varchar(255) DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_grade 结构
CREATE TABLE IF NOT EXISTS `dmt_grade` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `grade` varchar(50) NOT NULL DEFAULT '0' COMMENT '等级名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='create by chenpy 2016-12-21\r\n等级表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_jobs 结构
CREATE TABLE IF NOT EXISTS `dmt_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `job` varchar(50) NOT NULL COMMENT '职位名称',
  `des` text NOT NULL COMMENT '内容',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `status` enum('-1','1') NOT NULL DEFAULT '-1' COMMENT '状态',
  `views` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by chenpy 2016-12-22\r\n招聘职位表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_log 结构
CREATE TABLE IF NOT EXISTS `dmt_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL COMMENT '登录内容',
  `ip` varchar(50) NOT NULL COMMENT 'ip地址',
  `logintime` int(10) NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_members 结构
CREATE TABLE IF NOT EXISTS `dmt_members` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ＩＤ',
  `wx_nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `wx_headimgurl` varchar(200) NOT NULL COMMENT '用户头像',
  `wx_city` varchar(50) NOT NULL COMMENT '用户所在城市',
  `wx_openid` varchar(50) NOT NULL COMMENT '用户OpenID',
  `subscribe_time` varchar(30) NOT NULL COMMENT '关注时间',
  `wx_sex` enum('1','2','0') NOT NULL,
  `members_status` int(5) DEFAULT NULL COMMENT '用户状态',
  `recent_time` varchar(30) NOT NULL COMMENT '用户最近访问时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `restore_time` int(11) DEFAULT NULL COMMENT '还原时间',
  `res1` varchar(100) DEFAULT NULL COMMENT '备注',
  `res2` varchar(100) DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='竹乡联萌会员表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_members_sex 结构
CREATE TABLE IF NOT EXISTS `dmt_members_sex` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sex_code` int(2) NOT NULL,
  `sex_name` varchar(32) NOT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017/2/16\n会员性别表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_members_status 结构
CREATE TABLE IF NOT EXISTS `dmt_members_status` (
  `auto_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(5) NOT NULL,
  `status_name` varchar(32) NOT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017/2/17';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_msg 结构
CREATE TABLE IF NOT EXISTS `dmt_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `require` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_news 结构
CREATE TABLE IF NOT EXISTS `dmt_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `author` varchar(20) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `abstract` text NOT NULL,
  `tags` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `previousstatus` tinyint(1) NOT NULL,
  `views` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  `refreshtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_newscontent 结构
CREATE TABLE IF NOT EXISTS `dmt_newscontent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `newsid` int(10) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `describe` text NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_orderinfo 结构
CREATE TABLE IF NOT EXISTS `dmt_orderinfo` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_numbers` varchar(50) NOT NULL COMMENT '订单号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_img` varchar(50) NOT NULL COMMENT '商品图片',
  `buy_count` int(5) unsigned NOT NULL COMMENT '购买数量',
  `goods_price` float(5,2) unsigned NOT NULL COMMENT '商品单价',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017/2/10';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_orders 结构
CREATE TABLE IF NOT EXISTS `dmt_orders` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_numbers` varchar(50) NOT NULL COMMENT '订单号',
  `goods_quantity` tinyint(5) NOT NULL COMMENT '商品数量',
  `order_createtime` varchar(32) NOT NULL COMMENT '订单创建时间',
  `order_status` int(5) NOT NULL COMMENT '订单状态码',
  `order_total` float(8,2) unsigned NOT NULL COMMENT '订单总额',
  `buyer_openid` varchar(100) NOT NULL COMMENT '买家OpenID\n',
  `address_id` int(11) NOT NULL COMMENT '地址ID',
  `order_paytime` int(11) NOT NULL COMMENT '买家付款时间',
  `buyer_msg` varchar(255) NOT NULL COMMENT '买家留言',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017-2-10';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_orderstatus 结构
CREATE TABLE IF NOT EXISTS `dmt_orderstatus` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `status_code` int(11) NOT NULL COMMENT '状态码',
  `status_name` varchar(50) NOT NULL COMMENT '状态名称',
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='create by cpy 2017-2-10\n订单状态表 ';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_picture 结构
CREATE TABLE IF NOT EXISTS `dmt_picture` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) NOT NULL,
  `picname` varchar(255) NOT NULL,
  `picpath` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `status` enum('-1','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_picturetype 结构
CREATE TABLE IF NOT EXISTS `dmt_picturetype` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_qqcontact 结构
CREATE TABLE IF NOT EXISTS `dmt_qqcontact` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `qqnum` varchar(50) NOT NULL DEFAULT '0' COMMENT 'QQ号',
  `qqtitle` varchar(80) NOT NULL DEFAULT '0' COMMENT 'QQ标题',
  `status` enum('-1','1') NOT NULL DEFAULT '-1' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='create by chenpy 2016-12-21\r\n资讯QQ 表';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_user 结构
CREATE TABLE IF NOT EXISTS `dmt_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `telephone` varchar(30) NOT NULL COMMENT '电话',
  `email` varchar(80) NOT NULL COMMENT 'email',
  `grade` tinyint(5) NOT NULL COMMENT '等级',
  `status` enum('-99','1') NOT NULL COMMENT '状态',
  `online` enum('-1','1') NOT NULL COMMENT '是否在线',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `des` varchar(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='create by chenpy 2016-12-20';

-- 数据导出被取消选择。


-- 导出  表 dmtadmin.dmt_webbase 结构
CREATE TABLE IF NOT EXISTS `dmt_webbase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `webtitle` varchar(255) DEFAULT NULL COMMENT '网站名称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `copyright` varchar(50) DEFAULT NULL COMMENT '版权信息',
  `icp` varchar(50) DEFAULT NULL COMMENT '备案号',
  `countcode` text COMMENT '统计代码',
  `contactemail` varchar(255) DEFAULT NULL COMMENT 'email',
  `contacthotline` varchar(255) DEFAULT NULL COMMENT '联系热线',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `hotline` varchar(45) DEFAULT NULL COMMENT '投诉热线',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='create by chenpy 2016-12-8\n网站基本信息表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
