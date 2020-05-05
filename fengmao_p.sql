/*
 Navicat Premium Data Transfer

 Source Server         : fengmao01
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 101.200.164.164:3306
 Source Schema         : fengmao_p

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 15/04/2020 10:06:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE fengmao01;

-- ----------------------------
-- Table structure for ims_discuss_price
-- ----------------------------
DROP TABLE IF EXISTS `ims_discuss_price`;
CREATE TABLE `ims_discuss_price`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组id',
  `seller_id` bigint(10) NOT NULL COMMENT '买家id',
  `buyer_id` bigint(10) NOT NULL COMMENT '卖家id',
  `product_id` bigint(10) NOT NULL COMMENT '商品id',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `buyer_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '买家提出的价格',
  `seller_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '卖家提出的价格',
  `buyer_status` int(1) NULL DEFAULT NULL COMMENT '买家状态 0-拒绝 1-接受',
  `seller_status` int(1) NULL DEFAULT NULL COMMENT '卖家状态 0-拒绝 1-接受',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oms_communicate_price
-- ----------------------------
DROP TABLE IF EXISTS `oms_communicate_price`;
CREATE TABLE `oms_communicate_price`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(10) NULL DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(10) NULL DEFAULT NULL COMMENT '用户id',
  `decide_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '决定价格',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_communicate_price
-- ----------------------------
INSERT INTO `oms_communicate_price` VALUES (1, 1, 6, 55, '2020-04-10 19:16:33', '2020-04-10 19:16:33');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(10) NULL DEFAULT NULL COMMENT '用户id',
  `coupon_id` int(5) NULL DEFAULT NULL COMMENT '优惠券id',
  `coupon_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `freight_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '运费金额',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品原价',
  `pay_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '支付金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式： 0-未支付 1-支付宝 2-微信',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '渠道 1-ios 2-android',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0-待付款 1-待发货 2-已发货 3-已完成 4-已关闭 5-无效订单',
  `delivery_company` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(5) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `receiver_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态 0-否 1-是',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `cancel_reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单取消原因',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝/微信 交易订单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (1, '20200413', 6, NULL, NULL, NULL, 888.00, 777, 1, 1, 0, NULL, NULL, NULL, '奥利给', '13888888888', '', '北京市朝阳区佳隆国际大厦', NULL, NULL, '2020-04-09 17:17:02', NULL, NULL, NULL, '2020-04-08 17:17:11', '2020-04-15 17:17:24', NULL);

-- ----------------------------
-- Table structure for oms_order_product
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_product`;
CREATE TABLE `oms_order_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(10) NOT NULL COMMENT '订单id',
  `order_num` varbinary(32) NULL DEFAULT NULL COMMENT '订单号',
  `product_id` bigint(10) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_product
-- ----------------------------
INSERT INTO `oms_order_product` VALUES (1, 1, 0x3230323030343133, 1);

-- ----------------------------
-- Table structure for oms_sold_product
-- ----------------------------
DROP TABLE IF EXISTS `oms_sold_product`;
CREATE TABLE `oms_sold_product`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint(10) NULL DEFAULT NULL COMMENT '买家id',
  `seller_id` bigint(10) NULL DEFAULT NULL COMMENT '卖家id',
  `product_id` bigint(10) NULL DEFAULT NULL COMMENT '商品id',
  `order_id` bigint(10) NULL DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品介绍',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `deal_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成交价格',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0-待付款 1-待发货 2-已发货 3-已完成 4-已关闭 5-无效订单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_sold_product
-- ----------------------------
INSERT INTO `oms_sold_product` VALUES (1, 6, 5, 1, 1, '1111111111', 'df', 'dfddf', 'dfsfsfs', 888.00, 666.01, '2000-11-11 00:00:00', 3);
INSERT INTO `oms_sold_product` VALUES (2, 7, 5, 2, 2, '2222222', 'dfa', 'afadfaf', 'afdafa', 666.00, 5555.00, '2020-04-08 14:16:14', 3);
INSERT INTO `oms_sold_product` VALUES (3, 8, 5, 3, 3, '554545', 'gsdf', 'faf', 'fadf', 555.00, 656.00, '2020-04-16 14:18:15', 2);
INSERT INTO `oms_sold_product` VALUES (4, 9, 5, 4, 4, '4325', 'fga', 'dfadf', 'adsfa', 435.00, 2452.00, '2020-07-06 14:18:37', 1);

-- ----------------------------
-- Table structure for pms_collection
-- ----------------------------
DROP TABLE IF EXISTS `pms_collection`;
CREATE TABLE `pms_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '类型 1-独家 2-其他 3-列表外展示',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频或图片url',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `on_use` int(1) NULL DEFAULT NULL COMMENT '是否使用 0-否 1-是',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_collection
-- ----------------------------
INSERT INTO `pms_collection` VALUES (1, 1, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '我是标题', '李微', '我是介绍介绍介绍介绍介绍', 1, '1,2,3,4,5,6,7,8', NULL, NULL);
INSERT INTO `pms_collection` VALUES (2, 1, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '我是二标题', '饺子', '我是介绍介绍介绍介绍介绍', 1, '1,2,3,4,5,6,7,8', NULL, NULL);
INSERT INTO `pms_collection` VALUES (3, 1, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '我是三标题', '小明', '我是介绍介绍介绍介绍介绍', 1, '1,2,3,4,5,6,7,8', NULL, NULL);
INSERT INTO `pms_collection` VALUES (4, 2, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '啊啊啊', '赵四', '啦啦啦啦啦啦啦啦啦', 1, '1,2,3,4,5,6,7,8', NULL, NULL);
INSERT INTO `pms_collection` VALUES (5, 3, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '666', '王五', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', 1, '1,2,3,4,5,6,7,8', NULL, NULL);
INSERT INTO `pms_collection` VALUES (6, 4, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', '阿福', '玛莲娜', '就会呵呵呵呵呵呵', 1, '1,2,3,4,5,6,7,8', NULL, NULL);

-- ----------------------------
-- Table structure for pms_collection_relate_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_collection_relate_product`;
CREATE TABLE `pms_collection_relate_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL COMMENT '特辑id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_collection_relate_product
-- ----------------------------
INSERT INTO `pms_collection_relate_product` VALUES (1, 1, '1,2,3,4');

-- ----------------------------
-- Table structure for pms_pro_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_brand`;
CREATE TABLE `pms_pro_brand`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型 0-普通 1-首页展示',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10010 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_brand
-- ----------------------------
INSERT INTO `pms_pro_brand` VALUES (10001, 1, '阿迪', 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/6666.jpg');
INSERT INTO `pms_pro_brand` VALUES (10002, 1, '安踏', 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/6666.jpg');
INSERT INTO `pms_pro_brand` VALUES (10003, 1, '冠军', 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/6666.jpg');
INSERT INTO `pms_pro_brand` VALUES (10004, 1, 'NIKE', 'aa');
INSERT INTO `pms_pro_brand` VALUES (10005, 1, '乔丹', 'gg');
INSERT INTO `pms_pro_brand` VALUES (10006, 2, '积家', NULL);
INSERT INTO `pms_pro_brand` VALUES (10007, 2, '法兰克穆勒', NULL);
INSERT INTO `pms_pro_brand` VALUES (10008, 2, 'Adidas', NULL);
INSERT INTO `pms_pro_brand` VALUES (10009, 2, '尊皇', NULL);

-- ----------------------------
-- Table structure for pms_pro_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_category`;
CREATE TABLE `pms_pro_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_category
-- ----------------------------
INSERT INTO `pms_pro_category` VALUES (1101, 1, '上衣', 'fushipic');
INSERT INTO `pms_pro_category` VALUES (1102, 1, '下衣', 'xiepic');
INSERT INTO `pms_pro_category` VALUES (1103, 1, '鞋子', 'peishipic');
INSERT INTO `pms_pro_category` VALUES (1104, 1, '配饰', 'peishipic');
INSERT INTO `pms_pro_category` VALUES (1105, 1, '其他', 'qitapic');

-- ----------------------------
-- Table structure for pms_pro_condition
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_condition`;
CREATE TABLE `pms_pro_condition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1303 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_condition
-- ----------------------------
INSERT INTO `pms_pro_condition` VALUES (1301, '全新', 3);
INSERT INTO `pms_pro_condition` VALUES (1302, '二手', 3);

-- ----------------------------
-- Table structure for pms_pro_size
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_size`;
CREATE TABLE `pms_pro_size`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL COMMENT '分类id',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1424 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_size
-- ----------------------------
INSERT INTO `pms_pro_size` VALUES (1401, 1101, 4, 'XXS');
INSERT INTO `pms_pro_size` VALUES (1402, 1101, 4, 'XS');
INSERT INTO `pms_pro_size` VALUES (1403, 1101, 4, 'S');
INSERT INTO `pms_pro_size` VALUES (1404, 1101, 4, 'M');
INSERT INTO `pms_pro_size` VALUES (1405, 1101, 4, 'L');
INSERT INTO `pms_pro_size` VALUES (1406, 1101, 4, 'XL');
INSERT INTO `pms_pro_size` VALUES (1407, 1101, 4, 'XXL');
INSERT INTO `pms_pro_size` VALUES (1408, 1102, 4, '37');
INSERT INTO `pms_pro_size` VALUES (1409, 1102, 4, '38');
INSERT INTO `pms_pro_size` VALUES (1410, 1102, 4, '39');
INSERT INTO `pms_pro_size` VALUES (1411, 1102, 4, '40');
INSERT INTO `pms_pro_size` VALUES (1412, 1102, 4, '41');
INSERT INTO `pms_pro_size` VALUES (1413, 1102, 4, '42');
INSERT INTO `pms_pro_size` VALUES (1414, 1102, 4, '43');
INSERT INTO `pms_pro_size` VALUES (1415, 1102, 4, '44');
INSERT INTO `pms_pro_size` VALUES (1416, 1103, 4, '37');
INSERT INTO `pms_pro_size` VALUES (1417, 1103, 4, '38');
INSERT INTO `pms_pro_size` VALUES (1418, 1103, 4, '39');
INSERT INTO `pms_pro_size` VALUES (1419, 1103, 4, '40');
INSERT INTO `pms_pro_size` VALUES (1420, 1103, 4, '41');
INSERT INTO `pms_pro_size` VALUES (1421, 1103, 4, '42');
INSERT INTO `pms_pro_size` VALUES (1422, 1103, 4, '43');
INSERT INTO `pms_pro_size` VALUES (1423, 1103, 4, '44');

-- ----------------------------
-- Table structure for pms_pro_style
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_style`;
CREATE TABLE `pms_pro_style`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `en_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1509 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_style
-- ----------------------------
INSERT INTO `pms_pro_style` VALUES (1501, 5, '工装', NULL, 'gongzhuangpic');
INSERT INTO `pms_pro_style` VALUES (1502, 5, '奢潮', NULL, 'shechaopic');
INSERT INTO `pms_pro_style` VALUES (1503, 5, '机能', NULL, 'jinengpic');
INSERT INTO `pms_pro_style` VALUES (1504, 5, '复古', NULL, 'fugupic');
INSERT INTO `pms_pro_style` VALUES (1505, 5, '运动', NULL, 'yundongpic');
INSERT INTO `pms_pro_style` VALUES (1506, 5, '原始', NULL, 'yuanshipic');
INSERT INTO `pms_pro_style` VALUES (1507, 5, '李微', NULL, 'desepic');
INSERT INTO `pms_pro_style` VALUES (1508, 5, '饺子', NULL, 'tuhaopic');

-- ----------------------------
-- Table structure for pms_pro_sub_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_pro_sub_category`;
CREATE TABLE `pms_pro_sub_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL COMMENT '分类id',
  `type` int(2) NOT NULL COMMENT '类型',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_pro_sub_category
-- ----------------------------
INSERT INTO `pms_pro_sub_category` VALUES (1201, 1101, 2, '外套', '');
INSERT INTO `pms_pro_sub_category` VALUES (1202, 1101, 2, '卫衣', '');
INSERT INTO `pms_pro_sub_category` VALUES (1203, 1101, 2, 'T恤', '');
INSERT INTO `pms_pro_sub_category` VALUES (1204, 1101, 2, '衬衫', '');
INSERT INTO `pms_pro_sub_category` VALUES (1205, 1102, 2, '长裤', '');
INSERT INTO `pms_pro_sub_category` VALUES (1206, 1102, 2, '短裤', '');
INSERT INTO `pms_pro_sub_category` VALUES (1207, 1103, 2, '靴子', '');
INSERT INTO `pms_pro_sub_category` VALUES (1208, 1103, 2, '休闲鞋', '');
INSERT INTO `pms_pro_sub_category` VALUES (1209, 1103, 2, '运动鞋', '');
INSERT INTO `pms_pro_sub_category` VALUES (1210, 1103, 2, '凉鞋拖鞋', '');
INSERT INTO `pms_pro_sub_category` VALUES (1211, 1103, 2, '跑鞋', '');
INSERT INTO `pms_pro_sub_category` VALUES (1212, 1104, 2, '帽子', '');
INSERT INTO `pms_pro_sub_category` VALUES (1213, 1104, 2, '眼镜', '');
INSERT INTO `pms_pro_sub_category` VALUES (1214, 1104, 2, '皮带', '');
INSERT INTO `pms_pro_sub_category` VALUES (1215, 1104, 2, '包', '');
INSERT INTO `pms_pro_sub_category` VALUES (1216, 1104, 2, '首饰', '');
INSERT INTO `pms_pro_sub_category` VALUES (1217, 1104, 2, '手表', '');
INSERT INTO `pms_pro_sub_category` VALUES (1218, 1105, 2, '鞋带', 'xiedaipic');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `product_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `sell_user_id` bigint(10) NOT NULL COMMENT '卖家用户id',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态 0-未审核 1-已通过 2-未通过 3-已下架 4-已售出 6-已删除',
  `refuse_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝理由',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `style` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风格',
  `category` int(2) NOT NULL COMMENT '分类',
  `sub_category` int(2) NULL DEFAULT NULL COMMENT '子分类',
  `use_condition` int(2) NOT NULL COMMENT '新旧程度 0-二手 1全新',
  `size` int(2) NULL DEFAULT NULL COMMENT '尺码',
  `color` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `brand` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',
  `price` decimal(20, 0) NOT NULL COMMENT '价格',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品介绍',
  `count` int(10) NOT NULL COMMENT '剩余数量',
  `discuss_price` int(1) NULL DEFAULT NULL COMMENT '接受议价 0-不接受 1-接受',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展示的商品图片',
  `all_pic` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品所有的图片',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `product_sex` int(1) NULL DEFAULT 2 COMMENT '适用人群 0-女 1-男 2-通用',
  `flaw` int(1) NULL DEFAULT 0 COMMENT '是否有瑕疵 0-否 1-有',
  `flaw_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '瑕疵原因',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '成交时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, '20200327183542-5', 5, 1, NULL, NULL, '耐克球鞋 N95', '1505,1506', 1103, 1201, 1302, 1414, '', 'NIKE', 999, '耐克球鞋嘎嘎牛逼', 1, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', 'productPic/2020-04-01/1/1l40EZ05-jpg,productPic/2020-04-01/1/e8nd8Ba0-jpg', NULL, NULL, 1, '鞋底漏了', NULL, NULL, '2020-04-09 14:29:23');
INSERT INTO `pms_product` VALUES (2, '20200327184240-5', 5, 1, NULL, NULL, '乔丹球鞋 N95', '1505,1507', 1103, 1201, 1302, 1413, '', 'JORDAN', 653, '乔丹球鞋嘎嘎牛逼', 1, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', 'productPic/2020-04-01/1/1l40EZ05-jpg,productPic/2020-04-01/1/e8nd8Ba0-jpg', NULL, NULL, 1, '鞋底漏了', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (3, '20200327184822-5', 5, 1, NULL, NULL, '耐克鞋带', '1501', 1105, 1218, 1302, NULL, '', 'NIKE', 44, '耐克鞋带嘎嘎结实', 1, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', 'productPic/2020-04-01/1/1l40EZ05-jpg,productPic/2020-04-01/1/e8nd8Ba0-jpg', NULL, NULL, 0, '', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (4, '20200401125643-5', 5, 1, NULL, NULL, '阿迪上衣', '1501,1502', 1101, 1201, 1301, 1403, '', '阿迪', 564, '阿迪上衣，嘎嘎帅', 1, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-01/1/1l40EZ05-jpg', 'productPic/2020-04-01/1/1l40EZ05-jpg,productPic/2020-04-01/1/e8nd8Ba0-jpg', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (7, '20200403110612-5', 5, 1, NULL, NULL, '无敌！', '1508', 1101, 1201, 1302, 1403, '', '卡地亚', 999, '真的很香甜', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/18p0Y3b2.png', 'productPic/2020-04-03/5/18p0Y3b2.png,productPic/2020-04-03/5/44u140fB.png,productPic/2020-04-03/5/097gMI6U.png,productPic/2020-04-03/5/7mm04Xq4.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (8, '20200403110759-5', 5, 1, NULL, NULL, '无敌是多么，多么寂寞', '1508', 1103, 1208, 1302, 1422, '', '尊皇', 99999, '就是有钱', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/a49G88K7.png', 'productPic/2020-04-03/5/a49G88K7.png,productPic/2020-04-03/5/7Zq23z4y.png,productPic/2020-04-03/5/i764dgpl.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (9, '20200403114728-5', 5, 1, NULL, NULL, 'ujjjs', '1504', 1101, 1201, 1302, 1403, '', '依波路', 884, '呵呵就在这', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/JKv2882q.png', 'productPic/2020-04-03/5/JKv2882q.png,productPic/2020-04-03/5/235oa1C4.png,productPic/2020-04-03/5/F6l39hkC.png,productPic/2020-04-03/5/81mbW24m.png,productPic/2020-04-03/5/R1BH5j9U.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (10, '20200403114812-5', 5, 1, NULL, NULL, '来啊啊啊啊啊', '1507', 1101, 1201, 1302, 1403, '', '香奈儿', 6497, '很么', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/q5u5MAl6.png', 'productPic/2020-04-03/5/q5u5MAl6.png,productPic/2020-04-03/5/8GN76903.png,productPic/2020-04-03/5/7Z8Pz8xk.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (11, '20200403114945-5', 5, 1, NULL, NULL, 'Air Jordan 全新二手', '1507', 1101, 1201, 1301, 1401, '', '法兰克穆勒', 7542, '找不到了我没啥事DVD好', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/3j00l772.png', 'productPic/2020-04-03/5/3j00l772.png,productPic/2020-04-03/5/5LZX859t.png,productPic/2020-04-03/5/g65E2KoM.png,productPic/2020-04-03/5/4iIx7320.png,productPic/2020-04-03/5/8537x888.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (12, '20200403115133-5', 5, 1, NULL, NULL, '吃的好的花花', '1507', 1101, 1201, 1301, 1401, '', '卡地亚', 14872, '不像你下班的', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/Q7In2xXF.png', 'productPic/2020-04-03/5/Q7In2xXF.png,productPic/2020-04-03/5/KkSBJ3Ia.png,productPic/2020-04-03/5/5e5T7377.png,productPic/2020-04-03/5/ND345PEk.png,productPic/2020-04-03/5/f56yj0f3.png,productPic/2020-04-03/5/4605943t.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (13, '20200403115355-5', 5, 1, NULL, NULL, '哈哈哈那你', '1507,1501', 1101, 1204, 1301, 1402, '', '艾米龙', 665, 'just', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/31y7U7Fr.png', 'productPic/2020-04-03/5/31y7U7Fr.png,productPic/2020-04-03/5/1UNH1l4T.png,productPic/2020-04-03/5/1H45D288.png,productPic/2020-04-03/5/J9n3f525.png,productPic/2020-04-03/5/F73hcb92.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (14, '20200403115510-5', 5, 1, NULL, NULL, '不开不会复合肥几个', '1507', 1103, 1207, 1302, 1419, '', '卡地亚', 8525, 'vvhh', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/imwcNu7e.png', 'productPic/2020-04-03/5/imwcNu7e.png,productPic/2020-04-03/5/9N0b12AJ.png,productPic/2020-04-03/5/R5Z7z970.png,productPic/2020-04-03/5/8l59C8Ev.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (15, '20200403120841-5', 5, 1, NULL, NULL, '哈哈广发银行合合分分GV别呀头发宝贝好好补补vvGVv；尴尬哈哈', '1507', 1103, 1208, 1302, 1422, '', 'Adidas', 569, 'hhhh', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/Jik2q364.png', 'productPic/2020-04-03/5/Jik2q364.png,productPic/2020-04-03/5/H176Pd32.png,productPic/2020-04-03/5/996R05o7.png,productPic/2020-04-03/5/mRU21JP5.png,productPic/2020-04-03/5/VA5967m9.png,productPic/2020-04-03/5/21jCvA7A.png,productPic/2020-04-03/5/14mO4S0X.png,productPic/2020-04-03/5/015Expq7.png', NULL, NULL, 1, 'bhb', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (16, '20200403121910-5', 5, 1, NULL, NULL, '哈哈哈哈hs', '1506', 1105, 1218, 1302, 1418, '', '波尔', 699, '好像都有很多不', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/OpL288cK.png', 'productPic/2020-04-03/5/OpL288cK.png,productPic/2020-04-03/5/474B143E.png,productPic/2020-04-03/5/j7556929.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (17, '20200403122502-5', 5, 1, NULL, NULL, '刚刚发货减肥激光估计', '1507', 1105, 1218, 1301, NULL, '', 'NOMOS', 8885, 'V刚看过结果I顾', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/58tX89N1.png', 'productPic/2020-04-03/5/58tX89N1.png,productPic/2020-04-03/5/hk2M03Z7.png,productPic/2020-04-03/5/f8GAY4K6.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (18, '20200403122902-5', 5, 1, NULL, NULL, '火锅结果结果几个', '1507', 1104, 1213, 1302, NULL, '', '积家', 885, '不会不会', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/O10m53NN.png', 'productPic/2020-04-03/5/O10m53NN.png,productPic/2020-04-03/5/5i3N3z43.png,productPic/2020-04-03/5/7l9J8c5r.png', NULL, NULL, 1, 'Veggie', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (19, '20200403123002-5', 5, 1, NULL, NULL, '刚回北京', '1507', 1102, 1206, 1302, 1414, '', '法兰克穆勒', 6655, 'hygb', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/8C1e4I7H.png', 'productPic/2020-04-03/5/8C1e4I7H.png,productPic/2020-04-03/5/kE31XCRk.png,productPic/2020-04-03/5/73zVJfN0.png,productPic/2020-04-03/5/56wO2q4u.png,productPic/2020-04-03/5/fjzw1R0s.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (20, '20200403124048-5', 5, 1, NULL, NULL, '111', '1507', 1101, 1201, 1301, 1401, '', 'Adidas', 24678, '就是的吧你是', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/S2z8f8k2.png', 'productPic/2020-04-03/5/S2z8f8k2.png,productPic/2020-04-03/5/c78N64y4.png,productPic/2020-04-03/5/0Q74HSx2.png', NULL, NULL, 1, 'Buddha', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (21, '20200403174444-5', 5, 1, NULL, NULL, '我是你爸爸', '1501', 1101, 1201, 1301, 1402, '', '耐克', 9999, '告诉你个秘密', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/8WD5b37v.png', 'productPic/2020-04-03/5/8WD5b37v.png,productPic/2020-04-03/5/JVd50Sv3.png,productPic/2020-04-03/5/eG2xY225.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (22, '20200403174853-5', 5, 1, NULL, NULL, '我是你爸爸（第二部）', '1502', 1101, 1201, 1301, 1402, '', 'NIKE', 9999, '告诉你个秘密', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/HfgljWk6.png', 'productPic/2020-04-03/5/HfgljWk6.png,productPic/2020-04-03/5/9p25KBDK.png,productPic/2020-04-03/5/qXa8dp57.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (23, '20200403181211-5', 5, 1, NULL, NULL, '帅眼镜', '1502', 1104, 1213, 1301, NULL, '', '尊皇', 21, '新购买', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/5F8ONz1p.png', 'productPic/2020-04-03/5/5F8ONz1p.png,productPic/2020-04-03/5/8vWZ160A.png,productPic/2020-04-03/5/0v6UO947.png', NULL, NULL, 1, 'Baihaiah', NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (24, '20200403203414-5', 5, 1, NULL, NULL, '吃vvv', '1501', 1101, 1201, 1301, 1401, '', '冠军', 488, '吃', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-03/5/n6U2rHM8.png', 'productPic/2020-04-03/5/n6U2rHM8.png,productPic/2020-04-03/5/08h95080.png,productPic/2020-04-03/5/T4U90Zr0.png,productPic/2020-04-03/5/5BSk81ce.png', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (25, '20200408193522-8', 8, 1, NULL, NULL, '测试A', '1503', 1101, 1201, 1301, 1401, '', '冠军', 666, '我的', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-08/5/XK8e0UP6.png', 'productPic/2020-04-08/5/XK8e0UP6.png,productPic/2020-04-08/5/F6P43PY2.png,productPic/2020-04-08/5/Uz1xaYt9.png', '2020-04-08 19:35:23', NULL, 0, NULL, NULL, '2020-04-08 19:35:23', '2020-04-08 19:35:23');
INSERT INTO `pms_product` VALUES (26, '20200409130917-6', 6, 1, NULL, NULL, '9999', '1504,1505', 1101, 1201, 1302, 1402, '', '乔丹', 8457, '我喜欢这个', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-09/5/00xn155J.png', 'productPic/2020-04-09/5/00xn155J.png,productPic/2020-04-09/5/hGCcZ5L0.png,productPic/2020-04-09/5/oPa94814.png', '2020-04-09 13:09:17', NULL, 0, NULL, NULL, '2020-04-09 13:09:17', '2020-04-09 13:09:17');
INSERT INTO `pms_product` VALUES (27, '20200413175218-8', 8, 1, NULL, NULL, '测试ssd', '1507', 1103, 1210, 1301, 1421, '', '阿迪', 7575, 'aaaa', 1, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/productPic/2020-04-13/5/41x7FrB7.png', 'productPic/2020-04-13/5/41x7FrB7.png,productPic/2020-04-13/5/1B2Tabvq.png,productPic/2020-04-13/5/rqY30U6B.png', '2020-04-13 17:52:19', NULL, 1, 'Baggage\nHehsh', NULL, '2020-04-13 17:52:19', '2020-04-13 17:52:19');

-- ----------------------------
-- Table structure for sms_banner
-- ----------------------------
DROP TABLE IF EXISTS `sms_banner`;
CREATE TABLE `sms_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `type` int(1) NOT NULL COMMENT '类型',
  `sort` int(2) NULL DEFAULT NULL COMMENT '排序',
  `value` int(8) NULL DEFAULT NULL COMMENT 'type对应的值',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_banner
-- ----------------------------
INSERT INTO `sms_banner` VALUES (1, 'pic', 1, 1, 1, NULL, NULL);
INSERT INTO `sms_banner` VALUES (2, 'pic2', 1, 2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for sms_collection_pro_config
-- ----------------------------
DROP TABLE IF EXISTS `sms_collection_pro_config`;
CREATE TABLE `sms_collection_pro_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '类型',
  `value` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_collection_pro_config
-- ----------------------------
INSERT INTO `sms_collection_pro_config` VALUES (1, 1, 'NIKE', 'NIKE品牌');

-- ----------------------------
-- Table structure for sms_config_param
-- ----------------------------
DROP TABLE IF EXISTS `sms_config_param`;
CREATE TABLE `sms_config_param`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
  `param_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `intro` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_config_param
-- ----------------------------
INSERT INTO `sms_config_param` VALUES (1, 'HOT_BRAND', '10001,10002,10003,10004,10005', '热门品牌id列表');
INSERT INTO `sms_config_param` VALUES (2, 'PRODUCT_SHOW_COUNT', '10', '推荐商品、类似商品等展示数量');
INSERT INTO `sms_config_param` VALUES (3, 'RECOMMEND_PRODUCT', '1,2,3,4,5,6,7,8,9,10', '推荐商品列表');
INSERT INTO `sms_config_param` VALUES (4, 'COLLECTION_PRODUCT_TYPE1', '2,NIKE', '特辑商品流1 类型 1品牌 2风格 3类型 4子类型');
INSERT INTO `sms_config_param` VALUES (5, 'COLLECTION_PRODUCT_TYPE2', '1,1505', '特辑商品流2');
INSERT INTO `sms_config_param` VALUES (6, 'COLLECTION_PRODUCT_TYPE3', '2,JORDAN', '特辑商品流3');
INSERT INTO `sms_config_param` VALUES (7, 'ORDER_EXPIRE_TIME', '5', '订单失效时间（分）');

-- ----------------------------
-- Table structure for ums_area
-- ----------------------------
DROP TABLE IF EXISTS `ums_area`;
CREATE TABLE `ums_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codeid` mediumint(12) NOT NULL,
  `parentid` int(12) NOT NULL COMMENT '父id',
  `cityName` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省/市/县名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3523 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省市县三级联动数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_area
-- ----------------------------
INSERT INTO `ums_area` VALUES (1, 11, 0, '北京');
INSERT INTO `ums_area` VALUES (2, 1101, 11, '北京市辖');
INSERT INTO `ums_area` VALUES (3, 110101, 1101, '东城区');
INSERT INTO `ums_area` VALUES (4, 110102, 1101, '西城区');
INSERT INTO `ums_area` VALUES (5, 110103, 1101, '崇文区');
INSERT INTO `ums_area` VALUES (6, 110104, 1101, '宣武区');
INSERT INTO `ums_area` VALUES (7, 110105, 1101, '朝阳区');
INSERT INTO `ums_area` VALUES (8, 110106, 1101, '丰台区');
INSERT INTO `ums_area` VALUES (9, 110107, 1101, '石景山区');
INSERT INTO `ums_area` VALUES (10, 110108, 1101, '海淀区');
INSERT INTO `ums_area` VALUES (11, 110109, 1101, '门头沟区');
INSERT INTO `ums_area` VALUES (12, 110111, 1101, '房山区');
INSERT INTO `ums_area` VALUES (13, 110112, 1101, '通州区');
INSERT INTO `ums_area` VALUES (14, 110113, 1101, '顺义区');
INSERT INTO `ums_area` VALUES (15, 110114, 1101, '昌平区');
INSERT INTO `ums_area` VALUES (16, 1102, 11, '北京县辖');
INSERT INTO `ums_area` VALUES (17, 110224, 1102, '大兴县');
INSERT INTO `ums_area` VALUES (18, 110226, 1102, '平谷县');
INSERT INTO `ums_area` VALUES (19, 110227, 1102, '怀柔县');
INSERT INTO `ums_area` VALUES (20, 110228, 1102, '密云县');
INSERT INTO `ums_area` VALUES (21, 110229, 1102, '延庆县');
INSERT INTO `ums_area` VALUES (22, 12, 0, '天津');
INSERT INTO `ums_area` VALUES (23, 1201, 12, '天津市辖');
INSERT INTO `ums_area` VALUES (24, 120101, 1201, '和平区');
INSERT INTO `ums_area` VALUES (25, 120102, 1201, '河东区');
INSERT INTO `ums_area` VALUES (26, 120103, 1201, '河西区');
INSERT INTO `ums_area` VALUES (27, 120104, 1201, '南开区');
INSERT INTO `ums_area` VALUES (28, 120105, 1201, '河北区');
INSERT INTO `ums_area` VALUES (29, 120106, 1201, '红桥区');
INSERT INTO `ums_area` VALUES (30, 120107, 1201, '塘沽区');
INSERT INTO `ums_area` VALUES (31, 120108, 1201, '汉沽区');
INSERT INTO `ums_area` VALUES (32, 120109, 1201, '大港区');
INSERT INTO `ums_area` VALUES (33, 120110, 1201, '东丽区');
INSERT INTO `ums_area` VALUES (34, 120111, 1201, '西青区');
INSERT INTO `ums_area` VALUES (35, 120112, 1201, '津南区');
INSERT INTO `ums_area` VALUES (36, 120113, 1201, '北辰区');
INSERT INTO `ums_area` VALUES (37, 120114, 1201, '武清区');
INSERT INTO `ums_area` VALUES (38, 1202, 12, '天津县辖');
INSERT INTO `ums_area` VALUES (39, 120221, 1202, '宁河县');
INSERT INTO `ums_area` VALUES (40, 120223, 1202, '静海县');
INSERT INTO `ums_area` VALUES (41, 120224, 1202, '宝坻县');
INSERT INTO `ums_area` VALUES (42, 120225, 1202, '蓟 县');
INSERT INTO `ums_area` VALUES (43, 13, 0, '河北');
INSERT INTO `ums_area` VALUES (44, 1301, 13, '石家庄');
INSERT INTO `ums_area` VALUES (45, 130101, 1301, '市辖区');
INSERT INTO `ums_area` VALUES (46, 130102, 1301, '长安区');
INSERT INTO `ums_area` VALUES (47, 130103, 1301, '桥东区');
INSERT INTO `ums_area` VALUES (48, 130104, 1301, '桥西区');
INSERT INTO `ums_area` VALUES (49, 130105, 1301, '新华区');
INSERT INTO `ums_area` VALUES (50, 130106, 1301, '郊 区');
INSERT INTO `ums_area` VALUES (51, 130107, 1301, '井陉矿区');
INSERT INTO `ums_area` VALUES (52, 130121, 1301, '井陉县');
INSERT INTO `ums_area` VALUES (53, 130123, 1301, '正定县');
INSERT INTO `ums_area` VALUES (54, 130124, 1301, '栾城县');
INSERT INTO `ums_area` VALUES (55, 130125, 1301, '行唐县');
INSERT INTO `ums_area` VALUES (56, 130126, 1301, '灵寿县');
INSERT INTO `ums_area` VALUES (57, 130127, 1301, '高邑县');
INSERT INTO `ums_area` VALUES (58, 130128, 1301, '深泽县');
INSERT INTO `ums_area` VALUES (59, 130129, 1301, '赞皇县');
INSERT INTO `ums_area` VALUES (60, 130130, 1301, '无极县');
INSERT INTO `ums_area` VALUES (61, 130131, 1301, '平山县');
INSERT INTO `ums_area` VALUES (62, 130132, 1301, '元氏县');
INSERT INTO `ums_area` VALUES (63, 130133, 1301, '赵 县');
INSERT INTO `ums_area` VALUES (64, 130181, 1301, '辛集市');
INSERT INTO `ums_area` VALUES (65, 130182, 1301, '藁城市');
INSERT INTO `ums_area` VALUES (66, 130183, 1301, '晋州市');
INSERT INTO `ums_area` VALUES (67, 130184, 1301, '新乐市');
INSERT INTO `ums_area` VALUES (68, 130185, 1301, '鹿泉市');
INSERT INTO `ums_area` VALUES (69, 1302, 13, '唐山');
INSERT INTO `ums_area` VALUES (70, 130201, 1302, '市辖区');
INSERT INTO `ums_area` VALUES (71, 130202, 1302, '路南区');
INSERT INTO `ums_area` VALUES (72, 130203, 1302, '路北区');
INSERT INTO `ums_area` VALUES (73, 130204, 1302, '古冶区');
INSERT INTO `ums_area` VALUES (74, 130205, 1302, '开平区');
INSERT INTO `ums_area` VALUES (75, 130206, 1302, '新 区');
INSERT INTO `ums_area` VALUES (76, 130221, 1302, '丰润县');
INSERT INTO `ums_area` VALUES (77, 130223, 1302, '滦 县');
INSERT INTO `ums_area` VALUES (78, 130224, 1302, '滦南县');
INSERT INTO `ums_area` VALUES (79, 130225, 1302, '乐亭县');
INSERT INTO `ums_area` VALUES (80, 130227, 1302, '迁西县');
INSERT INTO `ums_area` VALUES (81, 130229, 1302, '玉田县');
INSERT INTO `ums_area` VALUES (82, 130230, 1302, '唐海县');
INSERT INTO `ums_area` VALUES (83, 130281, 1302, '遵化市');
INSERT INTO `ums_area` VALUES (84, 130282, 1302, '丰南市');
INSERT INTO `ums_area` VALUES (85, 130283, 1302, '迁安市');
INSERT INTO `ums_area` VALUES (86, 1303, 13, '秦皇岛');
INSERT INTO `ums_area` VALUES (87, 130301, 1303, '市辖区');
INSERT INTO `ums_area` VALUES (88, 130302, 1303, '海港区');
INSERT INTO `ums_area` VALUES (89, 130303, 1303, '山海关区');
INSERT INTO `ums_area` VALUES (90, 130304, 1303, '北戴河区');
INSERT INTO `ums_area` VALUES (91, 130321, 1303, '青龙满族自治县');
INSERT INTO `ums_area` VALUES (92, 130322, 1303, '昌黎县');
INSERT INTO `ums_area` VALUES (93, 130323, 1303, '抚宁县');
INSERT INTO `ums_area` VALUES (94, 130324, 1303, '卢龙县');
INSERT INTO `ums_area` VALUES (95, 1304, 13, '邯郸');
INSERT INTO `ums_area` VALUES (96, 130401, 1304, '市辖区');
INSERT INTO `ums_area` VALUES (97, 130402, 1304, '邯山区');
INSERT INTO `ums_area` VALUES (98, 130403, 1304, '丛台区');
INSERT INTO `ums_area` VALUES (99, 130404, 1304, '复兴区');
INSERT INTO `ums_area` VALUES (100, 130406, 1304, '峰峰矿区');
INSERT INTO `ums_area` VALUES (101, 130421, 1304, '邯郸县');
INSERT INTO `ums_area` VALUES (102, 130423, 1304, '临漳县');
INSERT INTO `ums_area` VALUES (103, 130424, 1304, '成安县');
INSERT INTO `ums_area` VALUES (104, 130425, 1304, '大名县');
INSERT INTO `ums_area` VALUES (105, 130426, 1304, '涉 县');
INSERT INTO `ums_area` VALUES (106, 130427, 1304, '磁 县');
INSERT INTO `ums_area` VALUES (107, 130428, 1304, '肥乡县');
INSERT INTO `ums_area` VALUES (108, 130429, 1304, '永年县');
INSERT INTO `ums_area` VALUES (109, 130430, 1304, '邱 县');
INSERT INTO `ums_area` VALUES (110, 130431, 1304, '鸡泽县');
INSERT INTO `ums_area` VALUES (111, 130432, 1304, '广平县');
INSERT INTO `ums_area` VALUES (112, 130433, 1304, '馆陶县');
INSERT INTO `ums_area` VALUES (113, 130434, 1304, '魏 县');
INSERT INTO `ums_area` VALUES (114, 130435, 1304, '曲周县');
INSERT INTO `ums_area` VALUES (115, 130481, 1304, '武安市');
INSERT INTO `ums_area` VALUES (116, 1305, 13, '邢台');
INSERT INTO `ums_area` VALUES (117, 130501, 1305, '市辖区');
INSERT INTO `ums_area` VALUES (118, 130502, 1305, '桥东区');
INSERT INTO `ums_area` VALUES (119, 130503, 1305, '桥西区');
INSERT INTO `ums_area` VALUES (120, 130521, 1305, '邢台县');
INSERT INTO `ums_area` VALUES (121, 130522, 1305, '临城县');
INSERT INTO `ums_area` VALUES (122, 130523, 1305, '内丘县');
INSERT INTO `ums_area` VALUES (123, 130524, 1305, '柏乡县');
INSERT INTO `ums_area` VALUES (124, 130525, 1305, '隆尧县');
INSERT INTO `ums_area` VALUES (125, 130526, 1305, '任 县');
INSERT INTO `ums_area` VALUES (126, 130527, 1305, '南和县');
INSERT INTO `ums_area` VALUES (127, 130528, 1305, '宁晋县');
INSERT INTO `ums_area` VALUES (128, 130529, 1305, '巨鹿县');
INSERT INTO `ums_area` VALUES (129, 130530, 1305, '新河县');
INSERT INTO `ums_area` VALUES (130, 130531, 1305, '广宗县');
INSERT INTO `ums_area` VALUES (131, 130532, 1305, '平乡县');
INSERT INTO `ums_area` VALUES (132, 130533, 1305, '威 县');
INSERT INTO `ums_area` VALUES (133, 130534, 1305, '清河县');
INSERT INTO `ums_area` VALUES (134, 130535, 1305, '临西县');
INSERT INTO `ums_area` VALUES (135, 130581, 1305, '南宫市');
INSERT INTO `ums_area` VALUES (136, 130582, 1305, '沙河市');
INSERT INTO `ums_area` VALUES (137, 1306, 13, '保定');
INSERT INTO `ums_area` VALUES (138, 130601, 1306, '市辖区');
INSERT INTO `ums_area` VALUES (139, 130602, 1306, '新市区');
INSERT INTO `ums_area` VALUES (140, 130603, 1306, '北市区');
INSERT INTO `ums_area` VALUES (141, 130604, 1306, '南市区');
INSERT INTO `ums_area` VALUES (142, 130621, 1306, '满城县');
INSERT INTO `ums_area` VALUES (143, 130622, 1306, '清苑县');
INSERT INTO `ums_area` VALUES (144, 130623, 1306, '涞水县');
INSERT INTO `ums_area` VALUES (145, 130624, 1306, '阜平县');
INSERT INTO `ums_area` VALUES (146, 130625, 1306, '徐水县');
INSERT INTO `ums_area` VALUES (147, 130626, 1306, '定兴县');
INSERT INTO `ums_area` VALUES (148, 130627, 1306, '唐 县');
INSERT INTO `ums_area` VALUES (149, 130628, 1306, '高阳县');
INSERT INTO `ums_area` VALUES (150, 130629, 1306, '容城县');
INSERT INTO `ums_area` VALUES (151, 130630, 1306, '涞源县');
INSERT INTO `ums_area` VALUES (152, 130631, 1306, '望都县');
INSERT INTO `ums_area` VALUES (153, 130632, 1306, '安新县');
INSERT INTO `ums_area` VALUES (154, 130633, 1306, '易 县');
INSERT INTO `ums_area` VALUES (155, 130634, 1306, '曲阳县');
INSERT INTO `ums_area` VALUES (156, 130635, 1306, '蠡 县');
INSERT INTO `ums_area` VALUES (157, 130636, 1306, '顺平县');
INSERT INTO `ums_area` VALUES (158, 130637, 1306, '博野县');
INSERT INTO `ums_area` VALUES (159, 130638, 1306, '雄 县');
INSERT INTO `ums_area` VALUES (160, 130681, 1306, '涿州市');
INSERT INTO `ums_area` VALUES (161, 130682, 1306, '定州市');
INSERT INTO `ums_area` VALUES (162, 130683, 1306, '安国市');
INSERT INTO `ums_area` VALUES (163, 130684, 1306, '高碑店市');
INSERT INTO `ums_area` VALUES (164, 1307, 13, '张家口');
INSERT INTO `ums_area` VALUES (165, 130701, 1307, '市辖区');
INSERT INTO `ums_area` VALUES (166, 130702, 1307, '桥东区');
INSERT INTO `ums_area` VALUES (167, 130703, 1307, '桥西区');
INSERT INTO `ums_area` VALUES (168, 130705, 1307, '宣化区');
INSERT INTO `ums_area` VALUES (169, 130706, 1307, '下花园区');
INSERT INTO `ums_area` VALUES (170, 130721, 1307, '宣化县');
INSERT INTO `ums_area` VALUES (171, 130722, 1307, '张北县');
INSERT INTO `ums_area` VALUES (172, 130723, 1307, '康保县');
INSERT INTO `ums_area` VALUES (173, 130724, 1307, '沽源县');
INSERT INTO `ums_area` VALUES (174, 130725, 1307, '尚义县');
INSERT INTO `ums_area` VALUES (175, 130726, 1307, '蔚 县');
INSERT INTO `ums_area` VALUES (176, 130727, 1307, '阳原县');
INSERT INTO `ums_area` VALUES (177, 130728, 1307, '怀安县');
INSERT INTO `ums_area` VALUES (178, 130729, 1307, '万全县');
INSERT INTO `ums_area` VALUES (179, 130730, 1307, '怀来县');
INSERT INTO `ums_area` VALUES (180, 130731, 1307, '涿鹿县');
INSERT INTO `ums_area` VALUES (181, 130732, 1307, '赤城县');
INSERT INTO `ums_area` VALUES (182, 130733, 1307, '崇礼县');
INSERT INTO `ums_area` VALUES (183, 1308, 13, '承德');
INSERT INTO `ums_area` VALUES (184, 130801, 1308, '市辖区');
INSERT INTO `ums_area` VALUES (185, 130802, 1308, '双桥区');
INSERT INTO `ums_area` VALUES (186, 130803, 1308, '双滦区');
INSERT INTO `ums_area` VALUES (187, 130804, 1308, '鹰手营子矿区');
INSERT INTO `ums_area` VALUES (188, 130821, 1308, '承德县');
INSERT INTO `ums_area` VALUES (189, 130822, 1308, '兴隆县');
INSERT INTO `ums_area` VALUES (190, 130823, 1308, '平泉县');
INSERT INTO `ums_area` VALUES (191, 130824, 1308, '滦平县');
INSERT INTO `ums_area` VALUES (192, 130825, 1308, '隆化县');
INSERT INTO `ums_area` VALUES (193, 130826, 1308, '丰宁满族自治县');
INSERT INTO `ums_area` VALUES (194, 130827, 1308, '宽城满族自治县');
INSERT INTO `ums_area` VALUES (195, 130828, 1308, '围场满族蒙古族自治县');
INSERT INTO `ums_area` VALUES (196, 1309, 13, '沧州');
INSERT INTO `ums_area` VALUES (197, 130901, 1309, '市辖区');
INSERT INTO `ums_area` VALUES (198, 130902, 1309, '新华区');
INSERT INTO `ums_area` VALUES (199, 130903, 1309, '运河区');
INSERT INTO `ums_area` VALUES (200, 130921, 1309, '沧 县');
INSERT INTO `ums_area` VALUES (201, 130922, 1309, '青 县');
INSERT INTO `ums_area` VALUES (202, 130923, 1309, '东光县');
INSERT INTO `ums_area` VALUES (203, 130924, 1309, '海兴县');
INSERT INTO `ums_area` VALUES (204, 130925, 1309, '盐山县');
INSERT INTO `ums_area` VALUES (205, 130926, 1309, '肃宁县');
INSERT INTO `ums_area` VALUES (206, 130927, 1309, '南皮县');
INSERT INTO `ums_area` VALUES (207, 130928, 1309, '吴桥县');
INSERT INTO `ums_area` VALUES (208, 130929, 1309, '献 县');
INSERT INTO `ums_area` VALUES (209, 130930, 1309, '孟村回族自治县');
INSERT INTO `ums_area` VALUES (210, 130981, 1309, '泊头市');
INSERT INTO `ums_area` VALUES (211, 130982, 1309, '任丘市');
INSERT INTO `ums_area` VALUES (212, 130983, 1309, '黄骅市');
INSERT INTO `ums_area` VALUES (213, 130984, 1309, '河间市');
INSERT INTO `ums_area` VALUES (214, 1310, 13, '廊坊');
INSERT INTO `ums_area` VALUES (215, 131001, 1310, '市辖区');
INSERT INTO `ums_area` VALUES (216, 131002, 1310, '安次区');
INSERT INTO `ums_area` VALUES (217, 131003, 1310, '廊坊市广阳区');
INSERT INTO `ums_area` VALUES (218, 131022, 1310, '固安县');
INSERT INTO `ums_area` VALUES (219, 131023, 1310, '永清县');
INSERT INTO `ums_area` VALUES (220, 131024, 1310, '香河县');
INSERT INTO `ums_area` VALUES (221, 131025, 1310, '大城县');
INSERT INTO `ums_area` VALUES (222, 131026, 1310, '文安县');
INSERT INTO `ums_area` VALUES (223, 131028, 1310, '大厂回族自治县');
INSERT INTO `ums_area` VALUES (224, 131081, 1310, '霸州市');
INSERT INTO `ums_area` VALUES (225, 131082, 1310, '三河市');
INSERT INTO `ums_area` VALUES (226, 1311, 13, '衡水');
INSERT INTO `ums_area` VALUES (227, 131101, 1311, '市辖区');
INSERT INTO `ums_area` VALUES (228, 131102, 1311, '桃城区');
INSERT INTO `ums_area` VALUES (229, 131121, 1311, '枣强县');
INSERT INTO `ums_area` VALUES (230, 131122, 1311, '武邑县');
INSERT INTO `ums_area` VALUES (231, 131123, 1311, '武强县');
INSERT INTO `ums_area` VALUES (232, 131124, 1311, '饶阳县');
INSERT INTO `ums_area` VALUES (233, 131125, 1311, '安平县');
INSERT INTO `ums_area` VALUES (234, 131126, 1311, '故城县');
INSERT INTO `ums_area` VALUES (235, 131127, 1311, '景 县');
INSERT INTO `ums_area` VALUES (236, 131128, 1311, '阜城县');
INSERT INTO `ums_area` VALUES (237, 131181, 1311, '冀州市');
INSERT INTO `ums_area` VALUES (238, 131182, 1311, '深州市');
INSERT INTO `ums_area` VALUES (239, 14, 0, '山西');
INSERT INTO `ums_area` VALUES (240, 1401, 14, '太原');
INSERT INTO `ums_area` VALUES (241, 140101, 1401, '市辖区');
INSERT INTO `ums_area` VALUES (242, 140105, 1401, '小店区');
INSERT INTO `ums_area` VALUES (243, 140106, 1401, '迎泽区');
INSERT INTO `ums_area` VALUES (244, 140107, 1401, '杏花岭区');
INSERT INTO `ums_area` VALUES (245, 140108, 1401, '尖草坪区');
INSERT INTO `ums_area` VALUES (246, 140109, 1401, '万柏林区');
INSERT INTO `ums_area` VALUES (247, 140110, 1401, '晋源区');
INSERT INTO `ums_area` VALUES (248, 140121, 1401, '清徐县');
INSERT INTO `ums_area` VALUES (249, 140122, 1401, '阳曲县');
INSERT INTO `ums_area` VALUES (250, 140123, 1401, '娄烦县');
INSERT INTO `ums_area` VALUES (251, 140181, 1401, '古交市');
INSERT INTO `ums_area` VALUES (252, 1402, 14, '大同');
INSERT INTO `ums_area` VALUES (253, 140201, 1402, '市辖区');
INSERT INTO `ums_area` VALUES (254, 140202, 1402, '城 区');
INSERT INTO `ums_area` VALUES (255, 140203, 1402, '矿 区');
INSERT INTO `ums_area` VALUES (256, 140211, 1402, '南郊区');
INSERT INTO `ums_area` VALUES (257, 140212, 1402, '新荣区');
INSERT INTO `ums_area` VALUES (258, 140221, 1402, '阳高县');
INSERT INTO `ums_area` VALUES (259, 140222, 1402, '天镇县');
INSERT INTO `ums_area` VALUES (260, 140223, 1402, '广灵县');
INSERT INTO `ums_area` VALUES (261, 140224, 1402, '灵丘县');
INSERT INTO `ums_area` VALUES (262, 140225, 1402, '浑源县');
INSERT INTO `ums_area` VALUES (263, 140226, 1402, '左云县');
INSERT INTO `ums_area` VALUES (264, 140227, 1402, '大同县');
INSERT INTO `ums_area` VALUES (265, 1403, 14, '阳泉');
INSERT INTO `ums_area` VALUES (266, 140301, 1403, '市辖区');
INSERT INTO `ums_area` VALUES (267, 140302, 1403, '城 区');
INSERT INTO `ums_area` VALUES (268, 140303, 1403, '矿 区');
INSERT INTO `ums_area` VALUES (269, 140311, 1403, '郊 区');
INSERT INTO `ums_area` VALUES (270, 140321, 1403, '平定县');
INSERT INTO `ums_area` VALUES (271, 140322, 1403, '盂 县');
INSERT INTO `ums_area` VALUES (272, 1404, 14, '长治');
INSERT INTO `ums_area` VALUES (273, 140401, 1404, '市辖区');
INSERT INTO `ums_area` VALUES (274, 140402, 1404, '城 区');
INSERT INTO `ums_area` VALUES (275, 140411, 1404, '郊 区');
INSERT INTO `ums_area` VALUES (276, 140421, 1404, '长治县');
INSERT INTO `ums_area` VALUES (277, 140423, 1404, '襄垣县');
INSERT INTO `ums_area` VALUES (278, 140424, 1404, '屯留县');
INSERT INTO `ums_area` VALUES (279, 140425, 1404, '平顺县');
INSERT INTO `ums_area` VALUES (280, 140426, 1404, '黎城县');
INSERT INTO `ums_area` VALUES (281, 140427, 1404, '壶关县');
INSERT INTO `ums_area` VALUES (282, 140428, 1404, '长子县');
INSERT INTO `ums_area` VALUES (283, 140429, 1404, '武乡县');
INSERT INTO `ums_area` VALUES (284, 140430, 1404, '沁 县');
INSERT INTO `ums_area` VALUES (285, 140431, 1404, '沁源县');
INSERT INTO `ums_area` VALUES (286, 140481, 1404, '潞城市');
INSERT INTO `ums_area` VALUES (287, 1405, 14, '晋城');
INSERT INTO `ums_area` VALUES (288, 140501, 1405, '市辖区');
INSERT INTO `ums_area` VALUES (289, 140502, 1405, '城 区');
INSERT INTO `ums_area` VALUES (290, 140521, 1405, '沁水县');
INSERT INTO `ums_area` VALUES (291, 140522, 1405, '阳城县');
INSERT INTO `ums_area` VALUES (292, 140524, 1405, '陵川县');
INSERT INTO `ums_area` VALUES (293, 140525, 1405, '泽州县');
INSERT INTO `ums_area` VALUES (294, 140581, 1405, '高平市');
INSERT INTO `ums_area` VALUES (295, 1406, 14, '朔州');
INSERT INTO `ums_area` VALUES (296, 140601, 1406, '市辖区');
INSERT INTO `ums_area` VALUES (297, 140602, 1406, '朔城区');
INSERT INTO `ums_area` VALUES (298, 140603, 1406, '平鲁区');
INSERT INTO `ums_area` VALUES (299, 140621, 1406, '山阴县');
INSERT INTO `ums_area` VALUES (300, 140622, 1406, '应 县');
INSERT INTO `ums_area` VALUES (301, 140623, 1406, '右玉县');
INSERT INTO `ums_area` VALUES (302, 140624, 1406, '怀仁县');
INSERT INTO `ums_area` VALUES (303, 1407, 14, '晋中');
INSERT INTO `ums_area` VALUES (304, 140701, 1407, '市辖区');
INSERT INTO `ums_area` VALUES (305, 140702, 1407, '榆次区');
INSERT INTO `ums_area` VALUES (306, 140721, 1407, '榆社县');
INSERT INTO `ums_area` VALUES (307, 140722, 1407, '左权县');
INSERT INTO `ums_area` VALUES (308, 140723, 1407, '和顺县');
INSERT INTO `ums_area` VALUES (309, 140724, 1407, '昔阳县');
INSERT INTO `ums_area` VALUES (310, 140725, 1407, '寿阳县');
INSERT INTO `ums_area` VALUES (311, 140726, 1407, '太谷县');
INSERT INTO `ums_area` VALUES (312, 140727, 1407, '祁 县');
INSERT INTO `ums_area` VALUES (313, 140728, 1407, '平遥县');
INSERT INTO `ums_area` VALUES (314, 140729, 1407, '灵石县');
INSERT INTO `ums_area` VALUES (315, 140781, 1407, '介休市');
INSERT INTO `ums_area` VALUES (316, 1408, 14, '运城');
INSERT INTO `ums_area` VALUES (317, 140801, 1408, '市辖区');
INSERT INTO `ums_area` VALUES (318, 140802, 1408, '盐湖区');
INSERT INTO `ums_area` VALUES (319, 140821, 1408, '临猗县');
INSERT INTO `ums_area` VALUES (320, 140822, 1408, '万荣县');
INSERT INTO `ums_area` VALUES (321, 140823, 1408, '闻喜县');
INSERT INTO `ums_area` VALUES (322, 140824, 1408, '稷山县');
INSERT INTO `ums_area` VALUES (323, 140825, 1408, '新绛县');
INSERT INTO `ums_area` VALUES (324, 140826, 1408, '绛 县');
INSERT INTO `ums_area` VALUES (325, 140827, 1408, '垣曲县');
INSERT INTO `ums_area` VALUES (326, 140828, 1408, '夏 县');
INSERT INTO `ums_area` VALUES (327, 140829, 1408, '平陆县');
INSERT INTO `ums_area` VALUES (328, 140830, 1408, '芮城县');
INSERT INTO `ums_area` VALUES (329, 140881, 1408, '永济市');
INSERT INTO `ums_area` VALUES (330, 140882, 1408, '河津市');
INSERT INTO `ums_area` VALUES (331, 1409, 14, '忻州');
INSERT INTO `ums_area` VALUES (332, 140901, 1409, '市辖区');
INSERT INTO `ums_area` VALUES (333, 140902, 1409, '忻府区');
INSERT INTO `ums_area` VALUES (334, 140921, 1409, '定襄县');
INSERT INTO `ums_area` VALUES (335, 140922, 1409, '五台县');
INSERT INTO `ums_area` VALUES (336, 140923, 1409, '代 县');
INSERT INTO `ums_area` VALUES (337, 140924, 1409, '繁峙县');
INSERT INTO `ums_area` VALUES (338, 140925, 1409, '宁武县');
INSERT INTO `ums_area` VALUES (339, 140926, 1409, '静乐县');
INSERT INTO `ums_area` VALUES (340, 140927, 1409, '神池县');
INSERT INTO `ums_area` VALUES (341, 140928, 1409, '五寨县');
INSERT INTO `ums_area` VALUES (342, 140929, 1409, '岢岚县');
INSERT INTO `ums_area` VALUES (343, 140930, 1409, '河曲县');
INSERT INTO `ums_area` VALUES (344, 140931, 1409, '保德县');
INSERT INTO `ums_area` VALUES (345, 140932, 1409, '偏关县');
INSERT INTO `ums_area` VALUES (346, 140981, 1409, '原平市');
INSERT INTO `ums_area` VALUES (347, 1410, 14, '临汾');
INSERT INTO `ums_area` VALUES (348, 141001, 1410, '市辖区');
INSERT INTO `ums_area` VALUES (349, 141002, 1410, '尧都区');
INSERT INTO `ums_area` VALUES (350, 141021, 1410, '曲沃县');
INSERT INTO `ums_area` VALUES (351, 141022, 1410, '翼城县');
INSERT INTO `ums_area` VALUES (352, 141023, 1410, '襄汾县');
INSERT INTO `ums_area` VALUES (353, 141024, 1410, '洪洞县');
INSERT INTO `ums_area` VALUES (354, 141025, 1410, '古 县');
INSERT INTO `ums_area` VALUES (355, 141026, 1410, '安泽县');
INSERT INTO `ums_area` VALUES (356, 141027, 1410, '浮山县');
INSERT INTO `ums_area` VALUES (357, 141028, 1410, '吉 县');
INSERT INTO `ums_area` VALUES (358, 141029, 1410, '乡宁县');
INSERT INTO `ums_area` VALUES (359, 141030, 1410, '大宁县');
INSERT INTO `ums_area` VALUES (360, 141031, 1410, '隰 县');
INSERT INTO `ums_area` VALUES (361, 141032, 1410, '永和县');
INSERT INTO `ums_area` VALUES (362, 141033, 1410, '蒲 县');
INSERT INTO `ums_area` VALUES (363, 141034, 1410, '汾西县');
INSERT INTO `ums_area` VALUES (364, 141081, 1410, '侯马市');
INSERT INTO `ums_area` VALUES (365, 141082, 1410, '霍州市');
INSERT INTO `ums_area` VALUES (366, 1423, 14, '吕梁地区');
INSERT INTO `ums_area` VALUES (367, 142301, 1423, '孝义市');
INSERT INTO `ums_area` VALUES (368, 142302, 1423, '离石市');
INSERT INTO `ums_area` VALUES (369, 142303, 1423, '汾阳市');
INSERT INTO `ums_area` VALUES (370, 142322, 1423, '文水县');
INSERT INTO `ums_area` VALUES (371, 142323, 1423, '交城县');
INSERT INTO `ums_area` VALUES (372, 142325, 1423, '兴 县');
INSERT INTO `ums_area` VALUES (373, 142326, 1423, '临 县');
INSERT INTO `ums_area` VALUES (374, 142327, 1423, '柳林县');
INSERT INTO `ums_area` VALUES (375, 142328, 1423, '石楼县');
INSERT INTO `ums_area` VALUES (376, 142329, 1423, '岚 县');
INSERT INTO `ums_area` VALUES (377, 142330, 1423, '方山县');
INSERT INTO `ums_area` VALUES (378, 142332, 1423, '中阳县');
INSERT INTO `ums_area` VALUES (379, 142333, 1423, '交口县');
INSERT INTO `ums_area` VALUES (380, 15, 0, '内蒙古');
INSERT INTO `ums_area` VALUES (381, 1501, 15, '呼和浩特');
INSERT INTO `ums_area` VALUES (382, 150101, 1501, '市辖区');
INSERT INTO `ums_area` VALUES (383, 150102, 1501, '新城区');
INSERT INTO `ums_area` VALUES (384, 150103, 1501, '回民区');
INSERT INTO `ums_area` VALUES (385, 150104, 1501, '玉泉区');
INSERT INTO `ums_area` VALUES (386, 150105, 1501, '赛罕区');
INSERT INTO `ums_area` VALUES (387, 150121, 1501, '土默特左旗');
INSERT INTO `ums_area` VALUES (388, 150122, 1501, '托克托县');
INSERT INTO `ums_area` VALUES (389, 150123, 1501, '和林格尔县');
INSERT INTO `ums_area` VALUES (390, 150124, 1501, '清水河县');
INSERT INTO `ums_area` VALUES (391, 150125, 1501, '武川县');
INSERT INTO `ums_area` VALUES (392, 1502, 15, '包头');
INSERT INTO `ums_area` VALUES (393, 150201, 1502, '市辖区');
INSERT INTO `ums_area` VALUES (394, 150202, 1502, '东河区');
INSERT INTO `ums_area` VALUES (395, 150203, 1502, '昆都伦区');
INSERT INTO `ums_area` VALUES (396, 150204, 1502, '青山区');
INSERT INTO `ums_area` VALUES (397, 150205, 1502, '石拐区');
INSERT INTO `ums_area` VALUES (398, 150206, 1502, '白云矿区');
INSERT INTO `ums_area` VALUES (399, 150207, 1502, '九原区');
INSERT INTO `ums_area` VALUES (400, 150221, 1502, '土默特右旗');
INSERT INTO `ums_area` VALUES (401, 150222, 1502, '固阳县');
INSERT INTO `ums_area` VALUES (402, 150223, 1502, '达尔罕茂明安联合旗');
INSERT INTO `ums_area` VALUES (403, 1503, 15, '乌海');
INSERT INTO `ums_area` VALUES (404, 150301, 1503, '市辖区');
INSERT INTO `ums_area` VALUES (405, 150302, 1503, '海勃湾区');
INSERT INTO `ums_area` VALUES (406, 150303, 1503, '海南区');
INSERT INTO `ums_area` VALUES (407, 150304, 1503, '乌达区');
INSERT INTO `ums_area` VALUES (408, 1504, 15, '赤峰');
INSERT INTO `ums_area` VALUES (409, 150401, 1504, '市辖区');
INSERT INTO `ums_area` VALUES (410, 150402, 1504, '红山区');
INSERT INTO `ums_area` VALUES (411, 150403, 1504, '元宝山区');
INSERT INTO `ums_area` VALUES (412, 150404, 1504, '松山区');
INSERT INTO `ums_area` VALUES (413, 150421, 1504, '阿鲁科尔沁旗');
INSERT INTO `ums_area` VALUES (414, 150422, 1504, '巴林左旗');
INSERT INTO `ums_area` VALUES (415, 150423, 1504, '巴林右旗');
INSERT INTO `ums_area` VALUES (416, 150424, 1504, '林西县');
INSERT INTO `ums_area` VALUES (417, 150425, 1504, '克什克腾旗');
INSERT INTO `ums_area` VALUES (418, 150426, 1504, '翁牛特旗');
INSERT INTO `ums_area` VALUES (419, 150428, 1504, '喀喇沁旗');
INSERT INTO `ums_area` VALUES (420, 150429, 1504, '宁城县');
INSERT INTO `ums_area` VALUES (421, 150430, 1504, '敖汉旗');
INSERT INTO `ums_area` VALUES (422, 1505, 15, '通辽');
INSERT INTO `ums_area` VALUES (423, 150501, 1505, '市辖区');
INSERT INTO `ums_area` VALUES (424, 150502, 1505, '科尔沁区');
INSERT INTO `ums_area` VALUES (425, 150521, 1505, '科尔沁左翼中旗');
INSERT INTO `ums_area` VALUES (426, 150522, 1505, '科尔沁左翼后旗');
INSERT INTO `ums_area` VALUES (427, 150523, 1505, '开鲁县');
INSERT INTO `ums_area` VALUES (428, 150524, 1505, '库伦旗');
INSERT INTO `ums_area` VALUES (429, 150525, 1505, '奈曼旗');
INSERT INTO `ums_area` VALUES (430, 150526, 1505, '扎鲁特旗');
INSERT INTO `ums_area` VALUES (431, 150581, 1505, '霍林郭勒市');
INSERT INTO `ums_area` VALUES (432, 1521, 15, '呼伦贝尔盟');
INSERT INTO `ums_area` VALUES (433, 152101, 1521, '海拉尔市');
INSERT INTO `ums_area` VALUES (434, 152102, 1521, '满洲里市');
INSERT INTO `ums_area` VALUES (435, 152103, 1521, '扎兰屯市');
INSERT INTO `ums_area` VALUES (436, 152104, 1521, '牙克石市');
INSERT INTO `ums_area` VALUES (437, 152105, 1521, '根河市');
INSERT INTO `ums_area` VALUES (438, 152106, 1521, '额尔古纳市');
INSERT INTO `ums_area` VALUES (439, 152122, 1521, '阿荣旗');
INSERT INTO `ums_area` VALUES (440, 152123, 1521, '莫力达瓦达斡尔族自治');
INSERT INTO `ums_area` VALUES (441, 152127, 1521, '鄂伦春自治旗');
INSERT INTO `ums_area` VALUES (442, 152128, 1521, '鄂温克族自治旗');
INSERT INTO `ums_area` VALUES (443, 152129, 1521, '新巴尔虎右旗');
INSERT INTO `ums_area` VALUES (444, 152130, 1521, '新巴尔虎左旗');
INSERT INTO `ums_area` VALUES (445, 152131, 1521, '陈巴尔虎旗');
INSERT INTO `ums_area` VALUES (446, 1522, 15, '兴安盟');
INSERT INTO `ums_area` VALUES (447, 152201, 1522, '乌兰浩特市');
INSERT INTO `ums_area` VALUES (448, 152202, 1522, '阿尔山市');
INSERT INTO `ums_area` VALUES (449, 152221, 1522, '科尔沁右翼前旗');
INSERT INTO `ums_area` VALUES (450, 152222, 1522, '科尔沁右翼中旗');
INSERT INTO `ums_area` VALUES (451, 152223, 1522, '扎赉特旗');
INSERT INTO `ums_area` VALUES (452, 152224, 1522, '突泉县');
INSERT INTO `ums_area` VALUES (453, 1525, 15, '锡林郭勒盟');
INSERT INTO `ums_area` VALUES (454, 152501, 1525, '二连浩特市');
INSERT INTO `ums_area` VALUES (455, 152502, 1525, '锡林浩特市');
INSERT INTO `ums_area` VALUES (456, 152522, 1525, '阿巴嘎旗');
INSERT INTO `ums_area` VALUES (457, 152523, 1525, '苏尼特左旗');
INSERT INTO `ums_area` VALUES (458, 152524, 1525, '苏尼特右旗');
INSERT INTO `ums_area` VALUES (459, 152525, 1525, '东乌珠穆沁旗');
INSERT INTO `ums_area` VALUES (460, 152526, 1525, '西乌珠穆沁旗');
INSERT INTO `ums_area` VALUES (461, 152527, 1525, '太仆寺旗');
INSERT INTO `ums_area` VALUES (462, 152528, 1525, '镶黄旗');
INSERT INTO `ums_area` VALUES (463, 152529, 1525, '正镶白旗');
INSERT INTO `ums_area` VALUES (464, 152530, 1525, '正蓝旗');
INSERT INTO `ums_area` VALUES (465, 152531, 1525, '多伦县');
INSERT INTO `ums_area` VALUES (466, 1526, 15, '乌兰察布盟');
INSERT INTO `ums_area` VALUES (467, 152601, 1526, '集宁市');
INSERT INTO `ums_area` VALUES (468, 152602, 1526, '丰镇市');
INSERT INTO `ums_area` VALUES (469, 152624, 1526, '卓资县');
INSERT INTO `ums_area` VALUES (470, 152625, 1526, '化德县');
INSERT INTO `ums_area` VALUES (471, 152626, 1526, '商都县');
INSERT INTO `ums_area` VALUES (472, 152627, 1526, '兴和县');
INSERT INTO `ums_area` VALUES (473, 152629, 1526, '凉城县');
INSERT INTO `ums_area` VALUES (474, 152630, 1526, '察哈尔右翼前旗');
INSERT INTO `ums_area` VALUES (475, 152631, 1526, '察哈尔右翼中旗');
INSERT INTO `ums_area` VALUES (476, 152632, 1526, '察哈尔右翼后旗');
INSERT INTO `ums_area` VALUES (477, 152634, 1526, '四子王旗');
INSERT INTO `ums_area` VALUES (478, 1527, 15, '伊克昭盟');
INSERT INTO `ums_area` VALUES (479, 152701, 1527, '东胜市');
INSERT INTO `ums_area` VALUES (480, 152722, 1527, '达拉特旗');
INSERT INTO `ums_area` VALUES (481, 152723, 1527, '准格尔旗');
INSERT INTO `ums_area` VALUES (482, 152724, 1527, '鄂托克前旗');
INSERT INTO `ums_area` VALUES (483, 152725, 1527, '鄂托克旗');
INSERT INTO `ums_area` VALUES (484, 152726, 1527, '杭锦旗');
INSERT INTO `ums_area` VALUES (485, 152727, 1527, '乌审旗');
INSERT INTO `ums_area` VALUES (486, 152728, 1527, '伊金霍洛旗');
INSERT INTO `ums_area` VALUES (487, 1528, 15, '巴彦淖尔盟');
INSERT INTO `ums_area` VALUES (488, 152801, 1528, '临河市');
INSERT INTO `ums_area` VALUES (489, 152822, 1528, '五原县');
INSERT INTO `ums_area` VALUES (490, 152823, 1528, '磴口县');
INSERT INTO `ums_area` VALUES (491, 152824, 1528, '乌拉特前旗');
INSERT INTO `ums_area` VALUES (492, 152825, 1528, '乌拉特中旗');
INSERT INTO `ums_area` VALUES (493, 152826, 1528, '乌拉特后旗');
INSERT INTO `ums_area` VALUES (494, 152827, 1528, '杭锦后旗');
INSERT INTO `ums_area` VALUES (495, 1529, 15, '阿拉善盟');
INSERT INTO `ums_area` VALUES (496, 152921, 1529, '阿拉善左旗');
INSERT INTO `ums_area` VALUES (497, 152922, 1529, '阿拉善右旗');
INSERT INTO `ums_area` VALUES (498, 152923, 1529, '额济纳旗');
INSERT INTO `ums_area` VALUES (499, 21, 0, '辽宁');
INSERT INTO `ums_area` VALUES (500, 2101, 21, '沈阳');
INSERT INTO `ums_area` VALUES (501, 210101, 2101, '市辖区');
INSERT INTO `ums_area` VALUES (502, 210102, 2101, '和平区');
INSERT INTO `ums_area` VALUES (503, 210103, 2101, '沈河区');
INSERT INTO `ums_area` VALUES (504, 210104, 2101, '大东区');
INSERT INTO `ums_area` VALUES (505, 210105, 2101, '皇姑区');
INSERT INTO `ums_area` VALUES (506, 210106, 2101, '铁西区');
INSERT INTO `ums_area` VALUES (507, 210111, 2101, '苏家屯区');
INSERT INTO `ums_area` VALUES (508, 210112, 2101, '东陵区');
INSERT INTO `ums_area` VALUES (509, 210113, 2101, '新城子区');
INSERT INTO `ums_area` VALUES (510, 210114, 2101, '于洪区');
INSERT INTO `ums_area` VALUES (511, 210122, 2101, '辽中县');
INSERT INTO `ums_area` VALUES (512, 210123, 2101, '康平县');
INSERT INTO `ums_area` VALUES (513, 210124, 2101, '法库县');
INSERT INTO `ums_area` VALUES (514, 210181, 2101, '新民市');
INSERT INTO `ums_area` VALUES (515, 2102, 21, '大连');
INSERT INTO `ums_area` VALUES (516, 210201, 2102, '市辖区');
INSERT INTO `ums_area` VALUES (517, 210202, 2102, '中山区');
INSERT INTO `ums_area` VALUES (518, 210203, 2102, '西岗区');
INSERT INTO `ums_area` VALUES (519, 210204, 2102, '沙河口区');
INSERT INTO `ums_area` VALUES (520, 210211, 2102, '甘井子区');
INSERT INTO `ums_area` VALUES (521, 210212, 2102, '旅顺口区');
INSERT INTO `ums_area` VALUES (522, 210213, 2102, '金州区');
INSERT INTO `ums_area` VALUES (523, 210224, 2102, '长海县');
INSERT INTO `ums_area` VALUES (524, 210281, 2102, '瓦房店市');
INSERT INTO `ums_area` VALUES (525, 210282, 2102, '普兰店市');
INSERT INTO `ums_area` VALUES (526, 210283, 2102, '庄河市');
INSERT INTO `ums_area` VALUES (527, 2103, 21, '鞍山');
INSERT INTO `ums_area` VALUES (528, 210301, 2103, '市辖区');
INSERT INTO `ums_area` VALUES (529, 210302, 2103, '铁东区');
INSERT INTO `ums_area` VALUES (530, 210303, 2103, '铁西区');
INSERT INTO `ums_area` VALUES (531, 210304, 2103, '立山区');
INSERT INTO `ums_area` VALUES (532, 210311, 2103, '千山区');
INSERT INTO `ums_area` VALUES (533, 210321, 2103, '台安县');
INSERT INTO `ums_area` VALUES (534, 210323, 2103, '岫岩满族自治县');
INSERT INTO `ums_area` VALUES (535, 210381, 2103, '海城市');
INSERT INTO `ums_area` VALUES (536, 2104, 21, '抚顺');
INSERT INTO `ums_area` VALUES (537, 210401, 2104, '市辖区');
INSERT INTO `ums_area` VALUES (538, 210402, 2104, '新抚区');
INSERT INTO `ums_area` VALUES (539, 210403, 2104, '东洲区');
INSERT INTO `ums_area` VALUES (540, 210404, 2104, '望花区');
INSERT INTO `ums_area` VALUES (541, 210411, 2104, '顺城区');
INSERT INTO `ums_area` VALUES (542, 210421, 2104, '抚顺县');
INSERT INTO `ums_area` VALUES (543, 210422, 2104, '新宾满族自治县');
INSERT INTO `ums_area` VALUES (544, 210423, 2104, '清原满族自治县');
INSERT INTO `ums_area` VALUES (545, 2105, 21, '本溪');
INSERT INTO `ums_area` VALUES (546, 210501, 2105, '市辖区');
INSERT INTO `ums_area` VALUES (547, 210502, 2105, '平山区');
INSERT INTO `ums_area` VALUES (548, 210503, 2105, '溪湖区');
INSERT INTO `ums_area` VALUES (549, 210504, 2105, '明山区');
INSERT INTO `ums_area` VALUES (550, 210505, 2105, '南芬区');
INSERT INTO `ums_area` VALUES (551, 210521, 2105, '本溪满族自治县');
INSERT INTO `ums_area` VALUES (552, 210522, 2105, '桓仁满族自治县');
INSERT INTO `ums_area` VALUES (553, 2106, 21, '丹东');
INSERT INTO `ums_area` VALUES (554, 210601, 2106, '市辖区');
INSERT INTO `ums_area` VALUES (555, 210602, 2106, '元宝区');
INSERT INTO `ums_area` VALUES (556, 210603, 2106, '振兴区');
INSERT INTO `ums_area` VALUES (557, 210604, 2106, '振安区');
INSERT INTO `ums_area` VALUES (558, 210624, 2106, '宽甸满族自治县');
INSERT INTO `ums_area` VALUES (559, 210681, 2106, '东港市');
INSERT INTO `ums_area` VALUES (560, 210682, 2106, '凤城市');
INSERT INTO `ums_area` VALUES (561, 2107, 21, '锦州');
INSERT INTO `ums_area` VALUES (562, 210701, 2107, '市辖区');
INSERT INTO `ums_area` VALUES (563, 210702, 2107, '古塔区');
INSERT INTO `ums_area` VALUES (564, 210703, 2107, '凌河区');
INSERT INTO `ums_area` VALUES (565, 210711, 2107, '太和区');
INSERT INTO `ums_area` VALUES (566, 210726, 2107, '黑山县');
INSERT INTO `ums_area` VALUES (567, 210727, 2107, '义 县');
INSERT INTO `ums_area` VALUES (568, 210781, 2107, '凌海市');
INSERT INTO `ums_area` VALUES (569, 210782, 2107, '北宁市');
INSERT INTO `ums_area` VALUES (570, 2108, 21, '营口');
INSERT INTO `ums_area` VALUES (571, 210801, 2108, '市辖区');
INSERT INTO `ums_area` VALUES (572, 210802, 2108, '站前区');
INSERT INTO `ums_area` VALUES (573, 210803, 2108, '西市区');
INSERT INTO `ums_area` VALUES (574, 210804, 2108, '鲅鱼圈区');
INSERT INTO `ums_area` VALUES (575, 210811, 2108, '老边区');
INSERT INTO `ums_area` VALUES (576, 210881, 2108, '盖州市');
INSERT INTO `ums_area` VALUES (577, 210882, 2108, '大石桥市');
INSERT INTO `ums_area` VALUES (578, 2109, 21, '阜新');
INSERT INTO `ums_area` VALUES (579, 210901, 2109, '市辖区');
INSERT INTO `ums_area` VALUES (580, 210902, 2109, '海州区');
INSERT INTO `ums_area` VALUES (581, 210903, 2109, '新邱区');
INSERT INTO `ums_area` VALUES (582, 210904, 2109, '太平区');
INSERT INTO `ums_area` VALUES (583, 210905, 2109, '清河门区');
INSERT INTO `ums_area` VALUES (584, 210911, 2109, '细河区');
INSERT INTO `ums_area` VALUES (585, 210921, 2109, '阜新蒙古族自治县');
INSERT INTO `ums_area` VALUES (586, 210922, 2109, '彰武县');
INSERT INTO `ums_area` VALUES (587, 2110, 21, '辽阳');
INSERT INTO `ums_area` VALUES (588, 211001, 2110, '市辖区');
INSERT INTO `ums_area` VALUES (589, 211002, 2110, '白塔区');
INSERT INTO `ums_area` VALUES (590, 211003, 2110, '文圣区');
INSERT INTO `ums_area` VALUES (591, 211004, 2110, '宏伟区');
INSERT INTO `ums_area` VALUES (592, 211005, 2110, '弓长岭区');
INSERT INTO `ums_area` VALUES (593, 211011, 2110, '太子河区');
INSERT INTO `ums_area` VALUES (594, 211021, 2110, '辽阳县');
INSERT INTO `ums_area` VALUES (595, 211081, 2110, '灯塔市');
INSERT INTO `ums_area` VALUES (596, 2111, 21, '盘锦');
INSERT INTO `ums_area` VALUES (597, 211101, 2111, '市辖区');
INSERT INTO `ums_area` VALUES (598, 211102, 2111, '双台子区');
INSERT INTO `ums_area` VALUES (599, 211103, 2111, '兴隆台区');
INSERT INTO `ums_area` VALUES (600, 211121, 2111, '大洼县');
INSERT INTO `ums_area` VALUES (601, 211122, 2111, '盘山县');
INSERT INTO `ums_area` VALUES (602, 2112, 21, '铁岭');
INSERT INTO `ums_area` VALUES (603, 211201, 2112, '市辖区');
INSERT INTO `ums_area` VALUES (604, 211202, 2112, '银州区');
INSERT INTO `ums_area` VALUES (605, 211204, 2112, '清河区');
INSERT INTO `ums_area` VALUES (606, 211221, 2112, '铁岭县');
INSERT INTO `ums_area` VALUES (607, 211223, 2112, '西丰县');
INSERT INTO `ums_area` VALUES (608, 211224, 2112, '昌图县');
INSERT INTO `ums_area` VALUES (609, 211281, 2112, '铁法市');
INSERT INTO `ums_area` VALUES (610, 211282, 2112, '开原市');
INSERT INTO `ums_area` VALUES (611, 2113, 21, '朝阳');
INSERT INTO `ums_area` VALUES (612, 211301, 2113, '市辖区');
INSERT INTO `ums_area` VALUES (613, 211302, 2113, '双塔区');
INSERT INTO `ums_area` VALUES (614, 211303, 2113, '龙城区');
INSERT INTO `ums_area` VALUES (615, 211321, 2113, '朝阳县');
INSERT INTO `ums_area` VALUES (616, 211322, 2113, '建平县');
INSERT INTO `ums_area` VALUES (617, 211324, 2113, '喀喇沁左翼蒙古族自治');
INSERT INTO `ums_area` VALUES (618, 211381, 2113, '北票市');
INSERT INTO `ums_area` VALUES (619, 211382, 2113, '凌源市');
INSERT INTO `ums_area` VALUES (620, 2114, 21, '葫芦岛');
INSERT INTO `ums_area` VALUES (621, 211401, 2114, '市辖区');
INSERT INTO `ums_area` VALUES (622, 211402, 2114, '连山区');
INSERT INTO `ums_area` VALUES (623, 211403, 2114, '龙港区');
INSERT INTO `ums_area` VALUES (624, 211404, 2114, '南票区');
INSERT INTO `ums_area` VALUES (625, 211421, 2114, '绥中县');
INSERT INTO `ums_area` VALUES (626, 211422, 2114, '建昌县');
INSERT INTO `ums_area` VALUES (627, 211481, 2114, '兴城市');
INSERT INTO `ums_area` VALUES (628, 22, 0, '吉林');
INSERT INTO `ums_area` VALUES (629, 2201, 22, '长春');
INSERT INTO `ums_area` VALUES (630, 220101, 2201, '市辖区');
INSERT INTO `ums_area` VALUES (631, 220102, 2201, '南关区');
INSERT INTO `ums_area` VALUES (632, 220103, 2201, '宽城区');
INSERT INTO `ums_area` VALUES (633, 220104, 2201, '朝阳区');
INSERT INTO `ums_area` VALUES (634, 220105, 2201, '二道区');
INSERT INTO `ums_area` VALUES (635, 220106, 2201, '绿园区');
INSERT INTO `ums_area` VALUES (636, 220112, 2201, '双阳区');
INSERT INTO `ums_area` VALUES (637, 220122, 2201, '农安县');
INSERT INTO `ums_area` VALUES (638, 220181, 2201, '九台市');
INSERT INTO `ums_area` VALUES (639, 220182, 2201, '榆树市');
INSERT INTO `ums_area` VALUES (640, 220183, 2201, '德惠市');
INSERT INTO `ums_area` VALUES (641, 2202, 22, '吉林');
INSERT INTO `ums_area` VALUES (642, 220201, 2202, '市辖区');
INSERT INTO `ums_area` VALUES (643, 220202, 2202, '昌邑区');
INSERT INTO `ums_area` VALUES (644, 220203, 2202, '龙潭区');
INSERT INTO `ums_area` VALUES (645, 220204, 2202, '船营区');
INSERT INTO `ums_area` VALUES (646, 220211, 2202, '丰满区');
INSERT INTO `ums_area` VALUES (647, 220221, 2202, '永吉县');
INSERT INTO `ums_area` VALUES (648, 220281, 2202, '蛟河市');
INSERT INTO `ums_area` VALUES (649, 220282, 2202, '桦甸市');
INSERT INTO `ums_area` VALUES (650, 220283, 2202, '舒兰市');
INSERT INTO `ums_area` VALUES (651, 220284, 2202, '磐石市');
INSERT INTO `ums_area` VALUES (652, 2203, 22, '四平');
INSERT INTO `ums_area` VALUES (653, 220301, 2203, '市辖区');
INSERT INTO `ums_area` VALUES (654, 220302, 2203, '铁西区');
INSERT INTO `ums_area` VALUES (655, 220303, 2203, '铁东区');
INSERT INTO `ums_area` VALUES (656, 220322, 2203, '梨树县');
INSERT INTO `ums_area` VALUES (657, 220323, 2203, '伊通满族自治县');
INSERT INTO `ums_area` VALUES (658, 220381, 2203, '公主岭市');
INSERT INTO `ums_area` VALUES (659, 220382, 2203, '双辽市');
INSERT INTO `ums_area` VALUES (660, 2204, 22, '辽源');
INSERT INTO `ums_area` VALUES (661, 220401, 2204, '市辖区');
INSERT INTO `ums_area` VALUES (662, 220402, 2204, '龙山区');
INSERT INTO `ums_area` VALUES (663, 220403, 2204, '西安区');
INSERT INTO `ums_area` VALUES (664, 220421, 2204, '东丰县');
INSERT INTO `ums_area` VALUES (665, 220422, 2204, '东辽县');
INSERT INTO `ums_area` VALUES (666, 2205, 22, '通化');
INSERT INTO `ums_area` VALUES (667, 220501, 2205, '市辖区');
INSERT INTO `ums_area` VALUES (668, 220502, 2205, '东昌区');
INSERT INTO `ums_area` VALUES (669, 220503, 2205, '二道江区');
INSERT INTO `ums_area` VALUES (670, 220521, 2205, '通化县');
INSERT INTO `ums_area` VALUES (671, 220523, 2205, '辉南县');
INSERT INTO `ums_area` VALUES (672, 220524, 2205, '柳河县');
INSERT INTO `ums_area` VALUES (673, 220581, 2205, '梅河口市');
INSERT INTO `ums_area` VALUES (674, 220582, 2205, '集安市');
INSERT INTO `ums_area` VALUES (675, 2206, 22, '白山');
INSERT INTO `ums_area` VALUES (676, 220601, 2206, '市辖区');
INSERT INTO `ums_area` VALUES (677, 220602, 2206, '八道江区');
INSERT INTO `ums_area` VALUES (678, 220621, 2206, '抚松县');
INSERT INTO `ums_area` VALUES (679, 220622, 2206, '靖宇县');
INSERT INTO `ums_area` VALUES (680, 220623, 2206, '长白朝鲜族自治县');
INSERT INTO `ums_area` VALUES (681, 220625, 2206, '江源县');
INSERT INTO `ums_area` VALUES (682, 220681, 2206, '临江市');
INSERT INTO `ums_area` VALUES (683, 2207, 22, '松原');
INSERT INTO `ums_area` VALUES (684, 220701, 2207, '市辖区');
INSERT INTO `ums_area` VALUES (685, 220702, 2207, '宁江区');
INSERT INTO `ums_area` VALUES (686, 220721, 2207, '前郭尔罗斯蒙古族自治');
INSERT INTO `ums_area` VALUES (687, 220722, 2207, '长岭县');
INSERT INTO `ums_area` VALUES (688, 220723, 2207, '乾安县');
INSERT INTO `ums_area` VALUES (689, 220724, 2207, '扶余县');
INSERT INTO `ums_area` VALUES (690, 2208, 22, '白城');
INSERT INTO `ums_area` VALUES (691, 220801, 2208, '市辖区');
INSERT INTO `ums_area` VALUES (692, 220802, 2208, '洮北区');
INSERT INTO `ums_area` VALUES (693, 220821, 2208, '镇赉县');
INSERT INTO `ums_area` VALUES (694, 220822, 2208, '通榆县');
INSERT INTO `ums_area` VALUES (695, 220881, 2208, '洮南市');
INSERT INTO `ums_area` VALUES (696, 220882, 2208, '大安市');
INSERT INTO `ums_area` VALUES (697, 2224, 22, '延边朝鲜族自治州');
INSERT INTO `ums_area` VALUES (698, 222401, 2224, '延吉市');
INSERT INTO `ums_area` VALUES (699, 222402, 2224, '图们市');
INSERT INTO `ums_area` VALUES (700, 222403, 2224, '敦化市');
INSERT INTO `ums_area` VALUES (701, 222404, 2224, '珲春市');
INSERT INTO `ums_area` VALUES (702, 222405, 2224, '龙井市');
INSERT INTO `ums_area` VALUES (703, 222406, 2224, '和龙市');
INSERT INTO `ums_area` VALUES (704, 222424, 2224, '汪清县');
INSERT INTO `ums_area` VALUES (705, 222426, 2224, '安图县');
INSERT INTO `ums_area` VALUES (706, 23, 0, '黑龙江');
INSERT INTO `ums_area` VALUES (707, 2301, 23, '哈尔滨');
INSERT INTO `ums_area` VALUES (708, 230101, 2301, '市辖区');
INSERT INTO `ums_area` VALUES (709, 230102, 2301, '道里区');
INSERT INTO `ums_area` VALUES (710, 230103, 2301, '南岗区');
INSERT INTO `ums_area` VALUES (711, 230104, 2301, '道外区');
INSERT INTO `ums_area` VALUES (712, 230105, 2301, '太平区');
INSERT INTO `ums_area` VALUES (713, 230106, 2301, '香坊区');
INSERT INTO `ums_area` VALUES (714, 230107, 2301, '动力区');
INSERT INTO `ums_area` VALUES (715, 230108, 2301, '平房区');
INSERT INTO `ums_area` VALUES (716, 230121, 2301, '呼兰县');
INSERT INTO `ums_area` VALUES (717, 230123, 2301, '依兰县');
INSERT INTO `ums_area` VALUES (718, 230124, 2301, '方正县');
INSERT INTO `ums_area` VALUES (719, 230125, 2301, '宾 县');
INSERT INTO `ums_area` VALUES (720, 230126, 2301, '巴彦县');
INSERT INTO `ums_area` VALUES (721, 230127, 2301, '木兰县');
INSERT INTO `ums_area` VALUES (722, 230128, 2301, '通河县');
INSERT INTO `ums_area` VALUES (723, 230129, 2301, '延寿县');
INSERT INTO `ums_area` VALUES (724, 230181, 2301, '阿城市');
INSERT INTO `ums_area` VALUES (725, 230182, 2301, '双城市');
INSERT INTO `ums_area` VALUES (726, 230183, 2301, '尚志市');
INSERT INTO `ums_area` VALUES (727, 230184, 2301, '五常市');
INSERT INTO `ums_area` VALUES (728, 2302, 23, '齐齐哈尔');
INSERT INTO `ums_area` VALUES (729, 230201, 2302, '市辖区');
INSERT INTO `ums_area` VALUES (730, 230202, 2302, '龙沙区');
INSERT INTO `ums_area` VALUES (731, 230203, 2302, '建华区');
INSERT INTO `ums_area` VALUES (732, 230204, 2302, '铁锋区');
INSERT INTO `ums_area` VALUES (733, 230205, 2302, '昂昂溪区');
INSERT INTO `ums_area` VALUES (734, 230206, 2302, '富拉尔基区');
INSERT INTO `ums_area` VALUES (735, 230207, 2302, '碾子山区');
INSERT INTO `ums_area` VALUES (736, 230208, 2302, '梅里斯达斡尔族区');
INSERT INTO `ums_area` VALUES (737, 230221, 2302, '龙江县');
INSERT INTO `ums_area` VALUES (738, 230223, 2302, '依安县');
INSERT INTO `ums_area` VALUES (739, 230224, 2302, '泰来县');
INSERT INTO `ums_area` VALUES (740, 230225, 2302, '甘南县');
INSERT INTO `ums_area` VALUES (741, 230227, 2302, '富裕县');
INSERT INTO `ums_area` VALUES (742, 230229, 2302, '克山县');
INSERT INTO `ums_area` VALUES (743, 230230, 2302, '克东县');
INSERT INTO `ums_area` VALUES (744, 230231, 2302, '拜泉县');
INSERT INTO `ums_area` VALUES (745, 230281, 2302, '讷河市');
INSERT INTO `ums_area` VALUES (746, 2303, 23, '鸡西');
INSERT INTO `ums_area` VALUES (747, 230301, 2303, '市辖区');
INSERT INTO `ums_area` VALUES (748, 230302, 2303, '鸡冠区');
INSERT INTO `ums_area` VALUES (749, 230303, 2303, '恒山区');
INSERT INTO `ums_area` VALUES (750, 230304, 2303, '滴道区');
INSERT INTO `ums_area` VALUES (751, 230305, 2303, '梨树区');
INSERT INTO `ums_area` VALUES (752, 230306, 2303, '城子河区');
INSERT INTO `ums_area` VALUES (753, 230307, 2303, '麻山区');
INSERT INTO `ums_area` VALUES (754, 230321, 2303, '鸡东县');
INSERT INTO `ums_area` VALUES (755, 230381, 2303, '虎林市');
INSERT INTO `ums_area` VALUES (756, 230382, 2303, '密山市');
INSERT INTO `ums_area` VALUES (757, 2304, 23, '鹤岗');
INSERT INTO `ums_area` VALUES (758, 230401, 2304, '市辖区');
INSERT INTO `ums_area` VALUES (759, 230402, 2304, '向阳区');
INSERT INTO `ums_area` VALUES (760, 230403, 2304, '工农区');
INSERT INTO `ums_area` VALUES (761, 230404, 2304, '南山区');
INSERT INTO `ums_area` VALUES (762, 230405, 2304, '兴安区');
INSERT INTO `ums_area` VALUES (763, 230406, 2304, '东山区');
INSERT INTO `ums_area` VALUES (764, 230407, 2304, '兴山区');
INSERT INTO `ums_area` VALUES (765, 230421, 2304, '萝北县');
INSERT INTO `ums_area` VALUES (766, 230422, 2304, '绥滨县');
INSERT INTO `ums_area` VALUES (767, 2305, 23, '双鸭山');
INSERT INTO `ums_area` VALUES (768, 230501, 2305, '市辖区');
INSERT INTO `ums_area` VALUES (769, 230502, 2305, '尖山区');
INSERT INTO `ums_area` VALUES (770, 230503, 2305, '岭东区');
INSERT INTO `ums_area` VALUES (771, 230505, 2305, '四方台区');
INSERT INTO `ums_area` VALUES (772, 230506, 2305, '宝山区');
INSERT INTO `ums_area` VALUES (773, 230521, 2305, '集贤县');
INSERT INTO `ums_area` VALUES (774, 230522, 2305, '友谊县');
INSERT INTO `ums_area` VALUES (775, 230523, 2305, '宝清县');
INSERT INTO `ums_area` VALUES (776, 230524, 2305, '饶河县');
INSERT INTO `ums_area` VALUES (777, 2306, 23, '大庆');
INSERT INTO `ums_area` VALUES (778, 230601, 2306, '市辖区');
INSERT INTO `ums_area` VALUES (779, 230602, 2306, '萨尔图区');
INSERT INTO `ums_area` VALUES (780, 230603, 2306, '龙凤区');
INSERT INTO `ums_area` VALUES (781, 230604, 2306, '让胡路区');
INSERT INTO `ums_area` VALUES (782, 230605, 2306, '红岗区');
INSERT INTO `ums_area` VALUES (783, 230606, 2306, '大同区');
INSERT INTO `ums_area` VALUES (784, 230621, 2306, '肇州县');
INSERT INTO `ums_area` VALUES (785, 230622, 2306, '肇源县');
INSERT INTO `ums_area` VALUES (786, 230623, 2306, '林甸县');
INSERT INTO `ums_area` VALUES (787, 230624, 2306, '杜尔伯特蒙古族自治县');
INSERT INTO `ums_area` VALUES (788, 2307, 23, '伊春');
INSERT INTO `ums_area` VALUES (789, 230701, 2307, '市辖区');
INSERT INTO `ums_area` VALUES (790, 230702, 2307, '伊春区');
INSERT INTO `ums_area` VALUES (791, 230703, 2307, '南岔区');
INSERT INTO `ums_area` VALUES (792, 230704, 2307, '友好区');
INSERT INTO `ums_area` VALUES (793, 230705, 2307, '西林区');
INSERT INTO `ums_area` VALUES (794, 230706, 2307, '翠峦区');
INSERT INTO `ums_area` VALUES (795, 230707, 2307, '新青区');
INSERT INTO `ums_area` VALUES (796, 230708, 2307, '美溪区');
INSERT INTO `ums_area` VALUES (797, 230709, 2307, '金山屯区');
INSERT INTO `ums_area` VALUES (798, 230710, 2307, '五营区');
INSERT INTO `ums_area` VALUES (799, 230711, 2307, '乌马河区');
INSERT INTO `ums_area` VALUES (800, 230712, 2307, '汤旺河区');
INSERT INTO `ums_area` VALUES (801, 230713, 2307, '带岭区');
INSERT INTO `ums_area` VALUES (802, 230714, 2307, '乌伊岭区');
INSERT INTO `ums_area` VALUES (803, 230715, 2307, '红星区');
INSERT INTO `ums_area` VALUES (804, 230716, 2307, '上甘岭区');
INSERT INTO `ums_area` VALUES (805, 230722, 2307, '嘉荫县');
INSERT INTO `ums_area` VALUES (806, 230781, 2307, '铁力市');
INSERT INTO `ums_area` VALUES (807, 2308, 23, '佳木斯');
INSERT INTO `ums_area` VALUES (808, 230801, 2308, '市辖区');
INSERT INTO `ums_area` VALUES (809, 230802, 2308, '永红区');
INSERT INTO `ums_area` VALUES (810, 230803, 2308, '向阳区');
INSERT INTO `ums_area` VALUES (811, 230804, 2308, '前进区');
INSERT INTO `ums_area` VALUES (812, 230805, 2308, '东风区');
INSERT INTO `ums_area` VALUES (813, 230811, 2308, '郊 区');
INSERT INTO `ums_area` VALUES (814, 230822, 2308, '桦南县');
INSERT INTO `ums_area` VALUES (815, 230826, 2308, '桦川县');
INSERT INTO `ums_area` VALUES (816, 230828, 2308, '汤原县');
INSERT INTO `ums_area` VALUES (817, 230833, 2308, '抚远县');
INSERT INTO `ums_area` VALUES (818, 230881, 2308, '同江市');
INSERT INTO `ums_area` VALUES (819, 230882, 2308, '富锦市');
INSERT INTO `ums_area` VALUES (820, 2309, 23, '七台河');
INSERT INTO `ums_area` VALUES (821, 230901, 2309, '市辖区');
INSERT INTO `ums_area` VALUES (822, 230902, 2309, '新兴区');
INSERT INTO `ums_area` VALUES (823, 230903, 2309, '桃山区');
INSERT INTO `ums_area` VALUES (824, 230904, 2309, '茄子河区');
INSERT INTO `ums_area` VALUES (825, 230921, 2309, '勃利县');
INSERT INTO `ums_area` VALUES (826, 2310, 23, '牡丹江');
INSERT INTO `ums_area` VALUES (827, 231001, 2310, '市辖区');
INSERT INTO `ums_area` VALUES (828, 231002, 2310, '东安区');
INSERT INTO `ums_area` VALUES (829, 231003, 2310, '阳明区');
INSERT INTO `ums_area` VALUES (830, 231004, 2310, '爱民区');
INSERT INTO `ums_area` VALUES (831, 231005, 2310, '西安区');
INSERT INTO `ums_area` VALUES (832, 231024, 2310, '东宁县');
INSERT INTO `ums_area` VALUES (833, 231025, 2310, '林口县');
INSERT INTO `ums_area` VALUES (834, 231081, 2310, '绥芬河市');
INSERT INTO `ums_area` VALUES (835, 231083, 2310, '海林市');
INSERT INTO `ums_area` VALUES (836, 231084, 2310, '宁安市');
INSERT INTO `ums_area` VALUES (837, 231085, 2310, '穆棱市');
INSERT INTO `ums_area` VALUES (838, 2311, 23, '黑河');
INSERT INTO `ums_area` VALUES (839, 231101, 2311, '市辖区');
INSERT INTO `ums_area` VALUES (840, 231102, 2311, '爱辉区');
INSERT INTO `ums_area` VALUES (841, 231121, 2311, '嫩江县');
INSERT INTO `ums_area` VALUES (842, 231123, 2311, '逊克县');
INSERT INTO `ums_area` VALUES (843, 231124, 2311, '孙吴县');
INSERT INTO `ums_area` VALUES (844, 231181, 2311, '北安市');
INSERT INTO `ums_area` VALUES (845, 231182, 2311, '五大连池市');
INSERT INTO `ums_area` VALUES (846, 2312, 23, '绥化');
INSERT INTO `ums_area` VALUES (847, 231201, 2312, '市辖区');
INSERT INTO `ums_area` VALUES (848, 231202, 2312, '北林区');
INSERT INTO `ums_area` VALUES (849, 231221, 2312, '望奎县');
INSERT INTO `ums_area` VALUES (850, 231222, 2312, '兰西县');
INSERT INTO `ums_area` VALUES (851, 231223, 2312, '青冈县');
INSERT INTO `ums_area` VALUES (852, 231224, 2312, '庆安县');
INSERT INTO `ums_area` VALUES (853, 231225, 2312, '明水县');
INSERT INTO `ums_area` VALUES (854, 231226, 2312, '绥棱县');
INSERT INTO `ums_area` VALUES (855, 231281, 2312, '安达市');
INSERT INTO `ums_area` VALUES (856, 231282, 2312, '肇东市');
INSERT INTO `ums_area` VALUES (857, 231283, 2312, '海伦市');
INSERT INTO `ums_area` VALUES (858, 2327, 23, '大兴安岭地区');
INSERT INTO `ums_area` VALUES (859, 232721, 2327, '呼玛县');
INSERT INTO `ums_area` VALUES (860, 232722, 2327, '塔河县');
INSERT INTO `ums_area` VALUES (861, 232723, 2327, '漠河县');
INSERT INTO `ums_area` VALUES (862, 31, 0, '上海');
INSERT INTO `ums_area` VALUES (863, 3101, 31, '上海市辖');
INSERT INTO `ums_area` VALUES (864, 310101, 3101, '黄浦区');
INSERT INTO `ums_area` VALUES (865, 310103, 3101, '卢湾区');
INSERT INTO `ums_area` VALUES (866, 310104, 3101, '徐汇区');
INSERT INTO `ums_area` VALUES (867, 310105, 3101, '长宁区');
INSERT INTO `ums_area` VALUES (868, 310106, 3101, '静安区');
INSERT INTO `ums_area` VALUES (869, 310107, 3101, '普陀区');
INSERT INTO `ums_area` VALUES (870, 310108, 3101, '闸北区');
INSERT INTO `ums_area` VALUES (871, 310109, 3101, '虹口区');
INSERT INTO `ums_area` VALUES (872, 310110, 3101, '杨浦区');
INSERT INTO `ums_area` VALUES (873, 310112, 3101, '闵行区');
INSERT INTO `ums_area` VALUES (874, 310113, 3101, '宝山区');
INSERT INTO `ums_area` VALUES (875, 310114, 3101, '嘉定区');
INSERT INTO `ums_area` VALUES (876, 310115, 3101, '浦东新区');
INSERT INTO `ums_area` VALUES (877, 310116, 3101, '金山区');
INSERT INTO `ums_area` VALUES (878, 310117, 3101, '松江区');
INSERT INTO `ums_area` VALUES (879, 310118, 3101, '青浦区');
INSERT INTO `ums_area` VALUES (880, 3102, 31, '上海县辖');
INSERT INTO `ums_area` VALUES (881, 310225, 3102, '南汇县');
INSERT INTO `ums_area` VALUES (882, 310226, 3102, '奉贤县');
INSERT INTO `ums_area` VALUES (883, 310230, 3102, '崇明县');
INSERT INTO `ums_area` VALUES (884, 32, 0, '江苏');
INSERT INTO `ums_area` VALUES (885, 3201, 32, '南京');
INSERT INTO `ums_area` VALUES (886, 320101, 3201, '市辖区');
INSERT INTO `ums_area` VALUES (887, 320102, 3201, '玄武区');
INSERT INTO `ums_area` VALUES (888, 320103, 3201, '白下区');
INSERT INTO `ums_area` VALUES (889, 320104, 3201, '秦淮区');
INSERT INTO `ums_area` VALUES (890, 320105, 3201, '建邺区');
INSERT INTO `ums_area` VALUES (891, 320106, 3201, '鼓楼区');
INSERT INTO `ums_area` VALUES (892, 320107, 3201, '下关区');
INSERT INTO `ums_area` VALUES (893, 320111, 3201, '浦口区');
INSERT INTO `ums_area` VALUES (894, 320112, 3201, '大厂区');
INSERT INTO `ums_area` VALUES (895, 320113, 3201, '栖霞区');
INSERT INTO `ums_area` VALUES (896, 320114, 3201, '雨花台区');
INSERT INTO `ums_area` VALUES (897, 320115, 3201, '江宁区');
INSERT INTO `ums_area` VALUES (898, 320122, 3201, '江浦县');
INSERT INTO `ums_area` VALUES (899, 320123, 3201, '六合县');
INSERT INTO `ums_area` VALUES (900, 320124, 3201, '溧水县');
INSERT INTO `ums_area` VALUES (901, 320125, 3201, '高淳县');
INSERT INTO `ums_area` VALUES (902, 3202, 32, '无锡');
INSERT INTO `ums_area` VALUES (903, 320201, 3202, '市辖区');
INSERT INTO `ums_area` VALUES (904, 320202, 3202, '崇安区');
INSERT INTO `ums_area` VALUES (905, 320203, 3202, '南长区');
INSERT INTO `ums_area` VALUES (906, 320204, 3202, '北塘区');
INSERT INTO `ums_area` VALUES (907, 320205, 3202, '锡山区');
INSERT INTO `ums_area` VALUES (908, 320206, 3202, '惠山区');
INSERT INTO `ums_area` VALUES (909, 320211, 3202, '滨湖区');
INSERT INTO `ums_area` VALUES (910, 320281, 3202, '江阴市');
INSERT INTO `ums_area` VALUES (911, 320282, 3202, '宜兴市');
INSERT INTO `ums_area` VALUES (912, 3203, 32, '徐州');
INSERT INTO `ums_area` VALUES (913, 320301, 3203, '市辖区');
INSERT INTO `ums_area` VALUES (914, 320302, 3203, '鼓楼区');
INSERT INTO `ums_area` VALUES (915, 320303, 3203, '云龙区');
INSERT INTO `ums_area` VALUES (916, 320304, 3203, '九里区');
INSERT INTO `ums_area` VALUES (917, 320305, 3203, '贾汪区');
INSERT INTO `ums_area` VALUES (918, 320311, 3203, '泉山区');
INSERT INTO `ums_area` VALUES (919, 320321, 3203, '丰 县');
INSERT INTO `ums_area` VALUES (920, 320322, 3203, '沛 县');
INSERT INTO `ums_area` VALUES (921, 320323, 3203, '铜山县');
INSERT INTO `ums_area` VALUES (922, 320324, 3203, '睢宁县');
INSERT INTO `ums_area` VALUES (923, 320381, 3203, '新沂市');
INSERT INTO `ums_area` VALUES (924, 320382, 3203, '邳州市');
INSERT INTO `ums_area` VALUES (925, 3204, 32, '常州');
INSERT INTO `ums_area` VALUES (926, 320401, 3204, '市辖区');
INSERT INTO `ums_area` VALUES (927, 320402, 3204, '天宁区');
INSERT INTO `ums_area` VALUES (928, 320404, 3204, '钟楼区');
INSERT INTO `ums_area` VALUES (929, 320405, 3204, '戚墅堰区');
INSERT INTO `ums_area` VALUES (930, 320411, 3204, '郊 区');
INSERT INTO `ums_area` VALUES (931, 320481, 3204, '溧阳市');
INSERT INTO `ums_area` VALUES (932, 320482, 3204, '金坛市');
INSERT INTO `ums_area` VALUES (933, 320483, 3204, '武进市');
INSERT INTO `ums_area` VALUES (934, 3205, 32, '苏州');
INSERT INTO `ums_area` VALUES (935, 320501, 3205, '市辖区');
INSERT INTO `ums_area` VALUES (936, 320502, 3205, '沧浪区');
INSERT INTO `ums_area` VALUES (937, 320503, 3205, '平江区');
INSERT INTO `ums_area` VALUES (938, 320504, 3205, '金阊区');
INSERT INTO `ums_area` VALUES (939, 320505, 3205, '虎丘区');
INSERT INTO `ums_area` VALUES (940, 320506, 3205, '吴中区');
INSERT INTO `ums_area` VALUES (941, 320507, 3205, '相城区');
INSERT INTO `ums_area` VALUES (942, 320581, 3205, '常熟市');
INSERT INTO `ums_area` VALUES (943, 320582, 3205, '张家港市');
INSERT INTO `ums_area` VALUES (944, 320583, 3205, '昆山市');
INSERT INTO `ums_area` VALUES (945, 320584, 3205, '吴江市');
INSERT INTO `ums_area` VALUES (946, 320585, 3205, '太仓市');
INSERT INTO `ums_area` VALUES (947, 3206, 32, '南通');
INSERT INTO `ums_area` VALUES (948, 320601, 3206, '市辖区');
INSERT INTO `ums_area` VALUES (949, 320602, 3206, '崇川区');
INSERT INTO `ums_area` VALUES (950, 320611, 3206, '港闸区');
INSERT INTO `ums_area` VALUES (951, 320621, 3206, '海安县');
INSERT INTO `ums_area` VALUES (952, 320623, 3206, '如东县');
INSERT INTO `ums_area` VALUES (953, 320681, 3206, '启东市');
INSERT INTO `ums_area` VALUES (954, 320682, 3206, '如皋市');
INSERT INTO `ums_area` VALUES (955, 320683, 3206, '通州市');
INSERT INTO `ums_area` VALUES (956, 320684, 3206, '海门市');
INSERT INTO `ums_area` VALUES (957, 3207, 32, '连云港');
INSERT INTO `ums_area` VALUES (958, 320701, 3207, '市辖区');
INSERT INTO `ums_area` VALUES (959, 320703, 3207, '连云区');
INSERT INTO `ums_area` VALUES (960, 320704, 3207, '云台区');
INSERT INTO `ums_area` VALUES (961, 320705, 3207, '新浦区');
INSERT INTO `ums_area` VALUES (962, 320706, 3207, '海州区');
INSERT INTO `ums_area` VALUES (963, 320721, 3207, '赣榆县');
INSERT INTO `ums_area` VALUES (964, 320722, 3207, '东海县');
INSERT INTO `ums_area` VALUES (965, 320723, 3207, '灌云县');
INSERT INTO `ums_area` VALUES (966, 320724, 3207, '灌南县');
INSERT INTO `ums_area` VALUES (967, 3208, 32, '淮安');
INSERT INTO `ums_area` VALUES (968, 320801, 3208, '市辖区');
INSERT INTO `ums_area` VALUES (969, 320802, 3208, '清河区');
INSERT INTO `ums_area` VALUES (970, 320803, 3208, '楚州区');
INSERT INTO `ums_area` VALUES (971, 320804, 3208, '淮阴区');
INSERT INTO `ums_area` VALUES (972, 320811, 3208, '清浦区');
INSERT INTO `ums_area` VALUES (973, 320826, 3208, '涟水县');
INSERT INTO `ums_area` VALUES (974, 320829, 3208, '洪泽县');
INSERT INTO `ums_area` VALUES (975, 320830, 3208, '盱眙县');
INSERT INTO `ums_area` VALUES (976, 320831, 3208, '金湖县');
INSERT INTO `ums_area` VALUES (977, 3209, 32, '盐城');
INSERT INTO `ums_area` VALUES (978, 320901, 3209, '市辖区');
INSERT INTO `ums_area` VALUES (979, 320902, 3209, '城 区');
INSERT INTO `ums_area` VALUES (980, 320921, 3209, '响水县');
INSERT INTO `ums_area` VALUES (981, 320922, 3209, '滨海县');
INSERT INTO `ums_area` VALUES (982, 320923, 3209, '阜宁县');
INSERT INTO `ums_area` VALUES (983, 320924, 3209, '射阳县');
INSERT INTO `ums_area` VALUES (984, 320925, 3209, '建湖县');
INSERT INTO `ums_area` VALUES (985, 320928, 3209, '盐都县');
INSERT INTO `ums_area` VALUES (986, 320981, 3209, '东台市');
INSERT INTO `ums_area` VALUES (987, 320982, 3209, '大丰市');
INSERT INTO `ums_area` VALUES (988, 3210, 32, '扬州');
INSERT INTO `ums_area` VALUES (989, 321001, 3210, '市辖区');
INSERT INTO `ums_area` VALUES (990, 321002, 3210, '广陵区');
INSERT INTO `ums_area` VALUES (991, 321003, 3210, '邗江区');
INSERT INTO `ums_area` VALUES (992, 321011, 3210, '郊 区');
INSERT INTO `ums_area` VALUES (993, 321023, 3210, '宝应县');
INSERT INTO `ums_area` VALUES (994, 321081, 3210, '仪征市');
INSERT INTO `ums_area` VALUES (995, 321084, 3210, '高邮市');
INSERT INTO `ums_area` VALUES (996, 321088, 3210, '江都市');
INSERT INTO `ums_area` VALUES (997, 3211, 32, '镇江');
INSERT INTO `ums_area` VALUES (998, 321101, 3211, '市辖区');
INSERT INTO `ums_area` VALUES (999, 321102, 3211, '京口区');
INSERT INTO `ums_area` VALUES (1000, 321111, 3211, '润州区');
INSERT INTO `ums_area` VALUES (1001, 321121, 3211, '丹徒县');
INSERT INTO `ums_area` VALUES (1002, 321181, 3211, '丹阳市');
INSERT INTO `ums_area` VALUES (1003, 321182, 3211, '扬中市');
INSERT INTO `ums_area` VALUES (1004, 321183, 3211, '句容市');
INSERT INTO `ums_area` VALUES (1005, 3212, 32, '泰州');
INSERT INTO `ums_area` VALUES (1006, 321201, 3212, '市辖区');
INSERT INTO `ums_area` VALUES (1007, 321202, 3212, '海陵区');
INSERT INTO `ums_area` VALUES (1008, 321203, 3212, '高港区');
INSERT INTO `ums_area` VALUES (1009, 321281, 3212, '兴化市');
INSERT INTO `ums_area` VALUES (1010, 321282, 3212, '靖江市');
INSERT INTO `ums_area` VALUES (1011, 321283, 3212, '泰兴市');
INSERT INTO `ums_area` VALUES (1012, 321284, 3212, '姜堰市');
INSERT INTO `ums_area` VALUES (1013, 3213, 32, '宿迁');
INSERT INTO `ums_area` VALUES (1014, 321301, 3213, '市辖区');
INSERT INTO `ums_area` VALUES (1015, 321302, 3213, '宿城区');
INSERT INTO `ums_area` VALUES (1016, 321321, 3213, '宿豫县');
INSERT INTO `ums_area` VALUES (1017, 321322, 3213, '沭阳县');
INSERT INTO `ums_area` VALUES (1018, 321323, 3213, '泗阳县');
INSERT INTO `ums_area` VALUES (1019, 321324, 3213, '泗洪县');
INSERT INTO `ums_area` VALUES (1020, 33, 0, '浙江');
INSERT INTO `ums_area` VALUES (1021, 3301, 33, '杭州');
INSERT INTO `ums_area` VALUES (1022, 330101, 3301, '市辖区');
INSERT INTO `ums_area` VALUES (1023, 330102, 3301, '上城区');
INSERT INTO `ums_area` VALUES (1024, 330103, 3301, '下城区');
INSERT INTO `ums_area` VALUES (1025, 330104, 3301, '江干区');
INSERT INTO `ums_area` VALUES (1026, 330105, 3301, '拱墅区');
INSERT INTO `ums_area` VALUES (1027, 330106, 3301, '西湖区');
INSERT INTO `ums_area` VALUES (1028, 330108, 3301, '滨江区');
INSERT INTO `ums_area` VALUES (1029, 330122, 3301, '桐庐县');
INSERT INTO `ums_area` VALUES (1030, 330127, 3301, '淳安县');
INSERT INTO `ums_area` VALUES (1031, 330181, 3301, '萧山市');
INSERT INTO `ums_area` VALUES (1032, 330182, 3301, '建德市');
INSERT INTO `ums_area` VALUES (1033, 330183, 3301, '富阳市');
INSERT INTO `ums_area` VALUES (1034, 330184, 3301, '余杭市');
INSERT INTO `ums_area` VALUES (1035, 330185, 3301, '临安市');
INSERT INTO `ums_area` VALUES (1036, 3302, 33, '宁波');
INSERT INTO `ums_area` VALUES (1037, 330201, 3302, '市辖区');
INSERT INTO `ums_area` VALUES (1038, 330203, 3302, '海曙区');
INSERT INTO `ums_area` VALUES (1039, 330204, 3302, '江东区');
INSERT INTO `ums_area` VALUES (1040, 330205, 3302, '江北区');
INSERT INTO `ums_area` VALUES (1041, 330206, 3302, '北仑区');
INSERT INTO `ums_area` VALUES (1042, 330211, 3302, '镇海区');
INSERT INTO `ums_area` VALUES (1043, 330225, 3302, '象山县');
INSERT INTO `ums_area` VALUES (1044, 330226, 3302, '宁海县');
INSERT INTO `ums_area` VALUES (1045, 330227, 3302, '鄞 县');
INSERT INTO `ums_area` VALUES (1046, 330281, 3302, '余姚市');
INSERT INTO `ums_area` VALUES (1047, 330282, 3302, '慈溪市');
INSERT INTO `ums_area` VALUES (1048, 330283, 3302, '奉化市');
INSERT INTO `ums_area` VALUES (1049, 3303, 33, '温州');
INSERT INTO `ums_area` VALUES (1050, 330301, 3303, '市辖区');
INSERT INTO `ums_area` VALUES (1051, 330302, 3303, '鹿城区');
INSERT INTO `ums_area` VALUES (1052, 330303, 3303, '龙湾区');
INSERT INTO `ums_area` VALUES (1053, 330304, 3303, '瓯海区');
INSERT INTO `ums_area` VALUES (1054, 330322, 3303, '洞头县');
INSERT INTO `ums_area` VALUES (1055, 330324, 3303, '永嘉县');
INSERT INTO `ums_area` VALUES (1056, 330326, 3303, '平阳县');
INSERT INTO `ums_area` VALUES (1057, 330327, 3303, '苍南县');
INSERT INTO `ums_area` VALUES (1058, 330328, 3303, '文成县');
INSERT INTO `ums_area` VALUES (1059, 330329, 3303, '泰顺县');
INSERT INTO `ums_area` VALUES (1060, 330381, 3303, '瑞安市');
INSERT INTO `ums_area` VALUES (1061, 330382, 3303, '乐清市');
INSERT INTO `ums_area` VALUES (1062, 3304, 33, '嘉兴');
INSERT INTO `ums_area` VALUES (1063, 330401, 3304, '市辖区');
INSERT INTO `ums_area` VALUES (1064, 330402, 3304, '秀城区');
INSERT INTO `ums_area` VALUES (1065, 330411, 3304, '秀洲区');
INSERT INTO `ums_area` VALUES (1066, 330421, 3304, '嘉善县');
INSERT INTO `ums_area` VALUES (1067, 330424, 3304, '海盐县');
INSERT INTO `ums_area` VALUES (1068, 330481, 3304, '海宁市');
INSERT INTO `ums_area` VALUES (1069, 330482, 3304, '平湖市');
INSERT INTO `ums_area` VALUES (1070, 330483, 3304, '桐乡市');
INSERT INTO `ums_area` VALUES (1071, 3305, 33, '湖州');
INSERT INTO `ums_area` VALUES (1072, 330501, 3305, '市辖区');
INSERT INTO `ums_area` VALUES (1073, 330521, 3305, '德清县');
INSERT INTO `ums_area` VALUES (1074, 330522, 3305, '长兴县');
INSERT INTO `ums_area` VALUES (1075, 330523, 3305, '安吉县');
INSERT INTO `ums_area` VALUES (1076, 3306, 33, '绍兴');
INSERT INTO `ums_area` VALUES (1077, 330601, 3306, '市辖区');
INSERT INTO `ums_area` VALUES (1078, 330602, 3306, '越城区');
INSERT INTO `ums_area` VALUES (1079, 330621, 3306, '绍兴县');
INSERT INTO `ums_area` VALUES (1080, 330624, 3306, '新昌县');
INSERT INTO `ums_area` VALUES (1081, 330681, 3306, '诸暨市');
INSERT INTO `ums_area` VALUES (1082, 330682, 3306, '上虞市');
INSERT INTO `ums_area` VALUES (1083, 330683, 3306, '嵊州市');
INSERT INTO `ums_area` VALUES (1084, 3307, 33, '金华');
INSERT INTO `ums_area` VALUES (1085, 330701, 3307, '市辖区');
INSERT INTO `ums_area` VALUES (1086, 330702, 3307, '婺城区');
INSERT INTO `ums_area` VALUES (1087, 330703, 3307, '金东区');
INSERT INTO `ums_area` VALUES (1088, 330723, 3307, '武义县');
INSERT INTO `ums_area` VALUES (1089, 330726, 3307, '浦江县');
INSERT INTO `ums_area` VALUES (1090, 330727, 3307, '磐安县');
INSERT INTO `ums_area` VALUES (1091, 330781, 3307, '兰溪市');
INSERT INTO `ums_area` VALUES (1092, 330782, 3307, '义乌市');
INSERT INTO `ums_area` VALUES (1093, 330783, 3307, '东阳市');
INSERT INTO `ums_area` VALUES (1094, 330784, 3307, '永康市');
INSERT INTO `ums_area` VALUES (1095, 3308, 33, '衢州');
INSERT INTO `ums_area` VALUES (1096, 330801, 3308, '市辖区');
INSERT INTO `ums_area` VALUES (1097, 330802, 3308, '柯城区');
INSERT INTO `ums_area` VALUES (1098, 330821, 3308, '衢 县');
INSERT INTO `ums_area` VALUES (1099, 330822, 3308, '常山县');
INSERT INTO `ums_area` VALUES (1100, 330824, 3308, '开化县');
INSERT INTO `ums_area` VALUES (1101, 330825, 3308, '龙游县');
INSERT INTO `ums_area` VALUES (1102, 330881, 3308, '江山市');
INSERT INTO `ums_area` VALUES (1103, 3309, 33, '舟山');
INSERT INTO `ums_area` VALUES (1104, 330901, 3309, '市辖区');
INSERT INTO `ums_area` VALUES (1105, 330902, 3309, '定海区');
INSERT INTO `ums_area` VALUES (1106, 330903, 3309, '普陀区');
INSERT INTO `ums_area` VALUES (1107, 330921, 3309, '岱山县');
INSERT INTO `ums_area` VALUES (1108, 330922, 3309, '嵊泗县');
INSERT INTO `ums_area` VALUES (1109, 3310, 33, '台州');
INSERT INTO `ums_area` VALUES (1110, 331001, 3310, '市辖区');
INSERT INTO `ums_area` VALUES (1111, 331002, 3310, '椒江区');
INSERT INTO `ums_area` VALUES (1112, 331003, 3310, '黄岩区');
INSERT INTO `ums_area` VALUES (1113, 331004, 3310, '路桥区');
INSERT INTO `ums_area` VALUES (1114, 331021, 3310, '玉环县');
INSERT INTO `ums_area` VALUES (1115, 331022, 3310, '三门县');
INSERT INTO `ums_area` VALUES (1116, 331023, 3310, '天台县');
INSERT INTO `ums_area` VALUES (1117, 331024, 3310, '仙居县');
INSERT INTO `ums_area` VALUES (1118, 331081, 3310, '温岭市');
INSERT INTO `ums_area` VALUES (1119, 331082, 3310, '临海市');
INSERT INTO `ums_area` VALUES (1120, 3311, 33, '丽水');
INSERT INTO `ums_area` VALUES (1121, 331101, 3311, '市辖区');
INSERT INTO `ums_area` VALUES (1122, 331102, 3311, '莲都区');
INSERT INTO `ums_area` VALUES (1123, 331121, 3311, '青田县');
INSERT INTO `ums_area` VALUES (1124, 331122, 3311, '缙云县');
INSERT INTO `ums_area` VALUES (1125, 331123, 3311, '遂昌县');
INSERT INTO `ums_area` VALUES (1126, 331124, 3311, '松阳县');
INSERT INTO `ums_area` VALUES (1127, 331125, 3311, '云和县');
INSERT INTO `ums_area` VALUES (1128, 331126, 3311, '庆元县');
INSERT INTO `ums_area` VALUES (1129, 331127, 3311, '景宁畲族自治县');
INSERT INTO `ums_area` VALUES (1130, 331181, 3311, '龙泉市');
INSERT INTO `ums_area` VALUES (1131, 34, 0, '安徽');
INSERT INTO `ums_area` VALUES (1132, 3401, 34, '合肥');
INSERT INTO `ums_area` VALUES (1133, 340101, 3401, '市辖区');
INSERT INTO `ums_area` VALUES (1134, 340102, 3401, '东市区');
INSERT INTO `ums_area` VALUES (1135, 340103, 3401, '中市区');
INSERT INTO `ums_area` VALUES (1136, 340104, 3401, '西市区');
INSERT INTO `ums_area` VALUES (1137, 340111, 3401, '郊 区');
INSERT INTO `ums_area` VALUES (1138, 340121, 3401, '长丰县');
INSERT INTO `ums_area` VALUES (1139, 340122, 3401, '肥东县');
INSERT INTO `ums_area` VALUES (1140, 340123, 3401, '肥西县');
INSERT INTO `ums_area` VALUES (1141, 3402, 34, '芜湖');
INSERT INTO `ums_area` VALUES (1142, 340201, 3402, '市辖区');
INSERT INTO `ums_area` VALUES (1143, 340202, 3402, '镜湖区');
INSERT INTO `ums_area` VALUES (1144, 340203, 3402, '马塘区');
INSERT INTO `ums_area` VALUES (1145, 340204, 3402, '新芜区');
INSERT INTO `ums_area` VALUES (1146, 340207, 3402, '鸠江区');
INSERT INTO `ums_area` VALUES (1147, 340221, 3402, '芜湖县');
INSERT INTO `ums_area` VALUES (1148, 340222, 3402, '繁昌县');
INSERT INTO `ums_area` VALUES (1149, 340223, 3402, '南陵县');
INSERT INTO `ums_area` VALUES (1150, 3403, 34, '蚌埠');
INSERT INTO `ums_area` VALUES (1151, 340301, 3403, '市辖区');
INSERT INTO `ums_area` VALUES (1152, 340302, 3403, '东市区');
INSERT INTO `ums_area` VALUES (1153, 340303, 3403, '中市区');
INSERT INTO `ums_area` VALUES (1154, 340304, 3403, '西市区');
INSERT INTO `ums_area` VALUES (1155, 340311, 3403, '郊 区');
INSERT INTO `ums_area` VALUES (1156, 340321, 3403, '怀远县');
INSERT INTO `ums_area` VALUES (1157, 340322, 3403, '五河县');
INSERT INTO `ums_area` VALUES (1158, 340323, 3403, '固镇县');
INSERT INTO `ums_area` VALUES (1159, 3404, 34, '淮南');
INSERT INTO `ums_area` VALUES (1160, 340401, 3404, '市辖区');
INSERT INTO `ums_area` VALUES (1161, 340402, 3404, '大通区');
INSERT INTO `ums_area` VALUES (1162, 340403, 3404, '田家庵区');
INSERT INTO `ums_area` VALUES (1163, 340404, 3404, '谢家集区');
INSERT INTO `ums_area` VALUES (1164, 340405, 3404, '八公山区');
INSERT INTO `ums_area` VALUES (1165, 340406, 3404, '潘集区');
INSERT INTO `ums_area` VALUES (1166, 340421, 3404, '凤台县');
INSERT INTO `ums_area` VALUES (1167, 3405, 34, '马鞍山');
INSERT INTO `ums_area` VALUES (1168, 340501, 3405, '市辖区');
INSERT INTO `ums_area` VALUES (1169, 340502, 3405, '金家庄区');
INSERT INTO `ums_area` VALUES (1170, 340503, 3405, '花山区');
INSERT INTO `ums_area` VALUES (1171, 340504, 3405, '雨山区');
INSERT INTO `ums_area` VALUES (1172, 340505, 3405, '向山区');
INSERT INTO `ums_area` VALUES (1173, 340521, 3405, '当涂县');
INSERT INTO `ums_area` VALUES (1174, 3406, 34, '淮北');
INSERT INTO `ums_area` VALUES (1175, 340601, 3406, '市辖区');
INSERT INTO `ums_area` VALUES (1176, 340602, 3406, '杜集区');
INSERT INTO `ums_area` VALUES (1177, 340603, 3406, '相山区');
INSERT INTO `ums_area` VALUES (1178, 340604, 3406, '烈山区');
INSERT INTO `ums_area` VALUES (1179, 340621, 3406, '濉溪县');
INSERT INTO `ums_area` VALUES (1180, 3407, 34, '铜陵');
INSERT INTO `ums_area` VALUES (1181, 340701, 3407, '市辖区');
INSERT INTO `ums_area` VALUES (1182, 340702, 3407, '铜官山区');
INSERT INTO `ums_area` VALUES (1183, 340703, 3407, '狮子山区');
INSERT INTO `ums_area` VALUES (1184, 340711, 3407, '郊 区');
INSERT INTO `ums_area` VALUES (1185, 340721, 3407, '铜陵县');
INSERT INTO `ums_area` VALUES (1186, 3408, 34, '安庆');
INSERT INTO `ums_area` VALUES (1187, 340801, 3408, '市辖区');
INSERT INTO `ums_area` VALUES (1188, 340802, 3408, '迎江区');
INSERT INTO `ums_area` VALUES (1189, 340803, 3408, '大观区');
INSERT INTO `ums_area` VALUES (1190, 340811, 3408, '郊 区');
INSERT INTO `ums_area` VALUES (1191, 340822, 3408, '怀宁县');
INSERT INTO `ums_area` VALUES (1192, 340823, 3408, '枞阳县');
INSERT INTO `ums_area` VALUES (1193, 340824, 3408, '潜山县');
INSERT INTO `ums_area` VALUES (1194, 340825, 3408, '太湖县');
INSERT INTO `ums_area` VALUES (1195, 340826, 3408, '宿松县');
INSERT INTO `ums_area` VALUES (1196, 340827, 3408, '望江县');
INSERT INTO `ums_area` VALUES (1197, 340828, 3408, '岳西县');
INSERT INTO `ums_area` VALUES (1198, 340881, 3408, '桐城市');
INSERT INTO `ums_area` VALUES (1199, 3410, 34, '黄山');
INSERT INTO `ums_area` VALUES (1200, 341001, 3410, '市辖区');
INSERT INTO `ums_area` VALUES (1201, 341002, 3410, '屯溪区');
INSERT INTO `ums_area` VALUES (1202, 341003, 3410, '黄山区');
INSERT INTO `ums_area` VALUES (1203, 341004, 3410, '徽州区');
INSERT INTO `ums_area` VALUES (1204, 341021, 3410, '歙 县');
INSERT INTO `ums_area` VALUES (1205, 341022, 3410, '休宁县');
INSERT INTO `ums_area` VALUES (1206, 341023, 3410, '黟 县');
INSERT INTO `ums_area` VALUES (1207, 341024, 3410, '祁门县');
INSERT INTO `ums_area` VALUES (1208, 3411, 34, '滁州');
INSERT INTO `ums_area` VALUES (1209, 341101, 3411, '市辖区');
INSERT INTO `ums_area` VALUES (1210, 341102, 3411, '琅琊区');
INSERT INTO `ums_area` VALUES (1211, 341103, 3411, '南谯区');
INSERT INTO `ums_area` VALUES (1212, 341122, 3411, '来安县');
INSERT INTO `ums_area` VALUES (1213, 341124, 3411, '全椒县');
INSERT INTO `ums_area` VALUES (1214, 341125, 3411, '定远县');
INSERT INTO `ums_area` VALUES (1215, 341126, 3411, '凤阳县');
INSERT INTO `ums_area` VALUES (1216, 341181, 3411, '天长市');
INSERT INTO `ums_area` VALUES (1217, 341182, 3411, '明光市');
INSERT INTO `ums_area` VALUES (1218, 3412, 34, '阜阳');
INSERT INTO `ums_area` VALUES (1219, 341201, 3412, '市辖区');
INSERT INTO `ums_area` VALUES (1220, 341202, 3412, '颍州区');
INSERT INTO `ums_area` VALUES (1221, 341203, 3412, '颍东区');
INSERT INTO `ums_area` VALUES (1222, 341204, 3412, '颍泉区');
INSERT INTO `ums_area` VALUES (1223, 341221, 3412, '临泉县');
INSERT INTO `ums_area` VALUES (1224, 341222, 3412, '太和县');
INSERT INTO `ums_area` VALUES (1225, 341225, 3412, '阜南县');
INSERT INTO `ums_area` VALUES (1226, 341226, 3412, '颍上县');
INSERT INTO `ums_area` VALUES (1227, 341282, 3412, '界首市');
INSERT INTO `ums_area` VALUES (1228, 3413, 34, '宿州');
INSERT INTO `ums_area` VALUES (1229, 341301, 3413, '市辖区');
INSERT INTO `ums_area` VALUES (1230, 341302, 3413, '墉桥区');
INSERT INTO `ums_area` VALUES (1231, 341321, 3413, '砀山县');
INSERT INTO `ums_area` VALUES (1232, 341322, 3413, '萧 县');
INSERT INTO `ums_area` VALUES (1233, 341323, 3413, '灵璧县');
INSERT INTO `ums_area` VALUES (1234, 341324, 3413, '泗 县');
INSERT INTO `ums_area` VALUES (1235, 3414, 34, '巢湖');
INSERT INTO `ums_area` VALUES (1236, 341401, 3414, '市辖区');
INSERT INTO `ums_area` VALUES (1237, 341402, 3414, '居巢区');
INSERT INTO `ums_area` VALUES (1238, 341421, 3414, '庐江县');
INSERT INTO `ums_area` VALUES (1239, 341422, 3414, '无为县');
INSERT INTO `ums_area` VALUES (1240, 341423, 3414, '含山县');
INSERT INTO `ums_area` VALUES (1241, 341424, 3414, '和 县');
INSERT INTO `ums_area` VALUES (1242, 3415, 34, '六安');
INSERT INTO `ums_area` VALUES (1243, 341501, 3415, '市辖区');
INSERT INTO `ums_area` VALUES (1244, 341502, 3415, '金安区');
INSERT INTO `ums_area` VALUES (1245, 341503, 3415, '裕安区');
INSERT INTO `ums_area` VALUES (1246, 341521, 3415, '寿 县');
INSERT INTO `ums_area` VALUES (1247, 341522, 3415, '霍邱县');
INSERT INTO `ums_area` VALUES (1248, 341523, 3415, '舒城县');
INSERT INTO `ums_area` VALUES (1249, 341524, 3415, '金寨县');
INSERT INTO `ums_area` VALUES (1250, 341525, 3415, '霍山县');
INSERT INTO `ums_area` VALUES (1251, 3416, 34, '亳州');
INSERT INTO `ums_area` VALUES (1252, 341601, 3416, '市辖区');
INSERT INTO `ums_area` VALUES (1253, 341602, 3416, '谯城区');
INSERT INTO `ums_area` VALUES (1254, 341621, 3416, '涡阳县');
INSERT INTO `ums_area` VALUES (1255, 341622, 3416, '蒙城县');
INSERT INTO `ums_area` VALUES (1256, 341623, 3416, '利辛县');
INSERT INTO `ums_area` VALUES (1257, 3417, 34, '池州');
INSERT INTO `ums_area` VALUES (1258, 341701, 3417, '市辖区');
INSERT INTO `ums_area` VALUES (1259, 341702, 3417, '贵池区');
INSERT INTO `ums_area` VALUES (1260, 341721, 3417, '东至县');
INSERT INTO `ums_area` VALUES (1261, 341722, 3417, '石台县');
INSERT INTO `ums_area` VALUES (1262, 341723, 3417, '青阳县');
INSERT INTO `ums_area` VALUES (1263, 3418, 34, '宣城');
INSERT INTO `ums_area` VALUES (1264, 341801, 3418, '市辖区');
INSERT INTO `ums_area` VALUES (1265, 341802, 3418, '宣州区');
INSERT INTO `ums_area` VALUES (1266, 341821, 3418, '郎溪县');
INSERT INTO `ums_area` VALUES (1267, 341822, 3418, '广德县');
INSERT INTO `ums_area` VALUES (1268, 341823, 3418, '泾 县');
INSERT INTO `ums_area` VALUES (1269, 341824, 3418, '绩溪县');
INSERT INTO `ums_area` VALUES (1270, 341825, 3418, '旌德县');
INSERT INTO `ums_area` VALUES (1271, 341881, 3418, '宁国市');
INSERT INTO `ums_area` VALUES (1272, 35, 0, '福建');
INSERT INTO `ums_area` VALUES (1273, 3501, 35, '福州');
INSERT INTO `ums_area` VALUES (1274, 350101, 3501, '市辖区');
INSERT INTO `ums_area` VALUES (1275, 350102, 3501, '鼓楼区');
INSERT INTO `ums_area` VALUES (1276, 350103, 3501, '台江区');
INSERT INTO `ums_area` VALUES (1277, 350104, 3501, '仓山区');
INSERT INTO `ums_area` VALUES (1278, 350105, 3501, '马尾区');
INSERT INTO `ums_area` VALUES (1279, 350111, 3501, '晋安区');
INSERT INTO `ums_area` VALUES (1280, 350121, 3501, '闽侯县');
INSERT INTO `ums_area` VALUES (1281, 350122, 3501, '连江县');
INSERT INTO `ums_area` VALUES (1282, 350123, 3501, '罗源县');
INSERT INTO `ums_area` VALUES (1283, 350124, 3501, '闽清县');
INSERT INTO `ums_area` VALUES (1284, 350125, 3501, '永泰县');
INSERT INTO `ums_area` VALUES (1285, 350128, 3501, '平潭县');
INSERT INTO `ums_area` VALUES (1286, 350181, 3501, '福清市');
INSERT INTO `ums_area` VALUES (1287, 350182, 3501, '长乐市');
INSERT INTO `ums_area` VALUES (1288, 3502, 35, '厦门');
INSERT INTO `ums_area` VALUES (1289, 350201, 3502, '市辖区');
INSERT INTO `ums_area` VALUES (1290, 350202, 3502, '鼓浪屿区');
INSERT INTO `ums_area` VALUES (1291, 350203, 3502, '思明区');
INSERT INTO `ums_area` VALUES (1292, 350204, 3502, '开元区');
INSERT INTO `ums_area` VALUES (1293, 350205, 3502, '杏林区');
INSERT INTO `ums_area` VALUES (1294, 350206, 3502, '湖里区');
INSERT INTO `ums_area` VALUES (1295, 350211, 3502, '集美区');
INSERT INTO `ums_area` VALUES (1296, 350212, 3502, '同安区');
INSERT INTO `ums_area` VALUES (1297, 3503, 35, '莆田');
INSERT INTO `ums_area` VALUES (1298, 350301, 3503, '市辖区');
INSERT INTO `ums_area` VALUES (1299, 350302, 3503, '城厢区');
INSERT INTO `ums_area` VALUES (1300, 350303, 3503, '涵江区');
INSERT INTO `ums_area` VALUES (1301, 350321, 3503, '莆田县');
INSERT INTO `ums_area` VALUES (1302, 350322, 3503, '仙游县');
INSERT INTO `ums_area` VALUES (1303, 3504, 35, '三明');
INSERT INTO `ums_area` VALUES (1304, 350401, 3504, '市辖区');
INSERT INTO `ums_area` VALUES (1305, 350402, 3504, '梅列区');
INSERT INTO `ums_area` VALUES (1306, 350403, 3504, '三元区');
INSERT INTO `ums_area` VALUES (1307, 350421, 3504, '明溪县');
INSERT INTO `ums_area` VALUES (1308, 350423, 3504, '清流县');
INSERT INTO `ums_area` VALUES (1309, 350424, 3504, '宁化县');
INSERT INTO `ums_area` VALUES (1310, 350425, 3504, '大田县');
INSERT INTO `ums_area` VALUES (1311, 350426, 3504, '尤溪县');
INSERT INTO `ums_area` VALUES (1312, 350427, 3504, '沙 县');
INSERT INTO `ums_area` VALUES (1313, 350428, 3504, '将乐县');
INSERT INTO `ums_area` VALUES (1314, 350429, 3504, '泰宁县');
INSERT INTO `ums_area` VALUES (1315, 350430, 3504, '建宁县');
INSERT INTO `ums_area` VALUES (1316, 350481, 3504, '永安市');
INSERT INTO `ums_area` VALUES (1317, 3505, 35, '泉州');
INSERT INTO `ums_area` VALUES (1318, 350501, 3505, '市辖区');
INSERT INTO `ums_area` VALUES (1319, 350502, 3505, '鲤城区');
INSERT INTO `ums_area` VALUES (1320, 350503, 3505, '丰泽区');
INSERT INTO `ums_area` VALUES (1321, 350504, 3505, '洛江区');
INSERT INTO `ums_area` VALUES (1322, 350505, 3505, '泉港区');
INSERT INTO `ums_area` VALUES (1323, 350521, 3505, '惠安县');
INSERT INTO `ums_area` VALUES (1324, 350524, 3505, '安溪县');
INSERT INTO `ums_area` VALUES (1325, 350525, 3505, '永春县');
INSERT INTO `ums_area` VALUES (1326, 350526, 3505, '德化县');
INSERT INTO `ums_area` VALUES (1327, 350527, 3505, '金门县');
INSERT INTO `ums_area` VALUES (1328, 350581, 3505, '石狮市');
INSERT INTO `ums_area` VALUES (1329, 350582, 3505, '晋江市');
INSERT INTO `ums_area` VALUES (1330, 350583, 3505, '南安市');
INSERT INTO `ums_area` VALUES (1331, 3506, 35, '漳州');
INSERT INTO `ums_area` VALUES (1332, 350601, 3506, '市辖区');
INSERT INTO `ums_area` VALUES (1333, 350602, 3506, '芗城区');
INSERT INTO `ums_area` VALUES (1334, 350603, 3506, '龙文区');
INSERT INTO `ums_area` VALUES (1335, 350622, 3506, '云霄县');
INSERT INTO `ums_area` VALUES (1336, 350623, 3506, '漳浦县');
INSERT INTO `ums_area` VALUES (1337, 350624, 3506, '诏安县');
INSERT INTO `ums_area` VALUES (1338, 350625, 3506, '长泰县');
INSERT INTO `ums_area` VALUES (1339, 350626, 3506, '东山县');
INSERT INTO `ums_area` VALUES (1340, 350627, 3506, '南靖县');
INSERT INTO `ums_area` VALUES (1341, 350628, 3506, '平和县');
INSERT INTO `ums_area` VALUES (1342, 350629, 3506, '华安县');
INSERT INTO `ums_area` VALUES (1343, 350681, 3506, '龙海市');
INSERT INTO `ums_area` VALUES (1344, 3507, 35, '南平');
INSERT INTO `ums_area` VALUES (1345, 350701, 3507, '市辖区');
INSERT INTO `ums_area` VALUES (1346, 350702, 3507, '延平区');
INSERT INTO `ums_area` VALUES (1347, 350721, 3507, '顺昌县');
INSERT INTO `ums_area` VALUES (1348, 350722, 3507, '浦城县');
INSERT INTO `ums_area` VALUES (1349, 350723, 3507, '光泽县');
INSERT INTO `ums_area` VALUES (1350, 350724, 3507, '松溪县');
INSERT INTO `ums_area` VALUES (1351, 350725, 3507, '政和县');
INSERT INTO `ums_area` VALUES (1352, 350781, 3507, '邵武市');
INSERT INTO `ums_area` VALUES (1353, 350782, 3507, '武夷山市');
INSERT INTO `ums_area` VALUES (1354, 350783, 3507, '建瓯市');
INSERT INTO `ums_area` VALUES (1355, 350784, 3507, '建阳市');
INSERT INTO `ums_area` VALUES (1356, 3508, 35, '龙岩');
INSERT INTO `ums_area` VALUES (1357, 350801, 3508, '市辖区');
INSERT INTO `ums_area` VALUES (1358, 350802, 3508, '新罗区');
INSERT INTO `ums_area` VALUES (1359, 350821, 3508, '长汀县');
INSERT INTO `ums_area` VALUES (1360, 350822, 3508, '永定县');
INSERT INTO `ums_area` VALUES (1361, 350823, 3508, '上杭县');
INSERT INTO `ums_area` VALUES (1362, 350824, 3508, '武平县');
INSERT INTO `ums_area` VALUES (1363, 350825, 3508, '连城县');
INSERT INTO `ums_area` VALUES (1364, 350881, 3508, '漳平市');
INSERT INTO `ums_area` VALUES (1365, 3509, 35, '宁德');
INSERT INTO `ums_area` VALUES (1366, 350901, 3509, '市辖区');
INSERT INTO `ums_area` VALUES (1367, 350902, 3509, '蕉城区');
INSERT INTO `ums_area` VALUES (1368, 350921, 3509, '霞浦县');
INSERT INTO `ums_area` VALUES (1369, 350922, 3509, '古田县');
INSERT INTO `ums_area` VALUES (1370, 350923, 3509, '屏南县');
INSERT INTO `ums_area` VALUES (1371, 350924, 3509, '寿宁县');
INSERT INTO `ums_area` VALUES (1372, 350925, 3509, '周宁县');
INSERT INTO `ums_area` VALUES (1373, 350926, 3509, '柘荣县');
INSERT INTO `ums_area` VALUES (1374, 350981, 3509, '福安市');
INSERT INTO `ums_area` VALUES (1375, 350982, 3509, '福鼎市');
INSERT INTO `ums_area` VALUES (1376, 36, 0, '江西');
INSERT INTO `ums_area` VALUES (1377, 3601, 36, '南昌');
INSERT INTO `ums_area` VALUES (1378, 360101, 3601, '市辖区');
INSERT INTO `ums_area` VALUES (1379, 360102, 3601, '东湖区');
INSERT INTO `ums_area` VALUES (1380, 360103, 3601, '西湖区');
INSERT INTO `ums_area` VALUES (1381, 360104, 3601, '青云谱区');
INSERT INTO `ums_area` VALUES (1382, 360105, 3601, '湾里区');
INSERT INTO `ums_area` VALUES (1383, 360111, 3601, '郊 区');
INSERT INTO `ums_area` VALUES (1384, 360121, 3601, '南昌县');
INSERT INTO `ums_area` VALUES (1385, 360122, 3601, '新建县');
INSERT INTO `ums_area` VALUES (1386, 360123, 3601, '安义县');
INSERT INTO `ums_area` VALUES (1387, 360124, 3601, '进贤县');
INSERT INTO `ums_area` VALUES (1388, 3602, 36, '景德镇');
INSERT INTO `ums_area` VALUES (1389, 360201, 3602, '市辖区');
INSERT INTO `ums_area` VALUES (1390, 360202, 3602, '昌江区');
INSERT INTO `ums_area` VALUES (1391, 360203, 3602, '珠山区');
INSERT INTO `ums_area` VALUES (1392, 360222, 3602, '浮梁县');
INSERT INTO `ums_area` VALUES (1393, 360281, 3602, '乐平市');
INSERT INTO `ums_area` VALUES (1394, 3603, 36, '萍乡');
INSERT INTO `ums_area` VALUES (1395, 360301, 3603, '市辖区');
INSERT INTO `ums_area` VALUES (1396, 360302, 3603, '安源区');
INSERT INTO `ums_area` VALUES (1397, 360313, 3603, '湘东区');
INSERT INTO `ums_area` VALUES (1398, 360321, 3603, '莲花县');
INSERT INTO `ums_area` VALUES (1399, 360322, 3603, '上栗县');
INSERT INTO `ums_area` VALUES (1400, 360323, 3603, '芦溪县');
INSERT INTO `ums_area` VALUES (1401, 3604, 36, '九江');
INSERT INTO `ums_area` VALUES (1402, 360401, 3604, '市辖区');
INSERT INTO `ums_area` VALUES (1403, 360402, 3604, '庐山区');
INSERT INTO `ums_area` VALUES (1404, 360403, 3604, '浔阳区');
INSERT INTO `ums_area` VALUES (1405, 360421, 3604, '九江县');
INSERT INTO `ums_area` VALUES (1406, 360423, 3604, '武宁县');
INSERT INTO `ums_area` VALUES (1407, 360424, 3604, '修水县');
INSERT INTO `ums_area` VALUES (1408, 360425, 3604, '永修县');
INSERT INTO `ums_area` VALUES (1409, 360426, 3604, '德安县');
INSERT INTO `ums_area` VALUES (1410, 360427, 3604, '星子县');
INSERT INTO `ums_area` VALUES (1411, 360428, 3604, '都昌县');
INSERT INTO `ums_area` VALUES (1412, 360429, 3604, '湖口县');
INSERT INTO `ums_area` VALUES (1413, 360430, 3604, '彭泽县');
INSERT INTO `ums_area` VALUES (1414, 360481, 3604, '瑞昌市');
INSERT INTO `ums_area` VALUES (1415, 3605, 36, '新余');
INSERT INTO `ums_area` VALUES (1416, 360501, 3605, '市辖区');
INSERT INTO `ums_area` VALUES (1417, 360502, 3605, '渝水区');
INSERT INTO `ums_area` VALUES (1418, 360521, 3605, '分宜县');
INSERT INTO `ums_area` VALUES (1419, 3606, 36, '鹰潭');
INSERT INTO `ums_area` VALUES (1420, 360601, 3606, '市辖区');
INSERT INTO `ums_area` VALUES (1421, 360602, 3606, '月湖区');
INSERT INTO `ums_area` VALUES (1422, 360622, 3606, '余江县');
INSERT INTO `ums_area` VALUES (1423, 360681, 3606, '贵溪市');
INSERT INTO `ums_area` VALUES (1424, 3607, 36, '赣州');
INSERT INTO `ums_area` VALUES (1425, 360701, 3607, '市辖区');
INSERT INTO `ums_area` VALUES (1426, 360702, 3607, '章贡区');
INSERT INTO `ums_area` VALUES (1427, 360721, 3607, '赣 县');
INSERT INTO `ums_area` VALUES (1428, 360722, 3607, '信丰县');
INSERT INTO `ums_area` VALUES (1429, 360723, 3607, '大余县');
INSERT INTO `ums_area` VALUES (1430, 360724, 3607, '上犹县');
INSERT INTO `ums_area` VALUES (1431, 360725, 3607, '崇义县');
INSERT INTO `ums_area` VALUES (1432, 360726, 3607, '安远县');
INSERT INTO `ums_area` VALUES (1433, 360727, 3607, '龙南县');
INSERT INTO `ums_area` VALUES (1434, 360728, 3607, '定南县');
INSERT INTO `ums_area` VALUES (1435, 360729, 3607, '全南县');
INSERT INTO `ums_area` VALUES (1436, 360730, 3607, '宁都县');
INSERT INTO `ums_area` VALUES (1437, 360731, 3607, '于都县');
INSERT INTO `ums_area` VALUES (1438, 360732, 3607, '兴国县');
INSERT INTO `ums_area` VALUES (1439, 360733, 3607, '会昌县');
INSERT INTO `ums_area` VALUES (1440, 360734, 3607, '寻乌县');
INSERT INTO `ums_area` VALUES (1441, 360735, 3607, '石城县');
INSERT INTO `ums_area` VALUES (1442, 360781, 3607, '瑞金市');
INSERT INTO `ums_area` VALUES (1443, 360782, 3607, '南康市');
INSERT INTO `ums_area` VALUES (1444, 3608, 36, '吉安');
INSERT INTO `ums_area` VALUES (1445, 360801, 3608, '市辖区');
INSERT INTO `ums_area` VALUES (1446, 360802, 3608, '吉州区');
INSERT INTO `ums_area` VALUES (1447, 360803, 3608, '青原区');
INSERT INTO `ums_area` VALUES (1448, 360821, 3608, '吉安县');
INSERT INTO `ums_area` VALUES (1449, 360822, 3608, '吉水县');
INSERT INTO `ums_area` VALUES (1450, 360823, 3608, '峡江县');
INSERT INTO `ums_area` VALUES (1451, 360824, 3608, '新干县');
INSERT INTO `ums_area` VALUES (1452, 360825, 3608, '永丰县');
INSERT INTO `ums_area` VALUES (1453, 360826, 3608, '泰和县');
INSERT INTO `ums_area` VALUES (1454, 360827, 3608, '遂川县');
INSERT INTO `ums_area` VALUES (1455, 360828, 3608, '万安县');
INSERT INTO `ums_area` VALUES (1456, 360829, 3608, '安福县');
INSERT INTO `ums_area` VALUES (1457, 360830, 3608, '永新县');
INSERT INTO `ums_area` VALUES (1458, 360881, 3608, '井冈山市');
INSERT INTO `ums_area` VALUES (1459, 3609, 36, '宜春');
INSERT INTO `ums_area` VALUES (1460, 360901, 3609, '市辖区');
INSERT INTO `ums_area` VALUES (1461, 360902, 3609, '袁州区');
INSERT INTO `ums_area` VALUES (1462, 360921, 3609, '奉新县');
INSERT INTO `ums_area` VALUES (1463, 360922, 3609, '万载县');
INSERT INTO `ums_area` VALUES (1464, 360923, 3609, '上高县');
INSERT INTO `ums_area` VALUES (1465, 360924, 3609, '宜丰县');
INSERT INTO `ums_area` VALUES (1466, 360925, 3609, '靖安县');
INSERT INTO `ums_area` VALUES (1467, 360926, 3609, '铜鼓县');
INSERT INTO `ums_area` VALUES (1468, 360981, 3609, '丰城市');
INSERT INTO `ums_area` VALUES (1469, 360982, 3609, '樟树市');
INSERT INTO `ums_area` VALUES (1470, 360983, 3609, '高安市');
INSERT INTO `ums_area` VALUES (1471, 3610, 36, '抚州');
INSERT INTO `ums_area` VALUES (1472, 361001, 3610, '市辖区');
INSERT INTO `ums_area` VALUES (1473, 361002, 3610, '临川区');
INSERT INTO `ums_area` VALUES (1474, 361021, 3610, '南城县');
INSERT INTO `ums_area` VALUES (1475, 361022, 3610, '黎川县');
INSERT INTO `ums_area` VALUES (1476, 361023, 3610, '南丰县');
INSERT INTO `ums_area` VALUES (1477, 361024, 3610, '崇仁县');
INSERT INTO `ums_area` VALUES (1478, 361025, 3610, '乐安县');
INSERT INTO `ums_area` VALUES (1479, 361026, 3610, '宜黄县');
INSERT INTO `ums_area` VALUES (1480, 361027, 3610, '金溪县');
INSERT INTO `ums_area` VALUES (1481, 361028, 3610, '资溪县');
INSERT INTO `ums_area` VALUES (1482, 361029, 3610, '东乡县');
INSERT INTO `ums_area` VALUES (1483, 361030, 3610, '广昌县');
INSERT INTO `ums_area` VALUES (1484, 3611, 36, '上饶');
INSERT INTO `ums_area` VALUES (1485, 361101, 3611, '市辖区');
INSERT INTO `ums_area` VALUES (1486, 361102, 3611, '信州区');
INSERT INTO `ums_area` VALUES (1487, 361121, 3611, '上饶县');
INSERT INTO `ums_area` VALUES (1488, 361122, 3611, '广丰县');
INSERT INTO `ums_area` VALUES (1489, 361123, 3611, '玉山县');
INSERT INTO `ums_area` VALUES (1490, 361124, 3611, '铅山县');
INSERT INTO `ums_area` VALUES (1491, 361125, 3611, '横峰县');
INSERT INTO `ums_area` VALUES (1492, 361126, 3611, '弋阳县');
INSERT INTO `ums_area` VALUES (1493, 361127, 3611, '余干县');
INSERT INTO `ums_area` VALUES (1494, 361128, 3611, '波阳县');
INSERT INTO `ums_area` VALUES (1495, 361129, 3611, '万年县');
INSERT INTO `ums_area` VALUES (1496, 361130, 3611, '婺源县');
INSERT INTO `ums_area` VALUES (1497, 361181, 3611, '德兴市');
INSERT INTO `ums_area` VALUES (1498, 37, 0, '山东');
INSERT INTO `ums_area` VALUES (1499, 3701, 37, '济南');
INSERT INTO `ums_area` VALUES (1500, 370101, 3701, '市辖区');
INSERT INTO `ums_area` VALUES (1501, 370102, 3701, '历下区');
INSERT INTO `ums_area` VALUES (1502, 370103, 3701, '市中区');
INSERT INTO `ums_area` VALUES (1503, 370104, 3701, '槐荫区');
INSERT INTO `ums_area` VALUES (1504, 370105, 3701, '天桥区');
INSERT INTO `ums_area` VALUES (1505, 370112, 3701, '历城区');
INSERT INTO `ums_area` VALUES (1506, 370123, 3701, '长清县');
INSERT INTO `ums_area` VALUES (1507, 370124, 3701, '平阴县');
INSERT INTO `ums_area` VALUES (1508, 370125, 3701, '济阳县');
INSERT INTO `ums_area` VALUES (1509, 370126, 3701, '商河县');
INSERT INTO `ums_area` VALUES (1510, 370181, 3701, '章丘市');
INSERT INTO `ums_area` VALUES (1511, 3702, 37, '青岛');
INSERT INTO `ums_area` VALUES (1512, 370201, 3702, '市辖区');
INSERT INTO `ums_area` VALUES (1513, 370202, 3702, '市南区');
INSERT INTO `ums_area` VALUES (1514, 370203, 3702, '市北区');
INSERT INTO `ums_area` VALUES (1515, 370205, 3702, '四方区');
INSERT INTO `ums_area` VALUES (1516, 370211, 3702, '黄岛区');
INSERT INTO `ums_area` VALUES (1517, 370212, 3702, '崂山区');
INSERT INTO `ums_area` VALUES (1518, 370213, 3702, '李沧区');
INSERT INTO `ums_area` VALUES (1519, 370214, 3702, '城阳区');
INSERT INTO `ums_area` VALUES (1520, 370281, 3702, '胶州市');
INSERT INTO `ums_area` VALUES (1521, 370282, 3702, '即墨市');
INSERT INTO `ums_area` VALUES (1522, 370283, 3702, '平度市');
INSERT INTO `ums_area` VALUES (1523, 370284, 3702, '胶南市');
INSERT INTO `ums_area` VALUES (1524, 370285, 3702, '莱西市');
INSERT INTO `ums_area` VALUES (1525, 3703, 37, '淄博');
INSERT INTO `ums_area` VALUES (1526, 370301, 3703, '市辖区');
INSERT INTO `ums_area` VALUES (1527, 370302, 3703, '淄川区');
INSERT INTO `ums_area` VALUES (1528, 370303, 3703, '张店区');
INSERT INTO `ums_area` VALUES (1529, 370304, 3703, '博山区');
INSERT INTO `ums_area` VALUES (1530, 370305, 3703, '临淄区');
INSERT INTO `ums_area` VALUES (1531, 370306, 3703, '周村区');
INSERT INTO `ums_area` VALUES (1532, 370321, 3703, '桓台县');
INSERT INTO `ums_area` VALUES (1533, 370322, 3703, '高青县');
INSERT INTO `ums_area` VALUES (1534, 370323, 3703, '沂源县');
INSERT INTO `ums_area` VALUES (1535, 3704, 37, '枣庄');
INSERT INTO `ums_area` VALUES (1536, 370401, 3704, '市辖区');
INSERT INTO `ums_area` VALUES (1537, 370402, 3704, '市中区');
INSERT INTO `ums_area` VALUES (1538, 370403, 3704, '薛城区');
INSERT INTO `ums_area` VALUES (1539, 370404, 3704, '峄城区');
INSERT INTO `ums_area` VALUES (1540, 370405, 3704, '台儿庄区');
INSERT INTO `ums_area` VALUES (1541, 370406, 3704, '山亭区');
INSERT INTO `ums_area` VALUES (1542, 370481, 3704, '滕州市');
INSERT INTO `ums_area` VALUES (1543, 3705, 37, '东营');
INSERT INTO `ums_area` VALUES (1544, 370501, 3705, '市辖区');
INSERT INTO `ums_area` VALUES (1545, 370502, 3705, '东营区');
INSERT INTO `ums_area` VALUES (1546, 370503, 3705, '河口区');
INSERT INTO `ums_area` VALUES (1547, 370521, 3705, '垦利县');
INSERT INTO `ums_area` VALUES (1548, 370522, 3705, '利津县');
INSERT INTO `ums_area` VALUES (1549, 370523, 3705, '广饶县');
INSERT INTO `ums_area` VALUES (1550, 3706, 37, '烟台');
INSERT INTO `ums_area` VALUES (1551, 370601, 3706, '市辖区');
INSERT INTO `ums_area` VALUES (1552, 370602, 3706, '芝罘区');
INSERT INTO `ums_area` VALUES (1553, 370611, 3706, '福山区');
INSERT INTO `ums_area` VALUES (1554, 370612, 3706, '牟平区');
INSERT INTO `ums_area` VALUES (1555, 370613, 3706, '莱山区');
INSERT INTO `ums_area` VALUES (1556, 370634, 3706, '长岛县');
INSERT INTO `ums_area` VALUES (1557, 370681, 3706, '龙口市');
INSERT INTO `ums_area` VALUES (1558, 370682, 3706, '莱阳市');
INSERT INTO `ums_area` VALUES (1559, 370683, 3706, '莱州市');
INSERT INTO `ums_area` VALUES (1560, 370684, 3706, '蓬莱市');
INSERT INTO `ums_area` VALUES (1561, 370685, 3706, '招远市');
INSERT INTO `ums_area` VALUES (1562, 370686, 3706, '栖霞市');
INSERT INTO `ums_area` VALUES (1563, 370687, 3706, '海阳市');
INSERT INTO `ums_area` VALUES (1564, 3707, 37, '潍坊');
INSERT INTO `ums_area` VALUES (1565, 370701, 3707, '市辖区');
INSERT INTO `ums_area` VALUES (1566, 370702, 3707, '潍城区');
INSERT INTO `ums_area` VALUES (1567, 370703, 3707, '寒亭区');
INSERT INTO `ums_area` VALUES (1568, 370704, 3707, '坊子区');
INSERT INTO `ums_area` VALUES (1569, 370705, 3707, '奎文区');
INSERT INTO `ums_area` VALUES (1570, 370724, 3707, '临朐县');
INSERT INTO `ums_area` VALUES (1571, 370725, 3707, '昌乐县');
INSERT INTO `ums_area` VALUES (1572, 370781, 3707, '青州市');
INSERT INTO `ums_area` VALUES (1573, 370782, 3707, '诸城市');
INSERT INTO `ums_area` VALUES (1574, 370783, 3707, '寿光市');
INSERT INTO `ums_area` VALUES (1575, 370784, 3707, '安丘市');
INSERT INTO `ums_area` VALUES (1576, 370785, 3707, '高密市');
INSERT INTO `ums_area` VALUES (1577, 370786, 3707, '昌邑市');
INSERT INTO `ums_area` VALUES (1578, 3708, 37, '济宁');
INSERT INTO `ums_area` VALUES (1579, 370801, 3708, '市辖区');
INSERT INTO `ums_area` VALUES (1580, 370802, 3708, '市中区');
INSERT INTO `ums_area` VALUES (1581, 370811, 3708, '任城区');
INSERT INTO `ums_area` VALUES (1582, 370826, 3708, '微山县');
INSERT INTO `ums_area` VALUES (1583, 370827, 3708, '鱼台县');
INSERT INTO `ums_area` VALUES (1584, 370828, 3708, '金乡县');
INSERT INTO `ums_area` VALUES (1585, 370829, 3708, '嘉祥县');
INSERT INTO `ums_area` VALUES (1586, 370830, 3708, '汶上县');
INSERT INTO `ums_area` VALUES (1587, 370831, 3708, '泗水县');
INSERT INTO `ums_area` VALUES (1588, 370832, 3708, '梁山县');
INSERT INTO `ums_area` VALUES (1589, 370881, 3708, '曲阜市');
INSERT INTO `ums_area` VALUES (1590, 370882, 3708, '兖州市');
INSERT INTO `ums_area` VALUES (1591, 370883, 3708, '邹城市');
INSERT INTO `ums_area` VALUES (1592, 3709, 37, '泰安');
INSERT INTO `ums_area` VALUES (1593, 370901, 3709, '市辖区');
INSERT INTO `ums_area` VALUES (1594, 370902, 3709, '泰山区');
INSERT INTO `ums_area` VALUES (1595, 370903, 3709, '岱岳区');
INSERT INTO `ums_area` VALUES (1596, 370921, 3709, '宁阳县');
INSERT INTO `ums_area` VALUES (1597, 370923, 3709, '东平县');
INSERT INTO `ums_area` VALUES (1598, 370982, 3709, '新泰市');
INSERT INTO `ums_area` VALUES (1599, 370983, 3709, '肥城市');
INSERT INTO `ums_area` VALUES (1600, 3710, 37, '威海');
INSERT INTO `ums_area` VALUES (1601, 371001, 3710, '市辖区');
INSERT INTO `ums_area` VALUES (1602, 371002, 3710, '环翠区');
INSERT INTO `ums_area` VALUES (1603, 371081, 3710, '文登市');
INSERT INTO `ums_area` VALUES (1604, 371082, 3710, '荣成市');
INSERT INTO `ums_area` VALUES (1605, 371083, 3710, '乳山市');
INSERT INTO `ums_area` VALUES (1606, 3711, 37, '日照');
INSERT INTO `ums_area` VALUES (1607, 371101, 3711, '市辖区');
INSERT INTO `ums_area` VALUES (1608, 371102, 3711, '东港区');
INSERT INTO `ums_area` VALUES (1609, 371121, 3711, '五莲县');
INSERT INTO `ums_area` VALUES (1610, 371122, 3711, '莒 县');
INSERT INTO `ums_area` VALUES (1611, 3712, 37, '莱芜');
INSERT INTO `ums_area` VALUES (1612, 371201, 3712, '市辖区');
INSERT INTO `ums_area` VALUES (1613, 371202, 3712, '莱城区');
INSERT INTO `ums_area` VALUES (1614, 371203, 3712, '钢城区');
INSERT INTO `ums_area` VALUES (1615, 3713, 37, '临沂');
INSERT INTO `ums_area` VALUES (1616, 371301, 3713, '市辖区');
INSERT INTO `ums_area` VALUES (1617, 371302, 3713, '兰山区');
INSERT INTO `ums_area` VALUES (1618, 371311, 3713, '罗庄区');
INSERT INTO `ums_area` VALUES (1619, 371312, 3713, '河东区');
INSERT INTO `ums_area` VALUES (1620, 371321, 3713, '沂南县');
INSERT INTO `ums_area` VALUES (1621, 371322, 3713, '郯城县');
INSERT INTO `ums_area` VALUES (1622, 371323, 3713, '沂水县');
INSERT INTO `ums_area` VALUES (1623, 371324, 3713, '苍山县');
INSERT INTO `ums_area` VALUES (1624, 371325, 3713, '费 县');
INSERT INTO `ums_area` VALUES (1625, 371326, 3713, '平邑县');
INSERT INTO `ums_area` VALUES (1626, 371327, 3713, '莒南县');
INSERT INTO `ums_area` VALUES (1627, 371328, 3713, '蒙阴县');
INSERT INTO `ums_area` VALUES (1628, 371329, 3713, '临沭县');
INSERT INTO `ums_area` VALUES (1629, 3714, 37, '德州');
INSERT INTO `ums_area` VALUES (1630, 371401, 3714, '市辖区');
INSERT INTO `ums_area` VALUES (1631, 371402, 3714, '德城区');
INSERT INTO `ums_area` VALUES (1632, 371421, 3714, '陵 县');
INSERT INTO `ums_area` VALUES (1633, 371422, 3714, '宁津县');
INSERT INTO `ums_area` VALUES (1634, 371423, 3714, '庆云县');
INSERT INTO `ums_area` VALUES (1635, 371424, 3714, '临邑县');
INSERT INTO `ums_area` VALUES (1636, 371425, 3714, '齐河县');
INSERT INTO `ums_area` VALUES (1637, 371426, 3714, '平原县');
INSERT INTO `ums_area` VALUES (1638, 371427, 3714, '夏津县');
INSERT INTO `ums_area` VALUES (1639, 371428, 3714, '武城县');
INSERT INTO `ums_area` VALUES (1640, 371481, 3714, '乐陵市');
INSERT INTO `ums_area` VALUES (1641, 371482, 3714, '禹城市');
INSERT INTO `ums_area` VALUES (1642, 3715, 37, '聊城');
INSERT INTO `ums_area` VALUES (1643, 371501, 3715, '市辖区');
INSERT INTO `ums_area` VALUES (1644, 371502, 3715, '东昌府区');
INSERT INTO `ums_area` VALUES (1645, 371521, 3715, '阳谷县');
INSERT INTO `ums_area` VALUES (1646, 371522, 3715, '莘 县');
INSERT INTO `ums_area` VALUES (1647, 371523, 3715, '茌平县');
INSERT INTO `ums_area` VALUES (1648, 371524, 3715, '东阿县');
INSERT INTO `ums_area` VALUES (1649, 371525, 3715, '冠 县');
INSERT INTO `ums_area` VALUES (1650, 371526, 3715, '高唐县');
INSERT INTO `ums_area` VALUES (1651, 371581, 3715, '临清市');
INSERT INTO `ums_area` VALUES (1652, 3716, 37, '滨州');
INSERT INTO `ums_area` VALUES (1653, 371601, 3716, '市辖区');
INSERT INTO `ums_area` VALUES (1654, 371603, 3716, '滨城区');
INSERT INTO `ums_area` VALUES (1655, 371621, 3716, '惠民县');
INSERT INTO `ums_area` VALUES (1656, 371622, 3716, '阳信县');
INSERT INTO `ums_area` VALUES (1657, 371623, 3716, '无棣县');
INSERT INTO `ums_area` VALUES (1658, 371624, 3716, '沾化县');
INSERT INTO `ums_area` VALUES (1659, 371625, 3716, '博兴县');
INSERT INTO `ums_area` VALUES (1660, 371626, 3716, '邹平县');
INSERT INTO `ums_area` VALUES (1661, 3717, 37, '菏泽');
INSERT INTO `ums_area` VALUES (1662, 371701, 3717, '市辖区');
INSERT INTO `ums_area` VALUES (1663, 371702, 3717, '牡丹区');
INSERT INTO `ums_area` VALUES (1664, 371721, 3717, '曹 县');
INSERT INTO `ums_area` VALUES (1665, 371722, 3717, '单 县');
INSERT INTO `ums_area` VALUES (1666, 371723, 3717, '成武县');
INSERT INTO `ums_area` VALUES (1667, 371724, 3717, '巨野县');
INSERT INTO `ums_area` VALUES (1668, 371725, 3717, '郓城县');
INSERT INTO `ums_area` VALUES (1669, 371726, 3717, '鄄城县');
INSERT INTO `ums_area` VALUES (1670, 371727, 3717, '定陶县');
INSERT INTO `ums_area` VALUES (1671, 371728, 3717, '东明县');
INSERT INTO `ums_area` VALUES (1672, 41, 0, '河南');
INSERT INTO `ums_area` VALUES (1673, 4101, 41, '郑州');
INSERT INTO `ums_area` VALUES (1674, 410101, 4101, '市辖区');
INSERT INTO `ums_area` VALUES (1675, 410102, 4101, '中原区');
INSERT INTO `ums_area` VALUES (1676, 410103, 4101, '二七区');
INSERT INTO `ums_area` VALUES (1677, 410104, 4101, '管城回族区');
INSERT INTO `ums_area` VALUES (1678, 410105, 4101, '金水区');
INSERT INTO `ums_area` VALUES (1679, 410106, 4101, '上街区');
INSERT INTO `ums_area` VALUES (1680, 410108, 4101, '邙山区');
INSERT INTO `ums_area` VALUES (1681, 410122, 4101, '中牟县');
INSERT INTO `ums_area` VALUES (1682, 410181, 4101, '巩义市');
INSERT INTO `ums_area` VALUES (1683, 410182, 4101, '荥阳市');
INSERT INTO `ums_area` VALUES (1684, 410183, 4101, '新密市');
INSERT INTO `ums_area` VALUES (1685, 410184, 4101, '新郑市');
INSERT INTO `ums_area` VALUES (1686, 410185, 4101, '登封市');
INSERT INTO `ums_area` VALUES (1687, 4102, 41, '开封');
INSERT INTO `ums_area` VALUES (1688, 410201, 4102, '市辖区');
INSERT INTO `ums_area` VALUES (1689, 410202, 4102, '龙亭区');
INSERT INTO `ums_area` VALUES (1690, 410203, 4102, '顺河回族区');
INSERT INTO `ums_area` VALUES (1691, 410204, 4102, '鼓楼区');
INSERT INTO `ums_area` VALUES (1692, 410205, 4102, '南关区');
INSERT INTO `ums_area` VALUES (1693, 410211, 4102, '郊 区');
INSERT INTO `ums_area` VALUES (1694, 410221, 4102, '杞 县');
INSERT INTO `ums_area` VALUES (1695, 410222, 4102, '通许县');
INSERT INTO `ums_area` VALUES (1696, 410223, 4102, '尉氏县');
INSERT INTO `ums_area` VALUES (1697, 410224, 4102, '开封县');
INSERT INTO `ums_area` VALUES (1698, 410225, 4102, '兰考县');
INSERT INTO `ums_area` VALUES (1699, 4103, 41, '洛阳');
INSERT INTO `ums_area` VALUES (1700, 410301, 4103, '市辖区');
INSERT INTO `ums_area` VALUES (1701, 410302, 4103, '老城区');
INSERT INTO `ums_area` VALUES (1702, 410303, 4103, '西工区');
INSERT INTO `ums_area` VALUES (1703, 410304, 4103, '廛河回族区');
INSERT INTO `ums_area` VALUES (1704, 410305, 4103, '涧西区');
INSERT INTO `ums_area` VALUES (1705, 410306, 4103, '吉利区');
INSERT INTO `ums_area` VALUES (1706, 410307, 4103, '洛龙区');
INSERT INTO `ums_area` VALUES (1707, 410322, 4103, '孟津县');
INSERT INTO `ums_area` VALUES (1708, 410323, 4103, '新安县');
INSERT INTO `ums_area` VALUES (1709, 410324, 4103, '栾川县');
INSERT INTO `ums_area` VALUES (1710, 410325, 4103, '嵩 县');
INSERT INTO `ums_area` VALUES (1711, 410326, 4103, '汝阳县');
INSERT INTO `ums_area` VALUES (1712, 410327, 4103, '宜阳县');
INSERT INTO `ums_area` VALUES (1713, 410328, 4103, '洛宁县');
INSERT INTO `ums_area` VALUES (1714, 410329, 4103, '伊川县');
INSERT INTO `ums_area` VALUES (1715, 410381, 4103, '偃师市');
INSERT INTO `ums_area` VALUES (1716, 4104, 41, '平顶山');
INSERT INTO `ums_area` VALUES (1717, 410401, 4104, '市辖区');
INSERT INTO `ums_area` VALUES (1718, 410402, 4104, '新华区');
INSERT INTO `ums_area` VALUES (1719, 410403, 4104, '卫东区');
INSERT INTO `ums_area` VALUES (1720, 410404, 4104, '石龙区');
INSERT INTO `ums_area` VALUES (1721, 410411, 4104, '湛河区');
INSERT INTO `ums_area` VALUES (1722, 410421, 4104, '宝丰县');
INSERT INTO `ums_area` VALUES (1723, 410422, 4104, '叶 县');
INSERT INTO `ums_area` VALUES (1724, 410423, 4104, '鲁山县');
INSERT INTO `ums_area` VALUES (1725, 410425, 4104, '郏 县');
INSERT INTO `ums_area` VALUES (1726, 410481, 4104, '舞钢市');
INSERT INTO `ums_area` VALUES (1727, 410482, 4104, '汝州市');
INSERT INTO `ums_area` VALUES (1728, 4105, 41, '安阳');
INSERT INTO `ums_area` VALUES (1729, 410501, 4105, '市辖区');
INSERT INTO `ums_area` VALUES (1730, 410502, 4105, '文峰区');
INSERT INTO `ums_area` VALUES (1731, 410503, 4105, '北关区');
INSERT INTO `ums_area` VALUES (1732, 410504, 4105, '铁西区');
INSERT INTO `ums_area` VALUES (1733, 410511, 4105, '郊 区');
INSERT INTO `ums_area` VALUES (1734, 410522, 4105, '安阳县');
INSERT INTO `ums_area` VALUES (1735, 410523, 4105, '汤阴县');
INSERT INTO `ums_area` VALUES (1736, 410526, 4105, '滑 县');
INSERT INTO `ums_area` VALUES (1737, 410527, 4105, '内黄县');
INSERT INTO `ums_area` VALUES (1738, 410581, 4105, '林州市');
INSERT INTO `ums_area` VALUES (1739, 4106, 41, '鹤壁');
INSERT INTO `ums_area` VALUES (1740, 410601, 4106, '市辖区');
INSERT INTO `ums_area` VALUES (1741, 410602, 4106, '鹤山区');
INSERT INTO `ums_area` VALUES (1742, 410603, 4106, '山城区');
INSERT INTO `ums_area` VALUES (1743, 410611, 4106, '郊 区');
INSERT INTO `ums_area` VALUES (1744, 410621, 4106, '浚 县');
INSERT INTO `ums_area` VALUES (1745, 410622, 4106, '淇 县');
INSERT INTO `ums_area` VALUES (1746, 4107, 41, '新乡');
INSERT INTO `ums_area` VALUES (1747, 410701, 4107, '市辖区');
INSERT INTO `ums_area` VALUES (1748, 410702, 4107, '红旗区');
INSERT INTO `ums_area` VALUES (1749, 410703, 4107, '新华区');
INSERT INTO `ums_area` VALUES (1750, 410704, 4107, '北站区');
INSERT INTO `ums_area` VALUES (1751, 410711, 4107, '郊 区');
INSERT INTO `ums_area` VALUES (1752, 410721, 4107, '新乡县');
INSERT INTO `ums_area` VALUES (1753, 410724, 4107, '获嘉县');
INSERT INTO `ums_area` VALUES (1754, 410725, 4107, '原阳县');
INSERT INTO `ums_area` VALUES (1755, 410726, 4107, '延津县');
INSERT INTO `ums_area` VALUES (1756, 410727, 4107, '封丘县');
INSERT INTO `ums_area` VALUES (1757, 410728, 4107, '长垣县');
INSERT INTO `ums_area` VALUES (1758, 410781, 4107, '卫辉市');
INSERT INTO `ums_area` VALUES (1759, 410782, 4107, '辉县市');
INSERT INTO `ums_area` VALUES (1760, 4108, 41, '焦作');
INSERT INTO `ums_area` VALUES (1761, 410801, 4108, '市辖区');
INSERT INTO `ums_area` VALUES (1762, 410802, 4108, '解放区');
INSERT INTO `ums_area` VALUES (1763, 410803, 4108, '中站区');
INSERT INTO `ums_area` VALUES (1764, 410804, 4108, '马村区');
INSERT INTO `ums_area` VALUES (1765, 410811, 4108, '山阳区');
INSERT INTO `ums_area` VALUES (1766, 410821, 4108, '修武县');
INSERT INTO `ums_area` VALUES (1767, 410822, 4108, '博爱县');
INSERT INTO `ums_area` VALUES (1768, 410823, 4108, '武陟县');
INSERT INTO `ums_area` VALUES (1769, 410825, 4108, '温 县');
INSERT INTO `ums_area` VALUES (1770, 410881, 4108, '济源市');
INSERT INTO `ums_area` VALUES (1771, 410882, 4108, '沁阳市');
INSERT INTO `ums_area` VALUES (1772, 410883, 4108, '孟州市');
INSERT INTO `ums_area` VALUES (1773, 4109, 41, '濮阳');
INSERT INTO `ums_area` VALUES (1774, 410901, 4109, '市辖区');
INSERT INTO `ums_area` VALUES (1775, 410902, 4109, '市 区');
INSERT INTO `ums_area` VALUES (1776, 410922, 4109, '清丰县');
INSERT INTO `ums_area` VALUES (1777, 410923, 4109, '南乐县');
INSERT INTO `ums_area` VALUES (1778, 410926, 4109, '范 县');
INSERT INTO `ums_area` VALUES (1779, 410927, 4109, '台前县');
INSERT INTO `ums_area` VALUES (1780, 410928, 4109, '濮阳县');
INSERT INTO `ums_area` VALUES (1781, 4110, 41, '许昌');
INSERT INTO `ums_area` VALUES (1782, 411001, 4110, '市辖区');
INSERT INTO `ums_area` VALUES (1783, 411002, 4110, '魏都区');
INSERT INTO `ums_area` VALUES (1784, 411023, 4110, '许昌县');
INSERT INTO `ums_area` VALUES (1785, 411024, 4110, '鄢陵县');
INSERT INTO `ums_area` VALUES (1786, 411025, 4110, '襄城县');
INSERT INTO `ums_area` VALUES (1787, 411081, 4110, '禹州市');
INSERT INTO `ums_area` VALUES (1788, 411082, 4110, '长葛市');
INSERT INTO `ums_area` VALUES (1789, 4111, 41, '漯河');
INSERT INTO `ums_area` VALUES (1790, 411101, 4111, '市辖区');
INSERT INTO `ums_area` VALUES (1791, 411102, 4111, '源汇区');
INSERT INTO `ums_area` VALUES (1792, 411121, 4111, '舞阳县');
INSERT INTO `ums_area` VALUES (1793, 411122, 4111, '临颍县');
INSERT INTO `ums_area` VALUES (1794, 411123, 4111, '郾城县');
INSERT INTO `ums_area` VALUES (1795, 4112, 41, '三门峡');
INSERT INTO `ums_area` VALUES (1796, 411201, 4112, '市辖区');
INSERT INTO `ums_area` VALUES (1797, 411202, 4112, '湖滨区');
INSERT INTO `ums_area` VALUES (1798, 411221, 4112, '渑池县');
INSERT INTO `ums_area` VALUES (1799, 411222, 4112, '陕 县');
INSERT INTO `ums_area` VALUES (1800, 411224, 4112, '卢氏县');
INSERT INTO `ums_area` VALUES (1801, 411281, 4112, '义马市');
INSERT INTO `ums_area` VALUES (1802, 411282, 4112, '灵宝市');
INSERT INTO `ums_area` VALUES (1803, 4113, 41, '南阳');
INSERT INTO `ums_area` VALUES (1804, 411301, 4113, '市辖区');
INSERT INTO `ums_area` VALUES (1805, 411302, 4113, '宛城区');
INSERT INTO `ums_area` VALUES (1806, 411303, 4113, '卧龙区');
INSERT INTO `ums_area` VALUES (1807, 411321, 4113, '南召县');
INSERT INTO `ums_area` VALUES (1808, 411322, 4113, '方城县');
INSERT INTO `ums_area` VALUES (1809, 411323, 4113, '西峡县');
INSERT INTO `ums_area` VALUES (1810, 411324, 4113, '镇平县');
INSERT INTO `ums_area` VALUES (1811, 411325, 4113, '内乡县');
INSERT INTO `ums_area` VALUES (1812, 411326, 4113, '淅川县');
INSERT INTO `ums_area` VALUES (1813, 411327, 4113, '社旗县');
INSERT INTO `ums_area` VALUES (1814, 411328, 4113, '唐河县');
INSERT INTO `ums_area` VALUES (1815, 411329, 4113, '新野县');
INSERT INTO `ums_area` VALUES (1816, 411330, 4113, '桐柏县');
INSERT INTO `ums_area` VALUES (1817, 411381, 4113, '邓州市');
INSERT INTO `ums_area` VALUES (1818, 4114, 41, '商丘');
INSERT INTO `ums_area` VALUES (1819, 411401, 4114, '市辖区');
INSERT INTO `ums_area` VALUES (1820, 411402, 4114, '梁园区');
INSERT INTO `ums_area` VALUES (1821, 411403, 4114, '睢阳区');
INSERT INTO `ums_area` VALUES (1822, 411421, 4114, '民权县');
INSERT INTO `ums_area` VALUES (1823, 411422, 4114, '睢 县');
INSERT INTO `ums_area` VALUES (1824, 411423, 4114, '宁陵县');
INSERT INTO `ums_area` VALUES (1825, 411424, 4114, '柘城县');
INSERT INTO `ums_area` VALUES (1826, 411425, 4114, '虞城县');
INSERT INTO `ums_area` VALUES (1827, 411426, 4114, '夏邑县');
INSERT INTO `ums_area` VALUES (1828, 411481, 4114, '永城市');
INSERT INTO `ums_area` VALUES (1829, 4115, 41, '信阳');
INSERT INTO `ums_area` VALUES (1830, 411501, 4115, '市辖区');
INSERT INTO `ums_area` VALUES (1831, 411502, 4115, '师河区');
INSERT INTO `ums_area` VALUES (1832, 411503, 4115, '平桥区');
INSERT INTO `ums_area` VALUES (1833, 411521, 4115, '罗山县');
INSERT INTO `ums_area` VALUES (1834, 411522, 4115, '光山县');
INSERT INTO `ums_area` VALUES (1835, 411523, 4115, '新 县');
INSERT INTO `ums_area` VALUES (1836, 411524, 4115, '商城县');
INSERT INTO `ums_area` VALUES (1837, 411525, 4115, '固始县');
INSERT INTO `ums_area` VALUES (1838, 411526, 4115, '潢川县');
INSERT INTO `ums_area` VALUES (1839, 411527, 4115, '淮滨县');
INSERT INTO `ums_area` VALUES (1840, 411528, 4115, '息 县');
INSERT INTO `ums_area` VALUES (1841, 4116, 41, '周口');
INSERT INTO `ums_area` VALUES (1842, 411601, 4116, '市辖区');
INSERT INTO `ums_area` VALUES (1843, 411602, 4116, '川汇区');
INSERT INTO `ums_area` VALUES (1844, 411621, 4116, '扶沟县');
INSERT INTO `ums_area` VALUES (1845, 411622, 4116, '西华县');
INSERT INTO `ums_area` VALUES (1846, 411623, 4116, '商水县');
INSERT INTO `ums_area` VALUES (1847, 411624, 4116, '沈丘县');
INSERT INTO `ums_area` VALUES (1848, 411625, 4116, '郸城县');
INSERT INTO `ums_area` VALUES (1849, 411626, 4116, '淮阳县');
INSERT INTO `ums_area` VALUES (1850, 411627, 4116, '太康县');
INSERT INTO `ums_area` VALUES (1851, 411628, 4116, '鹿邑县');
INSERT INTO `ums_area` VALUES (1852, 411681, 4116, '项城市');
INSERT INTO `ums_area` VALUES (1853, 4117, 41, '驻马店');
INSERT INTO `ums_area` VALUES (1854, 411701, 4117, '市辖区');
INSERT INTO `ums_area` VALUES (1855, 411702, 4117, '驿城区');
INSERT INTO `ums_area` VALUES (1856, 411721, 4117, '西平县');
INSERT INTO `ums_area` VALUES (1857, 411722, 4117, '上蔡县');
INSERT INTO `ums_area` VALUES (1858, 411723, 4117, '平舆县');
INSERT INTO `ums_area` VALUES (1859, 411724, 4117, '正阳县');
INSERT INTO `ums_area` VALUES (1860, 411725, 4117, '确山县');
INSERT INTO `ums_area` VALUES (1861, 411726, 4117, '泌阳县');
INSERT INTO `ums_area` VALUES (1862, 411727, 4117, '汝南县');
INSERT INTO `ums_area` VALUES (1863, 411728, 4117, '遂平县');
INSERT INTO `ums_area` VALUES (1864, 411729, 4117, '新蔡县');
INSERT INTO `ums_area` VALUES (1865, 42, 0, '湖北');
INSERT INTO `ums_area` VALUES (1866, 4201, 42, '武汉');
INSERT INTO `ums_area` VALUES (1867, 420101, 4201, '市辖区');
INSERT INTO `ums_area` VALUES (1868, 420102, 4201, '江岸区');
INSERT INTO `ums_area` VALUES (1869, 420103, 4201, '江汉区');
INSERT INTO `ums_area` VALUES (1870, 420104, 4201, '乔口区');
INSERT INTO `ums_area` VALUES (1871, 420105, 4201, '汉阳区');
INSERT INTO `ums_area` VALUES (1872, 420106, 4201, '武昌区');
INSERT INTO `ums_area` VALUES (1873, 420107, 4201, '青山区');
INSERT INTO `ums_area` VALUES (1874, 420111, 4201, '洪山区');
INSERT INTO `ums_area` VALUES (1875, 420112, 4201, '东西湖区');
INSERT INTO `ums_area` VALUES (1876, 420113, 4201, '汉南区');
INSERT INTO `ums_area` VALUES (1877, 420114, 4201, '蔡甸区');
INSERT INTO `ums_area` VALUES (1878, 420115, 4201, '江夏区');
INSERT INTO `ums_area` VALUES (1879, 420116, 4201, '黄陂区');
INSERT INTO `ums_area` VALUES (1880, 420117, 4201, '新洲区');
INSERT INTO `ums_area` VALUES (1881, 4202, 42, '黄石');
INSERT INTO `ums_area` VALUES (1882, 420201, 4202, '市辖区');
INSERT INTO `ums_area` VALUES (1883, 420202, 4202, '黄石港区');
INSERT INTO `ums_area` VALUES (1884, 420203, 4202, '石灰窑区');
INSERT INTO `ums_area` VALUES (1885, 420204, 4202, '下陆区');
INSERT INTO `ums_area` VALUES (1886, 420205, 4202, '铁山区');
INSERT INTO `ums_area` VALUES (1887, 420222, 4202, '阳新县');
INSERT INTO `ums_area` VALUES (1888, 420281, 4202, '大冶市');
INSERT INTO `ums_area` VALUES (1889, 4203, 42, '十堰');
INSERT INTO `ums_area` VALUES (1890, 420301, 4203, '市辖区');
INSERT INTO `ums_area` VALUES (1891, 420302, 4203, '茅箭区');
INSERT INTO `ums_area` VALUES (1892, 420303, 4203, '张湾区');
INSERT INTO `ums_area` VALUES (1893, 420321, 4203, '郧 县');
INSERT INTO `ums_area` VALUES (1894, 420322, 4203, '郧西县');
INSERT INTO `ums_area` VALUES (1895, 420323, 4203, '竹山县');
INSERT INTO `ums_area` VALUES (1896, 420324, 4203, '竹溪县');
INSERT INTO `ums_area` VALUES (1897, 420325, 4203, '房 县');
INSERT INTO `ums_area` VALUES (1898, 420381, 4203, '丹江口市');
INSERT INTO `ums_area` VALUES (1899, 4205, 42, '宜昌');
INSERT INTO `ums_area` VALUES (1900, 420501, 4205, '市辖区');
INSERT INTO `ums_area` VALUES (1901, 420502, 4205, '西陵区');
INSERT INTO `ums_area` VALUES (1902, 420503, 4205, '伍家岗区');
INSERT INTO `ums_area` VALUES (1903, 420504, 4205, '点军区');
INSERT INTO `ums_area` VALUES (1904, 420505, 4205, '虎亭区');
INSERT INTO `ums_area` VALUES (1905, 420521, 4205, '宜昌县');
INSERT INTO `ums_area` VALUES (1906, 420525, 4205, '远安县');
INSERT INTO `ums_area` VALUES (1907, 420526, 4205, '兴山县');
INSERT INTO `ums_area` VALUES (1908, 420527, 4205, '秭归县');
INSERT INTO `ums_area` VALUES (1909, 420528, 4205, '长阳土家族自治县');
INSERT INTO `ums_area` VALUES (1910, 420529, 4205, '五峰土家族自治县');
INSERT INTO `ums_area` VALUES (1911, 420581, 4205, '宜都市');
INSERT INTO `ums_area` VALUES (1912, 420582, 4205, '当阳市');
INSERT INTO `ums_area` VALUES (1913, 420583, 4205, '枝江市');
INSERT INTO `ums_area` VALUES (1914, 4206, 42, '襄樊');
INSERT INTO `ums_area` VALUES (1915, 420601, 4206, '市辖区');
INSERT INTO `ums_area` VALUES (1916, 420602, 4206, '襄城区');
INSERT INTO `ums_area` VALUES (1917, 420606, 4206, '樊城区');
INSERT INTO `ums_area` VALUES (1918, 420621, 4206, '襄阳县');
INSERT INTO `ums_area` VALUES (1919, 420624, 4206, '南漳县');
INSERT INTO `ums_area` VALUES (1920, 420625, 4206, '谷城县');
INSERT INTO `ums_area` VALUES (1921, 420626, 4206, '保康县');
INSERT INTO `ums_area` VALUES (1922, 420682, 4206, '老河口市');
INSERT INTO `ums_area` VALUES (1923, 420683, 4206, '枣阳市');
INSERT INTO `ums_area` VALUES (1924, 420684, 4206, '宜城市');
INSERT INTO `ums_area` VALUES (1925, 4207, 42, '鄂州');
INSERT INTO `ums_area` VALUES (1926, 420701, 4207, '市辖区');
INSERT INTO `ums_area` VALUES (1927, 420702, 4207, '梁子湖区');
INSERT INTO `ums_area` VALUES (1928, 420703, 4207, '华容区');
INSERT INTO `ums_area` VALUES (1929, 420704, 4207, '鄂城区');
INSERT INTO `ums_area` VALUES (1930, 4208, 42, '荆门');
INSERT INTO `ums_area` VALUES (1931, 420801, 4208, '市辖区');
INSERT INTO `ums_area` VALUES (1932, 420802, 4208, '东宝区');
INSERT INTO `ums_area` VALUES (1933, 420821, 4208, '京山县');
INSERT INTO `ums_area` VALUES (1934, 420822, 4208, '沙洋县');
INSERT INTO `ums_area` VALUES (1935, 420881, 4208, '钟祥市');
INSERT INTO `ums_area` VALUES (1936, 4209, 42, '孝感');
INSERT INTO `ums_area` VALUES (1937, 420901, 4209, '市辖区');
INSERT INTO `ums_area` VALUES (1938, 420902, 4209, '孝南区');
INSERT INTO `ums_area` VALUES (1939, 420921, 4209, '孝昌县');
INSERT INTO `ums_area` VALUES (1940, 420922, 4209, '大悟县');
INSERT INTO `ums_area` VALUES (1941, 420923, 4209, '云梦县');
INSERT INTO `ums_area` VALUES (1942, 420981, 4209, '应城市');
INSERT INTO `ums_area` VALUES (1943, 420982, 4209, '安陆市');
INSERT INTO `ums_area` VALUES (1944, 420984, 4209, '汉川市');
INSERT INTO `ums_area` VALUES (1945, 4210, 42, '荆州');
INSERT INTO `ums_area` VALUES (1946, 421001, 4210, '市辖区');
INSERT INTO `ums_area` VALUES (1947, 421002, 4210, '沙市区');
INSERT INTO `ums_area` VALUES (1948, 421003, 4210, '荆州区');
INSERT INTO `ums_area` VALUES (1949, 421022, 4210, '公安县');
INSERT INTO `ums_area` VALUES (1950, 421023, 4210, '监利县');
INSERT INTO `ums_area` VALUES (1951, 421024, 4210, '江陵县');
INSERT INTO `ums_area` VALUES (1952, 421081, 4210, '石首市');
INSERT INTO `ums_area` VALUES (1953, 421083, 4210, '洪湖市');
INSERT INTO `ums_area` VALUES (1954, 421087, 4210, '松滋市');
INSERT INTO `ums_area` VALUES (1955, 4211, 42, '黄冈');
INSERT INTO `ums_area` VALUES (1956, 421101, 4211, '市辖区');
INSERT INTO `ums_area` VALUES (1957, 421102, 4211, '黄州区');
INSERT INTO `ums_area` VALUES (1958, 421121, 4211, '团风县');
INSERT INTO `ums_area` VALUES (1959, 421122, 4211, '红安县');
INSERT INTO `ums_area` VALUES (1960, 421123, 4211, '罗田县');
INSERT INTO `ums_area` VALUES (1961, 421124, 4211, '英山县');
INSERT INTO `ums_area` VALUES (1962, 421125, 4211, '浠水县');
INSERT INTO `ums_area` VALUES (1963, 421126, 4211, '蕲春县');
INSERT INTO `ums_area` VALUES (1964, 421127, 4211, '黄梅县');
INSERT INTO `ums_area` VALUES (1965, 421181, 4211, '麻城市');
INSERT INTO `ums_area` VALUES (1966, 421182, 4211, '武穴市');
INSERT INTO `ums_area` VALUES (1967, 4212, 42, '咸宁');
INSERT INTO `ums_area` VALUES (1968, 421201, 4212, '市辖区');
INSERT INTO `ums_area` VALUES (1969, 421202, 4212, '咸安区');
INSERT INTO `ums_area` VALUES (1970, 421221, 4212, '嘉鱼县');
INSERT INTO `ums_area` VALUES (1971, 421222, 4212, '通城县');
INSERT INTO `ums_area` VALUES (1972, 421223, 4212, '崇阳县');
INSERT INTO `ums_area` VALUES (1973, 421224, 4212, '通山县');
INSERT INTO `ums_area` VALUES (1974, 421281, 4212, '赤壁市');
INSERT INTO `ums_area` VALUES (1975, 4213, 42, '随州');
INSERT INTO `ums_area` VALUES (1976, 421301, 4213, '市辖区');
INSERT INTO `ums_area` VALUES (1977, 421302, 4213, '曾都区');
INSERT INTO `ums_area` VALUES (1978, 421381, 4213, '广水市');
INSERT INTO `ums_area` VALUES (1979, 4228, 42, '恩施土家族苗族自治州');
INSERT INTO `ums_area` VALUES (1980, 422801, 4228, '恩施市');
INSERT INTO `ums_area` VALUES (1981, 422802, 4228, '利川市');
INSERT INTO `ums_area` VALUES (1982, 422822, 4228, '建始县');
INSERT INTO `ums_area` VALUES (1983, 422823, 4228, '巴东县');
INSERT INTO `ums_area` VALUES (1984, 422825, 4228, '宣恩县');
INSERT INTO `ums_area` VALUES (1985, 422826, 4228, '咸丰县');
INSERT INTO `ums_area` VALUES (1986, 422827, 4228, '来凤县');
INSERT INTO `ums_area` VALUES (1987, 422828, 4228, '鹤峰县');
INSERT INTO `ums_area` VALUES (1988, 4290, 42, '省直辖行政单位');
INSERT INTO `ums_area` VALUES (1989, 429004, 4290, '仙桃市');
INSERT INTO `ums_area` VALUES (1990, 429005, 4290, '潜江市');
INSERT INTO `ums_area` VALUES (1991, 429006, 4290, '天门市');
INSERT INTO `ums_area` VALUES (1992, 429021, 4290, '神农架林区');
INSERT INTO `ums_area` VALUES (1993, 43, 0, '湖南');
INSERT INTO `ums_area` VALUES (1994, 4301, 43, '长沙');
INSERT INTO `ums_area` VALUES (1995, 430101, 4301, '市辖区');
INSERT INTO `ums_area` VALUES (1996, 430102, 4301, '芙蓉区');
INSERT INTO `ums_area` VALUES (1997, 430103, 4301, '天心区');
INSERT INTO `ums_area` VALUES (1998, 430104, 4301, '岳麓区');
INSERT INTO `ums_area` VALUES (1999, 430105, 4301, '开福区');
INSERT INTO `ums_area` VALUES (2000, 430111, 4301, '雨花区');
INSERT INTO `ums_area` VALUES (2001, 430121, 4301, '长沙县');
INSERT INTO `ums_area` VALUES (2002, 430122, 4301, '望城县');
INSERT INTO `ums_area` VALUES (2003, 430124, 4301, '宁乡县');
INSERT INTO `ums_area` VALUES (2004, 430181, 4301, '浏阳市');
INSERT INTO `ums_area` VALUES (2005, 4302, 43, '株洲');
INSERT INTO `ums_area` VALUES (2006, 430201, 4302, '市辖区');
INSERT INTO `ums_area` VALUES (2007, 430202, 4302, '荷塘区');
INSERT INTO `ums_area` VALUES (2008, 430203, 4302, '芦淞区');
INSERT INTO `ums_area` VALUES (2009, 430204, 4302, '石峰区');
INSERT INTO `ums_area` VALUES (2010, 430211, 4302, '天元区');
INSERT INTO `ums_area` VALUES (2011, 430221, 4302, '株洲县');
INSERT INTO `ums_area` VALUES (2012, 430223, 4302, '攸 县');
INSERT INTO `ums_area` VALUES (2013, 430224, 4302, '茶陵县');
INSERT INTO `ums_area` VALUES (2014, 430225, 4302, '炎陵县');
INSERT INTO `ums_area` VALUES (2015, 430281, 4302, '醴陵市');
INSERT INTO `ums_area` VALUES (2016, 4303, 43, '湘潭');
INSERT INTO `ums_area` VALUES (2017, 430301, 4303, '市辖区');
INSERT INTO `ums_area` VALUES (2018, 430302, 4303, '雨湖区');
INSERT INTO `ums_area` VALUES (2019, 430304, 4303, '岳塘区');
INSERT INTO `ums_area` VALUES (2020, 430321, 4303, '湘潭县');
INSERT INTO `ums_area` VALUES (2021, 430381, 4303, '湘乡市');
INSERT INTO `ums_area` VALUES (2022, 430382, 4303, '韶山市');
INSERT INTO `ums_area` VALUES (2023, 4304, 43, '衡阳');
INSERT INTO `ums_area` VALUES (2024, 430401, 4304, '市辖区');
INSERT INTO `ums_area` VALUES (2025, 430402, 4304, '江东区');
INSERT INTO `ums_area` VALUES (2026, 430403, 4304, '城南区');
INSERT INTO `ums_area` VALUES (2027, 430404, 4304, '城北区');
INSERT INTO `ums_area` VALUES (2028, 430411, 4304, '郊 区');
INSERT INTO `ums_area` VALUES (2029, 430412, 4304, '南岳区');
INSERT INTO `ums_area` VALUES (2030, 430421, 4304, '衡阳县');
INSERT INTO `ums_area` VALUES (2031, 430422, 4304, '衡南县');
INSERT INTO `ums_area` VALUES (2032, 430423, 4304, '衡山县');
INSERT INTO `ums_area` VALUES (2033, 430424, 4304, '衡东县');
INSERT INTO `ums_area` VALUES (2034, 430426, 4304, '祁东县');
INSERT INTO `ums_area` VALUES (2035, 430481, 4304, '耒阳市');
INSERT INTO `ums_area` VALUES (2036, 430482, 4304, '常宁市');
INSERT INTO `ums_area` VALUES (2037, 4305, 43, '邵阳');
INSERT INTO `ums_area` VALUES (2038, 430501, 4305, '市辖区');
INSERT INTO `ums_area` VALUES (2039, 430502, 4305, '双清区');
INSERT INTO `ums_area` VALUES (2040, 430503, 4305, '大祥区');
INSERT INTO `ums_area` VALUES (2041, 430511, 4305, '北塔区');
INSERT INTO `ums_area` VALUES (2042, 430521, 4305, '邵东县');
INSERT INTO `ums_area` VALUES (2043, 430522, 4305, '新邵县');
INSERT INTO `ums_area` VALUES (2044, 430523, 4305, '邵阳县');
INSERT INTO `ums_area` VALUES (2045, 430524, 4305, '隆回县');
INSERT INTO `ums_area` VALUES (2046, 430525, 4305, '洞口县');
INSERT INTO `ums_area` VALUES (2047, 430527, 4305, '绥宁县');
INSERT INTO `ums_area` VALUES (2048, 430528, 4305, '新宁县');
INSERT INTO `ums_area` VALUES (2049, 430529, 4305, '城步苗族自治县');
INSERT INTO `ums_area` VALUES (2050, 430581, 4305, '武冈市');
INSERT INTO `ums_area` VALUES (2051, 4306, 43, '岳阳');
INSERT INTO `ums_area` VALUES (2052, 430601, 4306, '市辖区');
INSERT INTO `ums_area` VALUES (2053, 430602, 4306, '岳阳楼区');
INSERT INTO `ums_area` VALUES (2054, 430603, 4306, '云溪区');
INSERT INTO `ums_area` VALUES (2055, 430611, 4306, '君山区');
INSERT INTO `ums_area` VALUES (2056, 430621, 4306, '岳阳县');
INSERT INTO `ums_area` VALUES (2057, 430623, 4306, '华容县');
INSERT INTO `ums_area` VALUES (2058, 430624, 4306, '湘阴县');
INSERT INTO `ums_area` VALUES (2059, 430626, 4306, '平江县');
INSERT INTO `ums_area` VALUES (2060, 430681, 4306, '汨罗市');
INSERT INTO `ums_area` VALUES (2061, 430682, 4306, '临湘市');
INSERT INTO `ums_area` VALUES (2062, 4307, 43, '常德');
INSERT INTO `ums_area` VALUES (2063, 430701, 4307, '市辖区');
INSERT INTO `ums_area` VALUES (2064, 430702, 4307, '武陵区');
INSERT INTO `ums_area` VALUES (2065, 430703, 4307, '鼎城区');
INSERT INTO `ums_area` VALUES (2066, 430721, 4307, '安乡县');
INSERT INTO `ums_area` VALUES (2067, 430722, 4307, '汉寿县');
INSERT INTO `ums_area` VALUES (2068, 430723, 4307, '澧 县');
INSERT INTO `ums_area` VALUES (2069, 430724, 4307, '临澧县');
INSERT INTO `ums_area` VALUES (2070, 430725, 4307, '桃源县');
INSERT INTO `ums_area` VALUES (2071, 430726, 4307, '石门县');
INSERT INTO `ums_area` VALUES (2072, 430781, 4307, '津市市');
INSERT INTO `ums_area` VALUES (2073, 4308, 43, '张家界');
INSERT INTO `ums_area` VALUES (2074, 430801, 4308, '市辖区');
INSERT INTO `ums_area` VALUES (2075, 430802, 4308, '永定区');
INSERT INTO `ums_area` VALUES (2076, 430811, 4308, '武陵源区');
INSERT INTO `ums_area` VALUES (2077, 430821, 4308, '慈利县');
INSERT INTO `ums_area` VALUES (2078, 430822, 4308, '桑植县');
INSERT INTO `ums_area` VALUES (2079, 4309, 43, '益阳');
INSERT INTO `ums_area` VALUES (2080, 430901, 4309, '市辖区');
INSERT INTO `ums_area` VALUES (2081, 430902, 4309, '资阳区');
INSERT INTO `ums_area` VALUES (2082, 430903, 4309, '赫山区');
INSERT INTO `ums_area` VALUES (2083, 430921, 4309, '南 县');
INSERT INTO `ums_area` VALUES (2084, 430922, 4309, '桃江县');
INSERT INTO `ums_area` VALUES (2085, 430923, 4309, '安化县');
INSERT INTO `ums_area` VALUES (2086, 430981, 4309, '沅江市');
INSERT INTO `ums_area` VALUES (2087, 4310, 43, '郴州');
INSERT INTO `ums_area` VALUES (2088, 431001, 4310, '市辖区');
INSERT INTO `ums_area` VALUES (2089, 431002, 4310, '北湖区');
INSERT INTO `ums_area` VALUES (2090, 431003, 4310, '苏仙区');
INSERT INTO `ums_area` VALUES (2091, 431021, 4310, '桂阳县');
INSERT INTO `ums_area` VALUES (2092, 431022, 4310, '宜章县');
INSERT INTO `ums_area` VALUES (2093, 431023, 4310, '永兴县');
INSERT INTO `ums_area` VALUES (2094, 431024, 4310, '嘉禾县');
INSERT INTO `ums_area` VALUES (2095, 431025, 4310, '临武县');
INSERT INTO `ums_area` VALUES (2096, 431026, 4310, '汝城县');
INSERT INTO `ums_area` VALUES (2097, 431027, 4310, '桂东县');
INSERT INTO `ums_area` VALUES (2098, 431028, 4310, '安仁县');
INSERT INTO `ums_area` VALUES (2099, 431081, 4310, '资兴市');
INSERT INTO `ums_area` VALUES (2100, 4311, 43, '永州');
INSERT INTO `ums_area` VALUES (2101, 431101, 4311, '市辖区');
INSERT INTO `ums_area` VALUES (2102, 431102, 4311, '芝山区');
INSERT INTO `ums_area` VALUES (2103, 431103, 4311, '冷水滩区');
INSERT INTO `ums_area` VALUES (2104, 431121, 4311, '祁阳县');
INSERT INTO `ums_area` VALUES (2105, 431122, 4311, '东安县');
INSERT INTO `ums_area` VALUES (2106, 431123, 4311, '双牌县');
INSERT INTO `ums_area` VALUES (2107, 431124, 4311, '道 县');
INSERT INTO `ums_area` VALUES (2108, 431125, 4311, '江永县');
INSERT INTO `ums_area` VALUES (2109, 431126, 4311, '宁远县');
INSERT INTO `ums_area` VALUES (2110, 431127, 4311, '蓝山县');
INSERT INTO `ums_area` VALUES (2111, 431128, 4311, '新田县');
INSERT INTO `ums_area` VALUES (2112, 431129, 4311, '江华瑶族自治县');
INSERT INTO `ums_area` VALUES (2113, 4312, 43, '怀化');
INSERT INTO `ums_area` VALUES (2114, 431201, 4312, '市辖区');
INSERT INTO `ums_area` VALUES (2115, 431202, 4312, '鹤城区');
INSERT INTO `ums_area` VALUES (2116, 431221, 4312, '中方县');
INSERT INTO `ums_area` VALUES (2117, 431222, 4312, '沅陵县');
INSERT INTO `ums_area` VALUES (2118, 431223, 4312, '辰溪县');
INSERT INTO `ums_area` VALUES (2119, 431224, 4312, '溆浦县');
INSERT INTO `ums_area` VALUES (2120, 431225, 4312, '会同县');
INSERT INTO `ums_area` VALUES (2121, 431226, 4312, '麻阳苗族自治县');
INSERT INTO `ums_area` VALUES (2122, 431227, 4312, '新晃侗族自治县');
INSERT INTO `ums_area` VALUES (2123, 431228, 4312, '芷江侗族自治县');
INSERT INTO `ums_area` VALUES (2124, 431229, 4312, '靖州苗族侗族自治县');
INSERT INTO `ums_area` VALUES (2125, 431230, 4312, '通道侗族自治县');
INSERT INTO `ums_area` VALUES (2126, 431281, 4312, '洪江市');
INSERT INTO `ums_area` VALUES (2127, 4313, 43, '娄底');
INSERT INTO `ums_area` VALUES (2128, 431301, 4313, '市辖区');
INSERT INTO `ums_area` VALUES (2129, 431302, 4313, '娄星区');
INSERT INTO `ums_area` VALUES (2130, 431321, 4313, '双峰县');
INSERT INTO `ums_area` VALUES (2131, 431322, 4313, '新化县');
INSERT INTO `ums_area` VALUES (2132, 431381, 4313, '冷水江市');
INSERT INTO `ums_area` VALUES (2133, 431382, 4313, '涟源市');
INSERT INTO `ums_area` VALUES (2134, 4331, 43, '湘西土家族苗族自治州');
INSERT INTO `ums_area` VALUES (2135, 433101, 4331, '吉首市');
INSERT INTO `ums_area` VALUES (2136, 433122, 4331, '泸溪县');
INSERT INTO `ums_area` VALUES (2137, 433123, 4331, '凤凰县');
INSERT INTO `ums_area` VALUES (2138, 433124, 4331, '花垣县');
INSERT INTO `ums_area` VALUES (2139, 433125, 4331, '保靖县');
INSERT INTO `ums_area` VALUES (2140, 433126, 4331, '古丈县');
INSERT INTO `ums_area` VALUES (2141, 433127, 4331, '永顺县');
INSERT INTO `ums_area` VALUES (2142, 433130, 4331, '龙山县');
INSERT INTO `ums_area` VALUES (2143, 44, 0, '广东');
INSERT INTO `ums_area` VALUES (2144, 4401, 44, '广州');
INSERT INTO `ums_area` VALUES (2145, 440101, 4401, '市辖区');
INSERT INTO `ums_area` VALUES (2146, 440102, 4401, '东山区');
INSERT INTO `ums_area` VALUES (2147, 440103, 4401, '荔湾区');
INSERT INTO `ums_area` VALUES (2148, 440104, 4401, '越秀区');
INSERT INTO `ums_area` VALUES (2149, 440105, 4401, '海珠区');
INSERT INTO `ums_area` VALUES (2150, 440106, 4401, '天河区');
INSERT INTO `ums_area` VALUES (2151, 440107, 4401, '芳村区');
INSERT INTO `ums_area` VALUES (2152, 440111, 4401, '白云区');
INSERT INTO `ums_area` VALUES (2153, 440112, 4401, '黄埔区');
INSERT INTO `ums_area` VALUES (2154, 440113, 4401, '番禺区');
INSERT INTO `ums_area` VALUES (2155, 440114, 4401, '花都区');
INSERT INTO `ums_area` VALUES (2156, 440183, 4401, '增城市');
INSERT INTO `ums_area` VALUES (2157, 440184, 4401, '从化市');
INSERT INTO `ums_area` VALUES (2158, 4402, 44, '韶关');
INSERT INTO `ums_area` VALUES (2159, 440201, 4402, '市辖区');
INSERT INTO `ums_area` VALUES (2160, 440202, 4402, '北江区');
INSERT INTO `ums_area` VALUES (2161, 440203, 4402, '武江区');
INSERT INTO `ums_area` VALUES (2162, 440204, 4402, '浈江区');
INSERT INTO `ums_area` VALUES (2163, 440221, 4402, '曲江县');
INSERT INTO `ums_area` VALUES (2164, 440222, 4402, '始兴县');
INSERT INTO `ums_area` VALUES (2165, 440224, 4402, '仁化县');
INSERT INTO `ums_area` VALUES (2166, 440229, 4402, '翁源县');
INSERT INTO `ums_area` VALUES (2167, 440232, 4402, '乳源瑶族自治县');
INSERT INTO `ums_area` VALUES (2168, 440233, 4402, '新丰县');
INSERT INTO `ums_area` VALUES (2169, 440281, 4402, '乐昌市');
INSERT INTO `ums_area` VALUES (2170, 440282, 4402, '南雄市');
INSERT INTO `ums_area` VALUES (2171, 4403, 44, '深圳');
INSERT INTO `ums_area` VALUES (2172, 440301, 4403, '市辖区');
INSERT INTO `ums_area` VALUES (2173, 440303, 4403, '罗湖区');
INSERT INTO `ums_area` VALUES (2174, 440304, 4403, '福田区');
INSERT INTO `ums_area` VALUES (2175, 440305, 4403, '南山区');
INSERT INTO `ums_area` VALUES (2176, 440306, 4403, '宝安区');
INSERT INTO `ums_area` VALUES (2177, 440307, 4403, '龙岗区');
INSERT INTO `ums_area` VALUES (2178, 440308, 4403, '盐田区');
INSERT INTO `ums_area` VALUES (2179, 4404, 44, '珠海');
INSERT INTO `ums_area` VALUES (2180, 440401, 4404, '市辖区');
INSERT INTO `ums_area` VALUES (2181, 440402, 4404, '香洲区');
INSERT INTO `ums_area` VALUES (2182, 440421, 4404, '斗门县');
INSERT INTO `ums_area` VALUES (2183, 4405, 44, '汕头');
INSERT INTO `ums_area` VALUES (2184, 440501, 4405, '市辖区');
INSERT INTO `ums_area` VALUES (2185, 440506, 4405, '达濠区');
INSERT INTO `ums_area` VALUES (2186, 440507, 4405, '龙湖区');
INSERT INTO `ums_area` VALUES (2187, 440508, 4405, '金园区');
INSERT INTO `ums_area` VALUES (2188, 440509, 4405, '升平区');
INSERT INTO `ums_area` VALUES (2189, 440510, 4405, '河浦区');
INSERT INTO `ums_area` VALUES (2190, 440523, 4405, '南澳县');
INSERT INTO `ums_area` VALUES (2191, 440582, 4405, '潮阳市');
INSERT INTO `ums_area` VALUES (2192, 440583, 4405, '澄海市');
INSERT INTO `ums_area` VALUES (2193, 4406, 44, '佛山');
INSERT INTO `ums_area` VALUES (2194, 440601, 4406, '市辖区');
INSERT INTO `ums_area` VALUES (2195, 440602, 4406, '城 区');
INSERT INTO `ums_area` VALUES (2196, 440603, 4406, '石湾区');
INSERT INTO `ums_area` VALUES (2197, 440681, 4406, '顺德市');
INSERT INTO `ums_area` VALUES (2198, 440682, 4406, '南海市');
INSERT INTO `ums_area` VALUES (2199, 440683, 4406, '三水市');
INSERT INTO `ums_area` VALUES (2200, 440684, 4406, '高明市');
INSERT INTO `ums_area` VALUES (2201, 4407, 44, '江门');
INSERT INTO `ums_area` VALUES (2202, 440701, 4407, '市辖区');
INSERT INTO `ums_area` VALUES (2203, 440703, 4407, '蓬江区');
INSERT INTO `ums_area` VALUES (2204, 440704, 4407, '江海区');
INSERT INTO `ums_area` VALUES (2205, 440781, 4407, '台山市');
INSERT INTO `ums_area` VALUES (2206, 440782, 4407, '新会市');
INSERT INTO `ums_area` VALUES (2207, 440783, 4407, '开平市');
INSERT INTO `ums_area` VALUES (2208, 440784, 4407, '鹤山市');
INSERT INTO `ums_area` VALUES (2209, 440785, 4407, '恩平市');
INSERT INTO `ums_area` VALUES (2210, 4408, 44, '湛江');
INSERT INTO `ums_area` VALUES (2211, 440801, 4408, '市辖区');
INSERT INTO `ums_area` VALUES (2212, 440802, 4408, '赤坎区');
INSERT INTO `ums_area` VALUES (2213, 440803, 4408, '霞山区');
INSERT INTO `ums_area` VALUES (2214, 440804, 4408, '坡头区');
INSERT INTO `ums_area` VALUES (2215, 440811, 4408, '麻章区');
INSERT INTO `ums_area` VALUES (2216, 440823, 4408, '遂溪县');
INSERT INTO `ums_area` VALUES (2217, 440825, 4408, '徐闻县');
INSERT INTO `ums_area` VALUES (2218, 440881, 4408, '廉江市');
INSERT INTO `ums_area` VALUES (2219, 440882, 4408, '雷州市');
INSERT INTO `ums_area` VALUES (2220, 440883, 4408, '吴川市');
INSERT INTO `ums_area` VALUES (2221, 4409, 44, '茂名');
INSERT INTO `ums_area` VALUES (2222, 440901, 4409, '市辖区');
INSERT INTO `ums_area` VALUES (2223, 440902, 4409, '茂南区');
INSERT INTO `ums_area` VALUES (2224, 440923, 4409, '电白县');
INSERT INTO `ums_area` VALUES (2225, 440981, 4409, '高州市');
INSERT INTO `ums_area` VALUES (2226, 440982, 4409, '化州市');
INSERT INTO `ums_area` VALUES (2227, 440983, 4409, '信宜市');
INSERT INTO `ums_area` VALUES (2228, 4412, 44, '肇庆');
INSERT INTO `ums_area` VALUES (2229, 441201, 4412, '市辖区');
INSERT INTO `ums_area` VALUES (2230, 441202, 4412, '端州区');
INSERT INTO `ums_area` VALUES (2231, 441203, 4412, '鼎湖区');
INSERT INTO `ums_area` VALUES (2232, 441223, 4412, '广宁县');
INSERT INTO `ums_area` VALUES (2233, 441224, 4412, '怀集县');
INSERT INTO `ums_area` VALUES (2234, 441225, 4412, '封开县');
INSERT INTO `ums_area` VALUES (2235, 441226, 4412, '德庆县');
INSERT INTO `ums_area` VALUES (2236, 441283, 4412, '高要市');
INSERT INTO `ums_area` VALUES (2237, 441284, 4412, '四会市');
INSERT INTO `ums_area` VALUES (2238, 4413, 44, '惠州');
INSERT INTO `ums_area` VALUES (2239, 441301, 4413, '市辖区');
INSERT INTO `ums_area` VALUES (2240, 441302, 4413, '惠城区');
INSERT INTO `ums_area` VALUES (2241, 441322, 4413, '博罗县');
INSERT INTO `ums_area` VALUES (2242, 441323, 4413, '惠东县');
INSERT INTO `ums_area` VALUES (2243, 441324, 4413, '龙门县');
INSERT INTO `ums_area` VALUES (2244, 441381, 4413, '惠阳市');
INSERT INTO `ums_area` VALUES (2245, 4414, 44, '梅州');
INSERT INTO `ums_area` VALUES (2246, 441401, 4414, '市辖区');
INSERT INTO `ums_area` VALUES (2247, 441402, 4414, '梅江区');
INSERT INTO `ums_area` VALUES (2248, 441421, 4414, '梅 县');
INSERT INTO `ums_area` VALUES (2249, 441422, 4414, '大埔县');
INSERT INTO `ums_area` VALUES (2250, 441423, 4414, '丰顺县');
INSERT INTO `ums_area` VALUES (2251, 441424, 4414, '五华县');
INSERT INTO `ums_area` VALUES (2252, 441426, 4414, '平远县');
INSERT INTO `ums_area` VALUES (2253, 441427, 4414, '蕉岭县');
INSERT INTO `ums_area` VALUES (2254, 441481, 4414, '兴宁市');
INSERT INTO `ums_area` VALUES (2255, 4415, 44, '汕尾');
INSERT INTO `ums_area` VALUES (2256, 441501, 4415, '市辖区');
INSERT INTO `ums_area` VALUES (2257, 441502, 4415, '城 区');
INSERT INTO `ums_area` VALUES (2258, 441521, 4415, '海丰县');
INSERT INTO `ums_area` VALUES (2259, 441523, 4415, '陆河县');
INSERT INTO `ums_area` VALUES (2260, 441581, 4415, '陆丰市');
INSERT INTO `ums_area` VALUES (2261, 4416, 44, '河源');
INSERT INTO `ums_area` VALUES (2262, 441601, 4416, '市辖区');
INSERT INTO `ums_area` VALUES (2263, 441602, 4416, '源城区');
INSERT INTO `ums_area` VALUES (2264, 441621, 4416, '紫金县');
INSERT INTO `ums_area` VALUES (2265, 441622, 4416, '龙川县');
INSERT INTO `ums_area` VALUES (2266, 441623, 4416, '连平县');
INSERT INTO `ums_area` VALUES (2267, 441624, 4416, '和平县');
INSERT INTO `ums_area` VALUES (2268, 441625, 4416, '东源县');
INSERT INTO `ums_area` VALUES (2269, 4417, 44, '阳江');
INSERT INTO `ums_area` VALUES (2270, 441701, 4417, '市辖区');
INSERT INTO `ums_area` VALUES (2271, 441702, 4417, '江城区');
INSERT INTO `ums_area` VALUES (2272, 441721, 4417, '阳西县');
INSERT INTO `ums_area` VALUES (2273, 441723, 4417, '阳东县');
INSERT INTO `ums_area` VALUES (2274, 441781, 4417, '阳春市');
INSERT INTO `ums_area` VALUES (2275, 4418, 44, '清远');
INSERT INTO `ums_area` VALUES (2276, 441801, 4418, '市辖区');
INSERT INTO `ums_area` VALUES (2277, 441802, 4418, '清城区');
INSERT INTO `ums_area` VALUES (2278, 441821, 4418, '佛冈县');
INSERT INTO `ums_area` VALUES (2279, 441823, 4418, '阳山县');
INSERT INTO `ums_area` VALUES (2280, 441825, 4418, '连山壮族瑶族自治县');
INSERT INTO `ums_area` VALUES (2281, 441826, 4418, '连南瑶族自治县');
INSERT INTO `ums_area` VALUES (2282, 441827, 4418, '清新县');
INSERT INTO `ums_area` VALUES (2283, 441881, 4418, '英德市');
INSERT INTO `ums_area` VALUES (2284, 441882, 4418, '连州市');
INSERT INTO `ums_area` VALUES (2285, 4419, 44, '东莞');
INSERT INTO `ums_area` VALUES (2286, 441901, 4419, '莞城区');
INSERT INTO `ums_area` VALUES (2287, 441902, 4419, '东城区');
INSERT INTO `ums_area` VALUES (2288, 441903, 4419, '南城区');
INSERT INTO `ums_area` VALUES (2289, 441904, 4419, '万江区');
INSERT INTO `ums_area` VALUES (2290, 4420, 44, '中山');
INSERT INTO `ums_area` VALUES (2291, 442001, 4420, '石岐区');
INSERT INTO `ums_area` VALUES (2292, 442002, 4420, '东区');
INSERT INTO `ums_area` VALUES (2293, 442003, 4420, '西区');
INSERT INTO `ums_area` VALUES (2294, 442004, 4420, '南区');
INSERT INTO `ums_area` VALUES (2295, 442005, 4420, '五桂山');
INSERT INTO `ums_area` VALUES (2296, 4451, 44, '潮州');
INSERT INTO `ums_area` VALUES (2297, 445101, 4451, '市辖区');
INSERT INTO `ums_area` VALUES (2298, 445102, 4451, '湘桥区');
INSERT INTO `ums_area` VALUES (2299, 445121, 4451, '潮安县');
INSERT INTO `ums_area` VALUES (2300, 445122, 4451, '饶平县');
INSERT INTO `ums_area` VALUES (2301, 4452, 44, '揭阳');
INSERT INTO `ums_area` VALUES (2302, 445201, 4452, '市辖区');
INSERT INTO `ums_area` VALUES (2303, 445202, 4452, '榕城区');
INSERT INTO `ums_area` VALUES (2304, 445221, 4452, '揭东县');
INSERT INTO `ums_area` VALUES (2305, 445222, 4452, '揭西县');
INSERT INTO `ums_area` VALUES (2306, 445224, 4452, '惠来县');
INSERT INTO `ums_area` VALUES (2307, 445281, 4452, '普宁市');
INSERT INTO `ums_area` VALUES (2308, 4453, 44, '云浮');
INSERT INTO `ums_area` VALUES (2309, 445301, 4453, '市辖区');
INSERT INTO `ums_area` VALUES (2310, 445302, 4453, '云城区');
INSERT INTO `ums_area` VALUES (2311, 445321, 4453, '新兴县');
INSERT INTO `ums_area` VALUES (2312, 445322, 4453, '郁南县');
INSERT INTO `ums_area` VALUES (2313, 445323, 4453, '云安县');
INSERT INTO `ums_area` VALUES (2314, 445381, 4453, '罗定市');
INSERT INTO `ums_area` VALUES (2315, 45, 0, '广西');
INSERT INTO `ums_area` VALUES (2316, 4501, 45, '南宁');
INSERT INTO `ums_area` VALUES (2317, 450101, 4501, '市辖区');
INSERT INTO `ums_area` VALUES (2318, 450102, 4501, '兴宁区');
INSERT INTO `ums_area` VALUES (2319, 450103, 4501, '新城区');
INSERT INTO `ums_area` VALUES (2320, 450104, 4501, '城北区');
INSERT INTO `ums_area` VALUES (2321, 450105, 4501, '江南区');
INSERT INTO `ums_area` VALUES (2322, 450106, 4501, '永新区');
INSERT INTO `ums_area` VALUES (2323, 450111, 4501, '市郊区');
INSERT INTO `ums_area` VALUES (2324, 450121, 4501, '邕宁县');
INSERT INTO `ums_area` VALUES (2325, 450122, 4501, '武鸣县');
INSERT INTO `ums_area` VALUES (2326, 4502, 45, '柳州');
INSERT INTO `ums_area` VALUES (2327, 450201, 4502, '市辖区');
INSERT INTO `ums_area` VALUES (2328, 450202, 4502, '城中区');
INSERT INTO `ums_area` VALUES (2329, 450203, 4502, '鱼峰区');
INSERT INTO `ums_area` VALUES (2330, 450204, 4502, '柳南区');
INSERT INTO `ums_area` VALUES (2331, 450205, 4502, '柳北区');
INSERT INTO `ums_area` VALUES (2332, 450211, 4502, '市郊区');
INSERT INTO `ums_area` VALUES (2333, 450221, 4502, '柳江县');
INSERT INTO `ums_area` VALUES (2334, 450222, 4502, '柳城县');
INSERT INTO `ums_area` VALUES (2335, 4503, 45, '桂林');
INSERT INTO `ums_area` VALUES (2336, 450301, 4503, '市辖区');
INSERT INTO `ums_area` VALUES (2337, 450302, 4503, '秀峰区');
INSERT INTO `ums_area` VALUES (2338, 450303, 4503, '叠彩区');
INSERT INTO `ums_area` VALUES (2339, 450304, 4503, '象山区');
INSERT INTO `ums_area` VALUES (2340, 450305, 4503, '七星区');
INSERT INTO `ums_area` VALUES (2341, 450311, 4503, '雁山区');
INSERT INTO `ums_area` VALUES (2342, 450321, 4503, '阳朔县');
INSERT INTO `ums_area` VALUES (2343, 450322, 4503, '临桂县');
INSERT INTO `ums_area` VALUES (2344, 450323, 4503, '灵川县');
INSERT INTO `ums_area` VALUES (2345, 450324, 4503, '全州县');
INSERT INTO `ums_area` VALUES (2346, 450325, 4503, '兴安县');
INSERT INTO `ums_area` VALUES (2347, 450326, 4503, '永福县');
INSERT INTO `ums_area` VALUES (2348, 450327, 4503, '灌阳县');
INSERT INTO `ums_area` VALUES (2349, 450328, 4503, '龙胜各县自治区');
INSERT INTO `ums_area` VALUES (2350, 450329, 4503, '资源县');
INSERT INTO `ums_area` VALUES (2351, 450330, 4503, '平乐县');
INSERT INTO `ums_area` VALUES (2352, 450331, 4503, '荔蒲县');
INSERT INTO `ums_area` VALUES (2353, 450332, 4503, '恭城瑶族自治县');
INSERT INTO `ums_area` VALUES (2354, 4504, 45, '梧州');
INSERT INTO `ums_area` VALUES (2355, 450401, 4504, '市辖区');
INSERT INTO `ums_area` VALUES (2356, 450403, 4504, '万秀区');
INSERT INTO `ums_area` VALUES (2357, 450404, 4504, '蝶山区');
INSERT INTO `ums_area` VALUES (2358, 450411, 4504, '市郊区');
INSERT INTO `ums_area` VALUES (2359, 450421, 4504, '苍梧县');
INSERT INTO `ums_area` VALUES (2360, 450422, 4504, '藤 县');
INSERT INTO `ums_area` VALUES (2361, 450423, 4504, '蒙山县');
INSERT INTO `ums_area` VALUES (2362, 450481, 4504, '岑溪市');
INSERT INTO `ums_area` VALUES (2363, 4505, 45, '北海');
INSERT INTO `ums_area` VALUES (2364, 450501, 4505, '市辖区');
INSERT INTO `ums_area` VALUES (2365, 450502, 4505, '海城区');
INSERT INTO `ums_area` VALUES (2366, 450503, 4505, '银海区');
INSERT INTO `ums_area` VALUES (2367, 450512, 4505, '铁山港区');
INSERT INTO `ums_area` VALUES (2368, 450521, 4505, '合浦县');
INSERT INTO `ums_area` VALUES (2369, 4506, 45, '防城港');
INSERT INTO `ums_area` VALUES (2370, 450601, 4506, '市辖区');
INSERT INTO `ums_area` VALUES (2371, 450602, 4506, '港口区');
INSERT INTO `ums_area` VALUES (2372, 450603, 4506, '防城区');
INSERT INTO `ums_area` VALUES (2373, 450621, 4506, '上思县');
INSERT INTO `ums_area` VALUES (2374, 450681, 4506, '东兴市');
INSERT INTO `ums_area` VALUES (2375, 4507, 45, '钦州');
INSERT INTO `ums_area` VALUES (2376, 450701, 4507, '市辖区');
INSERT INTO `ums_area` VALUES (2377, 450702, 4507, '钦南区');
INSERT INTO `ums_area` VALUES (2378, 450703, 4507, '钦北区');
INSERT INTO `ums_area` VALUES (2379, 450721, 4507, '浦北县');
INSERT INTO `ums_area` VALUES (2380, 450722, 4507, '灵山县');
INSERT INTO `ums_area` VALUES (2381, 4508, 45, '贵港');
INSERT INTO `ums_area` VALUES (2382, 450801, 4508, '市辖区');
INSERT INTO `ums_area` VALUES (2383, 450802, 4508, '港北区');
INSERT INTO `ums_area` VALUES (2384, 450803, 4508, '港南区');
INSERT INTO `ums_area` VALUES (2385, 450821, 4508, '平南县');
INSERT INTO `ums_area` VALUES (2386, 450881, 4508, '桂平市');
INSERT INTO `ums_area` VALUES (2387, 4509, 45, '玉林');
INSERT INTO `ums_area` VALUES (2388, 450901, 4509, '市辖区');
INSERT INTO `ums_area` VALUES (2389, 450902, 4509, '玉州区');
INSERT INTO `ums_area` VALUES (2390, 450921, 4509, '容 县');
INSERT INTO `ums_area` VALUES (2391, 450922, 4509, '陆川县');
INSERT INTO `ums_area` VALUES (2392, 450923, 4509, '博白县');
INSERT INTO `ums_area` VALUES (2393, 450924, 4509, '兴业县');
INSERT INTO `ums_area` VALUES (2394, 450981, 4509, '北流市');
INSERT INTO `ums_area` VALUES (2395, 4521, 45, '南宁地区');
INSERT INTO `ums_area` VALUES (2396, 452101, 4521, '凭祥市');
INSERT INTO `ums_area` VALUES (2397, 452122, 4521, '横 县');
INSERT INTO `ums_area` VALUES (2398, 452123, 4521, '宾阳县');
INSERT INTO `ums_area` VALUES (2399, 452124, 4521, '上林县');
INSERT INTO `ums_area` VALUES (2400, 452126, 4521, '隆安县');
INSERT INTO `ums_area` VALUES (2401, 452127, 4521, '马山县');
INSERT INTO `ums_area` VALUES (2402, 452128, 4521, '扶绥县');
INSERT INTO `ums_area` VALUES (2403, 452129, 4521, '崇左县');
INSERT INTO `ums_area` VALUES (2404, 452130, 4521, '大新县');
INSERT INTO `ums_area` VALUES (2405, 452131, 4521, '天等县');
INSERT INTO `ums_area` VALUES (2406, 452132, 4521, '宁明县');
INSERT INTO `ums_area` VALUES (2407, 452133, 4521, '龙州县');
INSERT INTO `ums_area` VALUES (2408, 4522, 45, '柳州地区');
INSERT INTO `ums_area` VALUES (2409, 452201, 4522, '合山市');
INSERT INTO `ums_area` VALUES (2410, 452223, 4522, '鹿寨县');
INSERT INTO `ums_area` VALUES (2411, 452224, 4522, '象州县');
INSERT INTO `ums_area` VALUES (2412, 452225, 4522, '武宣县');
INSERT INTO `ums_area` VALUES (2413, 452226, 4522, '来宾县');
INSERT INTO `ums_area` VALUES (2414, 452227, 4522, '融安县');
INSERT INTO `ums_area` VALUES (2415, 452228, 4522, '三江侗族自治县');
INSERT INTO `ums_area` VALUES (2416, 452229, 4522, '融水苗族自治县');
INSERT INTO `ums_area` VALUES (2417, 452230, 4522, '金秀瑶族自治县');
INSERT INTO `ums_area` VALUES (2418, 452231, 4522, '忻城县');
INSERT INTO `ums_area` VALUES (2419, 4524, 45, '贺州地区');
INSERT INTO `ums_area` VALUES (2420, 452402, 4524, '贺州市');
INSERT INTO `ums_area` VALUES (2421, 452424, 4524, '昭平县');
INSERT INTO `ums_area` VALUES (2422, 452427, 4524, '钟山县');
INSERT INTO `ums_area` VALUES (2423, 452428, 4524, '富川瑶族自治县');
INSERT INTO `ums_area` VALUES (2424, 4526, 45, '百色地区');
INSERT INTO `ums_area` VALUES (2425, 452601, 4526, '百色市');
INSERT INTO `ums_area` VALUES (2426, 452622, 4526, '田阳县');
INSERT INTO `ums_area` VALUES (2427, 452623, 4526, '田东县');
INSERT INTO `ums_area` VALUES (2428, 452624, 4526, '平果县');
INSERT INTO `ums_area` VALUES (2429, 452625, 4526, '德保县');
INSERT INTO `ums_area` VALUES (2430, 452626, 4526, '靖西县');
INSERT INTO `ums_area` VALUES (2431, 452627, 4526, '那坡县');
INSERT INTO `ums_area` VALUES (2432, 452628, 4526, '凌云县');
INSERT INTO `ums_area` VALUES (2433, 452629, 4526, '乐业县');
INSERT INTO `ums_area` VALUES (2434, 452630, 4526, '田林县');
INSERT INTO `ums_area` VALUES (2435, 452631, 4526, '隆林各族自治县');
INSERT INTO `ums_area` VALUES (2436, 452632, 4526, '西林县');
INSERT INTO `ums_area` VALUES (2437, 4527, 45, '河池地区');
INSERT INTO `ums_area` VALUES (2438, 452701, 4527, '河池市');
INSERT INTO `ums_area` VALUES (2439, 452702, 4527, '宜州市');
INSERT INTO `ums_area` VALUES (2440, 452723, 4527, '罗城仫佬族自治县');
INSERT INTO `ums_area` VALUES (2441, 452724, 4527, '环江毛南族自治县');
INSERT INTO `ums_area` VALUES (2442, 452725, 4527, '南丹县');
INSERT INTO `ums_area` VALUES (2443, 452726, 4527, '天峨县');
INSERT INTO `ums_area` VALUES (2444, 452727, 4527, '凤山县');
INSERT INTO `ums_area` VALUES (2445, 452728, 4527, '东兰县');
INSERT INTO `ums_area` VALUES (2446, 452729, 4527, '巴马瑶族自治县');
INSERT INTO `ums_area` VALUES (2447, 452730, 4527, '都安瑶族自治县');
INSERT INTO `ums_area` VALUES (2448, 452731, 4527, '大化瑶族自治县');
INSERT INTO `ums_area` VALUES (2449, 46, 0, '海南');
INSERT INTO `ums_area` VALUES (2450, 4601, 46, '海南');
INSERT INTO `ums_area` VALUES (2451, 460101, 4601, '通什市');
INSERT INTO `ums_area` VALUES (2452, 460102, 4601, '琼海市');
INSERT INTO `ums_area` VALUES (2453, 460103, 4601, '儋州市');
INSERT INTO `ums_area` VALUES (2454, 460104, 4601, '琼山市');
INSERT INTO `ums_area` VALUES (2455, 460105, 4601, '文昌市');
INSERT INTO `ums_area` VALUES (2456, 460106, 4601, '万宁市');
INSERT INTO `ums_area` VALUES (2457, 460107, 4601, '东方市');
INSERT INTO `ums_area` VALUES (2458, 460125, 4601, '定安县');
INSERT INTO `ums_area` VALUES (2459, 460126, 4601, '屯昌县');
INSERT INTO `ums_area` VALUES (2460, 460127, 4601, '澄迈县');
INSERT INTO `ums_area` VALUES (2461, 460128, 4601, '临高县');
INSERT INTO `ums_area` VALUES (2462, 460130, 4601, '白沙黎族自治县');
INSERT INTO `ums_area` VALUES (2463, 460131, 4601, '昌江黎族自治县');
INSERT INTO `ums_area` VALUES (2464, 460133, 4601, '乐东黎族自治县');
INSERT INTO `ums_area` VALUES (2465, 460134, 4601, '陵水黎族自治县');
INSERT INTO `ums_area` VALUES (2466, 460135, 4601, '保亭黎族苗族自治县');
INSERT INTO `ums_area` VALUES (2467, 460136, 4601, '琼中黎族苗族自治县');
INSERT INTO `ums_area` VALUES (2468, 460137, 4601, '西沙群岛');
INSERT INTO `ums_area` VALUES (2469, 460138, 4601, '南沙群岛');
INSERT INTO `ums_area` VALUES (2470, 460139, 4601, '中沙群岛的岛礁及其海');
INSERT INTO `ums_area` VALUES (2471, 4602, 46, '海口');
INSERT INTO `ums_area` VALUES (2472, 460201, 4602, '市辖区');
INSERT INTO `ums_area` VALUES (2473, 460202, 4602, '振东区');
INSERT INTO `ums_area` VALUES (2474, 460203, 4602, '新华区');
INSERT INTO `ums_area` VALUES (2475, 460204, 4602, '秀英区');
INSERT INTO `ums_area` VALUES (2476, 4603, 46, '三亚');
INSERT INTO `ums_area` VALUES (2477, 460301, 4603, '市辖区');
INSERT INTO `ums_area` VALUES (2478, 50, 0, '重庆');
INSERT INTO `ums_area` VALUES (2479, 5001, 50, '重庆市辖');
INSERT INTO `ums_area` VALUES (2480, 500101, 5001, '万州区');
INSERT INTO `ums_area` VALUES (2481, 500102, 5001, '涪陵区');
INSERT INTO `ums_area` VALUES (2482, 500103, 5001, '渝中区');
INSERT INTO `ums_area` VALUES (2483, 500104, 5001, '大渡口区');
INSERT INTO `ums_area` VALUES (2484, 500105, 5001, '江北区');
INSERT INTO `ums_area` VALUES (2485, 500106, 5001, '沙坪坝区');
INSERT INTO `ums_area` VALUES (2486, 500107, 5001, '九龙坡区');
INSERT INTO `ums_area` VALUES (2487, 500108, 5001, '南岸区');
INSERT INTO `ums_area` VALUES (2488, 500109, 5001, '北碚区');
INSERT INTO `ums_area` VALUES (2489, 500110, 5001, '万盛区');
INSERT INTO `ums_area` VALUES (2490, 500111, 5001, '双桥区');
INSERT INTO `ums_area` VALUES (2491, 500112, 5001, '渝北区');
INSERT INTO `ums_area` VALUES (2492, 500113, 5001, '巴南区');
INSERT INTO `ums_area` VALUES (2493, 500114, 5001, '黔江区');
INSERT INTO `ums_area` VALUES (2494, 5002, 50, '重庆县辖');
INSERT INTO `ums_area` VALUES (2495, 500221, 5002, '长寿县');
INSERT INTO `ums_area` VALUES (2496, 500222, 5002, '綦江县');
INSERT INTO `ums_area` VALUES (2497, 500223, 5002, '潼南县');
INSERT INTO `ums_area` VALUES (2498, 500224, 5002, '铜梁县');
INSERT INTO `ums_area` VALUES (2499, 500225, 5002, '大足县');
INSERT INTO `ums_area` VALUES (2500, 500226, 5002, '荣昌县');
INSERT INTO `ums_area` VALUES (2501, 500227, 5002, '璧山县');
INSERT INTO `ums_area` VALUES (2502, 500228, 5002, '梁平县');
INSERT INTO `ums_area` VALUES (2503, 500229, 5002, '城口县');
INSERT INTO `ums_area` VALUES (2504, 500230, 5002, '丰都县');
INSERT INTO `ums_area` VALUES (2505, 500231, 5002, '垫江县');
INSERT INTO `ums_area` VALUES (2506, 500232, 5002, '武隆县');
INSERT INTO `ums_area` VALUES (2507, 500233, 5002, '忠 县');
INSERT INTO `ums_area` VALUES (2508, 500234, 5002, '开 县');
INSERT INTO `ums_area` VALUES (2509, 500235, 5002, '云阳县');
INSERT INTO `ums_area` VALUES (2510, 500236, 5002, '奉节县');
INSERT INTO `ums_area` VALUES (2511, 500237, 5002, '巫山县');
INSERT INTO `ums_area` VALUES (2512, 500238, 5002, '巫溪县');
INSERT INTO `ums_area` VALUES (2513, 500240, 5002, '石柱土家族自治县');
INSERT INTO `ums_area` VALUES (2514, 500241, 5002, '秀山土家族苗族自治县');
INSERT INTO `ums_area` VALUES (2515, 500242, 5002, '酉阳土家族苗族自治县');
INSERT INTO `ums_area` VALUES (2516, 500243, 5002, '彭水苗族土家族自治县');
INSERT INTO `ums_area` VALUES (2517, 5003, 50, '重庆县级');
INSERT INTO `ums_area` VALUES (2518, 500381, 5003, '江津市');
INSERT INTO `ums_area` VALUES (2519, 500382, 5003, '合川市');
INSERT INTO `ums_area` VALUES (2520, 500383, 5003, '永川市');
INSERT INTO `ums_area` VALUES (2521, 500384, 5003, '南川市');
INSERT INTO `ums_area` VALUES (2522, 51, 0, '四川');
INSERT INTO `ums_area` VALUES (2523, 5101, 51, '成都');
INSERT INTO `ums_area` VALUES (2524, 510101, 5101, '市辖区');
INSERT INTO `ums_area` VALUES (2525, 510103, 5101, '高新区');
INSERT INTO `ums_area` VALUES (2526, 510104, 5101, '锦江区');
INSERT INTO `ums_area` VALUES (2527, 510105, 5101, '青羊区');
INSERT INTO `ums_area` VALUES (2528, 510106, 5101, '金牛区');
INSERT INTO `ums_area` VALUES (2529, 510107, 5101, '武侯区');
INSERT INTO `ums_area` VALUES (2530, 510108, 5101, '成华区');
INSERT INTO `ums_area` VALUES (2531, 510112, 5101, '龙泉驿区');
INSERT INTO `ums_area` VALUES (2532, 510113, 5101, '青白江区');
INSERT INTO `ums_area` VALUES (2533, 510121, 5101, '金堂县');
INSERT INTO `ums_area` VALUES (2534, 510122, 5101, '双流县');
INSERT INTO `ums_area` VALUES (2535, 510123, 5101, '温江县');
INSERT INTO `ums_area` VALUES (2536, 510124, 5101, '郫 县');
INSERT INTO `ums_area` VALUES (2537, 510125, 5101, '新都县');
INSERT INTO `ums_area` VALUES (2538, 510129, 5101, '大邑县');
INSERT INTO `ums_area` VALUES (2539, 510131, 5101, '蒲江县');
INSERT INTO `ums_area` VALUES (2540, 510132, 5101, '新津县');
INSERT INTO `ums_area` VALUES (2541, 510181, 5101, '都江堰市');
INSERT INTO `ums_area` VALUES (2542, 510182, 5101, '彭州市');
INSERT INTO `ums_area` VALUES (2543, 510183, 5101, '邛崃市');
INSERT INTO `ums_area` VALUES (2544, 510184, 5101, '崇州市');
INSERT INTO `ums_area` VALUES (2545, 5103, 51, '自贡');
INSERT INTO `ums_area` VALUES (2546, 510301, 5103, '市辖区');
INSERT INTO `ums_area` VALUES (2547, 510302, 5103, '自流井区');
INSERT INTO `ums_area` VALUES (2548, 510303, 5103, '贡井区');
INSERT INTO `ums_area` VALUES (2549, 510304, 5103, '大安区');
INSERT INTO `ums_area` VALUES (2550, 510311, 5103, '沿滩区');
INSERT INTO `ums_area` VALUES (2551, 510321, 5103, '荣 县');
INSERT INTO `ums_area` VALUES (2552, 510322, 5103, '富顺县');
INSERT INTO `ums_area` VALUES (2553, 5104, 51, '攀枝花');
INSERT INTO `ums_area` VALUES (2554, 510401, 5104, '市辖区');
INSERT INTO `ums_area` VALUES (2555, 510402, 5104, '东 区');
INSERT INTO `ums_area` VALUES (2556, 510403, 5104, '西 区');
INSERT INTO `ums_area` VALUES (2557, 510411, 5104, '仁和区');
INSERT INTO `ums_area` VALUES (2558, 510421, 5104, '米易县');
INSERT INTO `ums_area` VALUES (2559, 510422, 5104, '盐边县');
INSERT INTO `ums_area` VALUES (2560, 5105, 51, '泸州');
INSERT INTO `ums_area` VALUES (2561, 510501, 5105, '市辖区');
INSERT INTO `ums_area` VALUES (2562, 510502, 5105, '江阳区');
INSERT INTO `ums_area` VALUES (2563, 510503, 5105, '纳溪区');
INSERT INTO `ums_area` VALUES (2564, 510504, 5105, '龙马潭区');
INSERT INTO `ums_area` VALUES (2565, 510521, 5105, '泸 县');
INSERT INTO `ums_area` VALUES (2566, 510522, 5105, '合江县');
INSERT INTO `ums_area` VALUES (2567, 510524, 5105, '叙永县');
INSERT INTO `ums_area` VALUES (2568, 510525, 5105, '古蔺县');
INSERT INTO `ums_area` VALUES (2569, 5106, 51, '德阳');
INSERT INTO `ums_area` VALUES (2570, 510601, 5106, '市辖区');
INSERT INTO `ums_area` VALUES (2571, 510603, 5106, '旌阳区');
INSERT INTO `ums_area` VALUES (2572, 510623, 5106, '中江县');
INSERT INTO `ums_area` VALUES (2573, 510626, 5106, '罗江县');
INSERT INTO `ums_area` VALUES (2574, 510681, 5106, '广汉市');
INSERT INTO `ums_area` VALUES (2575, 510682, 5106, '什邡市');
INSERT INTO `ums_area` VALUES (2576, 510683, 5106, '绵竹市');
INSERT INTO `ums_area` VALUES (2577, 5107, 51, '绵阳');
INSERT INTO `ums_area` VALUES (2578, 510701, 5107, '市辖区');
INSERT INTO `ums_area` VALUES (2579, 510703, 5107, '涪城区');
INSERT INTO `ums_area` VALUES (2580, 510704, 5107, '游仙区');
INSERT INTO `ums_area` VALUES (2581, 510710, 5107, '科学城区');
INSERT INTO `ums_area` VALUES (2582, 510722, 5107, '三台县');
INSERT INTO `ums_area` VALUES (2583, 510723, 5107, '盐亭县');
INSERT INTO `ums_area` VALUES (2584, 510724, 5107, '安 县');
INSERT INTO `ums_area` VALUES (2585, 510725, 5107, '梓潼县');
INSERT INTO `ums_area` VALUES (2586, 510726, 5107, '北川县');
INSERT INTO `ums_area` VALUES (2587, 510727, 5107, '平武县');
INSERT INTO `ums_area` VALUES (2588, 510781, 5107, '江油市');
INSERT INTO `ums_area` VALUES (2589, 5108, 51, '广元');
INSERT INTO `ums_area` VALUES (2590, 510801, 5108, '市辖区');
INSERT INTO `ums_area` VALUES (2591, 510802, 5108, '市中区');
INSERT INTO `ums_area` VALUES (2592, 510811, 5108, '元坝区');
INSERT INTO `ums_area` VALUES (2593, 510812, 5108, '朝天区');
INSERT INTO `ums_area` VALUES (2594, 510821, 5108, '旺苍县');
INSERT INTO `ums_area` VALUES (2595, 510822, 5108, '青川县');
INSERT INTO `ums_area` VALUES (2596, 510823, 5108, '剑阁县');
INSERT INTO `ums_area` VALUES (2597, 510824, 5108, '苍溪县');
INSERT INTO `ums_area` VALUES (2598, 5109, 51, '遂宁');
INSERT INTO `ums_area` VALUES (2599, 510901, 5109, '市辖区');
INSERT INTO `ums_area` VALUES (2600, 510902, 5109, '市中区');
INSERT INTO `ums_area` VALUES (2601, 510921, 5109, '蓬溪县');
INSERT INTO `ums_area` VALUES (2602, 510922, 5109, '射洪县');
INSERT INTO `ums_area` VALUES (2603, 510923, 5109, '大英县');
INSERT INTO `ums_area` VALUES (2604, 5110, 51, '内江');
INSERT INTO `ums_area` VALUES (2605, 511001, 5110, '市辖区');
INSERT INTO `ums_area` VALUES (2606, 511002, 5110, '市中区');
INSERT INTO `ums_area` VALUES (2607, 511011, 5110, '东兴区');
INSERT INTO `ums_area` VALUES (2608, 511024, 5110, '威远县');
INSERT INTO `ums_area` VALUES (2609, 511025, 5110, '资中县');
INSERT INTO `ums_area` VALUES (2610, 511028, 5110, '隆昌县');
INSERT INTO `ums_area` VALUES (2611, 5111, 51, '乐山');
INSERT INTO `ums_area` VALUES (2612, 511101, 5111, '市辖区');
INSERT INTO `ums_area` VALUES (2613, 511102, 5111, '市中区');
INSERT INTO `ums_area` VALUES (2614, 511111, 5111, '沙湾区');
INSERT INTO `ums_area` VALUES (2615, 511112, 5111, '五通桥区');
INSERT INTO `ums_area` VALUES (2616, 511113, 5111, '金口河区');
INSERT INTO `ums_area` VALUES (2617, 511123, 5111, '犍为县');
INSERT INTO `ums_area` VALUES (2618, 511124, 5111, '井研县');
INSERT INTO `ums_area` VALUES (2619, 511126, 5111, '夹江县');
INSERT INTO `ums_area` VALUES (2620, 511129, 5111, '沐川县');
INSERT INTO `ums_area` VALUES (2621, 511132, 5111, '峨边彝族自治县');
INSERT INTO `ums_area` VALUES (2622, 511133, 5111, '马边彝族自治县');
INSERT INTO `ums_area` VALUES (2623, 511181, 5111, '峨眉山市');
INSERT INTO `ums_area` VALUES (2624, 5113, 51, '南充');
INSERT INTO `ums_area` VALUES (2625, 511301, 5113, '市辖区');
INSERT INTO `ums_area` VALUES (2626, 511302, 5113, '顺庆区');
INSERT INTO `ums_area` VALUES (2627, 511303, 5113, '高坪区');
INSERT INTO `ums_area` VALUES (2628, 511304, 5113, '嘉陵区');
INSERT INTO `ums_area` VALUES (2629, 511321, 5113, '南部县');
INSERT INTO `ums_area` VALUES (2630, 511322, 5113, '营山县');
INSERT INTO `ums_area` VALUES (2631, 511323, 5113, '蓬安县');
INSERT INTO `ums_area` VALUES (2632, 511324, 5113, '仪陇县');
INSERT INTO `ums_area` VALUES (2633, 511325, 5113, '西充县');
INSERT INTO `ums_area` VALUES (2634, 511381, 5113, '阆中市');
INSERT INTO `ums_area` VALUES (2635, 5114, 51, '眉山');
INSERT INTO `ums_area` VALUES (2636, 511401, 5114, '市辖区');
INSERT INTO `ums_area` VALUES (2637, 511402, 5114, '东坡区');
INSERT INTO `ums_area` VALUES (2638, 511421, 5114, '仁寿县');
INSERT INTO `ums_area` VALUES (2639, 511422, 5114, '彭山县');
INSERT INTO `ums_area` VALUES (2640, 511423, 5114, '洪雅县');
INSERT INTO `ums_area` VALUES (2641, 511424, 5114, '丹棱县');
INSERT INTO `ums_area` VALUES (2642, 511425, 5114, '青神县');
INSERT INTO `ums_area` VALUES (2643, 5115, 51, '宜宾');
INSERT INTO `ums_area` VALUES (2644, 511501, 5115, '市辖区');
INSERT INTO `ums_area` VALUES (2645, 511502, 5115, '翠屏区');
INSERT INTO `ums_area` VALUES (2646, 511521, 5115, '宜宾县');
INSERT INTO `ums_area` VALUES (2647, 511522, 5115, '南溪县');
INSERT INTO `ums_area` VALUES (2648, 511523, 5115, '江安县');
INSERT INTO `ums_area` VALUES (2649, 511524, 5115, '长宁县');
INSERT INTO `ums_area` VALUES (2650, 511525, 5115, '高 县');
INSERT INTO `ums_area` VALUES (2651, 511526, 5115, '珙 县');
INSERT INTO `ums_area` VALUES (2652, 511527, 5115, '筠连县');
INSERT INTO `ums_area` VALUES (2653, 511528, 5115, '兴文县');
INSERT INTO `ums_area` VALUES (2654, 511529, 5115, '屏山县');
INSERT INTO `ums_area` VALUES (2655, 5116, 51, '广安');
INSERT INTO `ums_area` VALUES (2656, 511601, 5116, '市辖区');
INSERT INTO `ums_area` VALUES (2657, 511602, 5116, '广安区');
INSERT INTO `ums_area` VALUES (2658, 511621, 5116, '岳池县');
INSERT INTO `ums_area` VALUES (2659, 511622, 5116, '武胜县');
INSERT INTO `ums_area` VALUES (2660, 511623, 5116, '邻水县');
INSERT INTO `ums_area` VALUES (2661, 511681, 5116, '华蓥市');
INSERT INTO `ums_area` VALUES (2662, 5117, 51, '达州');
INSERT INTO `ums_area` VALUES (2663, 511701, 5117, '市辖区');
INSERT INTO `ums_area` VALUES (2664, 511702, 5117, '通川区');
INSERT INTO `ums_area` VALUES (2665, 511721, 5117, '达 县');
INSERT INTO `ums_area` VALUES (2666, 511722, 5117, '宣汉县');
INSERT INTO `ums_area` VALUES (2667, 511723, 5117, '开江县');
INSERT INTO `ums_area` VALUES (2668, 511724, 5117, '大竹县');
INSERT INTO `ums_area` VALUES (2669, 511725, 5117, '渠 县');
INSERT INTO `ums_area` VALUES (2670, 511781, 5117, '万源市');
INSERT INTO `ums_area` VALUES (2671, 5118, 51, '雅安');
INSERT INTO `ums_area` VALUES (2672, 511801, 5118, '市辖区');
INSERT INTO `ums_area` VALUES (2673, 511802, 5118, '雨城区');
INSERT INTO `ums_area` VALUES (2674, 511821, 5118, '名山县');
INSERT INTO `ums_area` VALUES (2675, 511822, 5118, '荥经县');
INSERT INTO `ums_area` VALUES (2676, 511823, 5118, '汉源县');
INSERT INTO `ums_area` VALUES (2677, 511824, 5118, '石棉县');
INSERT INTO `ums_area` VALUES (2678, 511825, 5118, '天全县');
INSERT INTO `ums_area` VALUES (2679, 511826, 5118, '芦山县');
INSERT INTO `ums_area` VALUES (2680, 511827, 5118, '宝兴县');
INSERT INTO `ums_area` VALUES (2681, 5119, 51, '巴中');
INSERT INTO `ums_area` VALUES (2682, 511901, 5119, '市辖区');
INSERT INTO `ums_area` VALUES (2683, 511902, 5119, '巴州区');
INSERT INTO `ums_area` VALUES (2684, 511921, 5119, '通江县');
INSERT INTO `ums_area` VALUES (2685, 511922, 5119, '南江县');
INSERT INTO `ums_area` VALUES (2686, 511923, 5119, '平昌县');
INSERT INTO `ums_area` VALUES (2687, 5120, 51, '资阳');
INSERT INTO `ums_area` VALUES (2688, 512001, 5120, '市辖区');
INSERT INTO `ums_area` VALUES (2689, 512002, 5120, '雁江区');
INSERT INTO `ums_area` VALUES (2690, 512021, 5120, '安岳县');
INSERT INTO `ums_area` VALUES (2691, 512022, 5120, '乐至县');
INSERT INTO `ums_area` VALUES (2692, 512081, 5120, '简阳市');
INSERT INTO `ums_area` VALUES (2693, 5132, 51, '阿坝藏族羌族自治州');
INSERT INTO `ums_area` VALUES (2694, 513221, 5132, '汶川县');
INSERT INTO `ums_area` VALUES (2695, 513222, 5132, '理 县');
INSERT INTO `ums_area` VALUES (2696, 513223, 5132, '茂 县');
INSERT INTO `ums_area` VALUES (2697, 513224, 5132, '松潘县');
INSERT INTO `ums_area` VALUES (2698, 513225, 5132, '九寨沟县');
INSERT INTO `ums_area` VALUES (2699, 513226, 5132, '金川县');
INSERT INTO `ums_area` VALUES (2700, 513227, 5132, '小金县');
INSERT INTO `ums_area` VALUES (2701, 513228, 5132, '黑水县');
INSERT INTO `ums_area` VALUES (2702, 513229, 5132, '马尔康县');
INSERT INTO `ums_area` VALUES (2703, 513230, 5132, '壤塘县');
INSERT INTO `ums_area` VALUES (2704, 513231, 5132, '阿坝县');
INSERT INTO `ums_area` VALUES (2705, 513232, 5132, '若尔盖县');
INSERT INTO `ums_area` VALUES (2706, 513233, 5132, '红原县');
INSERT INTO `ums_area` VALUES (2707, 5133, 51, '甘孜藏族自治州');
INSERT INTO `ums_area` VALUES (2708, 513321, 5133, '康定县');
INSERT INTO `ums_area` VALUES (2709, 513322, 5133, '泸定县');
INSERT INTO `ums_area` VALUES (2710, 513323, 5133, '丹巴县');
INSERT INTO `ums_area` VALUES (2711, 513324, 5133, '九龙县');
INSERT INTO `ums_area` VALUES (2712, 513325, 5133, '雅江县');
INSERT INTO `ums_area` VALUES (2713, 513326, 5133, '道孚县');
INSERT INTO `ums_area` VALUES (2714, 513327, 5133, '炉霍县');
INSERT INTO `ums_area` VALUES (2715, 513328, 5133, '甘孜县');
INSERT INTO `ums_area` VALUES (2716, 513329, 5133, '新龙县');
INSERT INTO `ums_area` VALUES (2717, 513330, 5133, '德格县');
INSERT INTO `ums_area` VALUES (2718, 513331, 5133, '白玉县');
INSERT INTO `ums_area` VALUES (2719, 513332, 5133, '石渠县');
INSERT INTO `ums_area` VALUES (2720, 513333, 5133, '色达县');
INSERT INTO `ums_area` VALUES (2721, 513334, 5133, '理塘县');
INSERT INTO `ums_area` VALUES (2722, 513335, 5133, '巴塘县');
INSERT INTO `ums_area` VALUES (2723, 513336, 5133, '乡城县');
INSERT INTO `ums_area` VALUES (2724, 513337, 5133, '稻城县');
INSERT INTO `ums_area` VALUES (2725, 513338, 5133, '得荣县');
INSERT INTO `ums_area` VALUES (2726, 5134, 51, '凉山彝族自治州');
INSERT INTO `ums_area` VALUES (2727, 513401, 5134, '西昌市');
INSERT INTO `ums_area` VALUES (2728, 513422, 5134, '木里藏族自治县');
INSERT INTO `ums_area` VALUES (2729, 513423, 5134, '盐源县');
INSERT INTO `ums_area` VALUES (2730, 513424, 5134, '德昌县');
INSERT INTO `ums_area` VALUES (2731, 513425, 5134, '会理县');
INSERT INTO `ums_area` VALUES (2732, 513426, 5134, '会东县');
INSERT INTO `ums_area` VALUES (2733, 513427, 5134, '宁南县');
INSERT INTO `ums_area` VALUES (2734, 513428, 5134, '普格县');
INSERT INTO `ums_area` VALUES (2735, 513429, 5134, '布拖县');
INSERT INTO `ums_area` VALUES (2736, 513430, 5134, '金阳县');
INSERT INTO `ums_area` VALUES (2737, 513431, 5134, '昭觉县');
INSERT INTO `ums_area` VALUES (2738, 513432, 5134, '喜德县');
INSERT INTO `ums_area` VALUES (2739, 513433, 5134, '冕宁县');
INSERT INTO `ums_area` VALUES (2740, 513434, 5134, '越西县');
INSERT INTO `ums_area` VALUES (2741, 513435, 5134, '甘洛县');
INSERT INTO `ums_area` VALUES (2742, 513436, 5134, '美姑县');
INSERT INTO `ums_area` VALUES (2743, 513437, 5134, '雷波县');
INSERT INTO `ums_area` VALUES (2744, 52, 0, '贵州');
INSERT INTO `ums_area` VALUES (2745, 5201, 52, '贵阳');
INSERT INTO `ums_area` VALUES (2746, 520101, 5201, '市辖区');
INSERT INTO `ums_area` VALUES (2747, 520102, 5201, '南明区');
INSERT INTO `ums_area` VALUES (2748, 520103, 5201, '云岩区');
INSERT INTO `ums_area` VALUES (2749, 520111, 5201, '花溪区');
INSERT INTO `ums_area` VALUES (2750, 520112, 5201, '乌当区');
INSERT INTO `ums_area` VALUES (2751, 520113, 5201, '白云区');
INSERT INTO `ums_area` VALUES (2752, 520114, 5201, '小河区');
INSERT INTO `ums_area` VALUES (2753, 520121, 5201, '开阳县');
INSERT INTO `ums_area` VALUES (2754, 520122, 5201, '息烽县');
INSERT INTO `ums_area` VALUES (2755, 520123, 5201, '修文县');
INSERT INTO `ums_area` VALUES (2756, 520181, 5201, '清镇市');
INSERT INTO `ums_area` VALUES (2757, 5202, 52, '六盘水');
INSERT INTO `ums_area` VALUES (2758, 520201, 5202, '钟山区');
INSERT INTO `ums_area` VALUES (2759, 520203, 5202, '六枝特区');
INSERT INTO `ums_area` VALUES (2760, 520221, 5202, '水城县');
INSERT INTO `ums_area` VALUES (2761, 520222, 5202, '盘 县');
INSERT INTO `ums_area` VALUES (2762, 5203, 52, '遵义');
INSERT INTO `ums_area` VALUES (2763, 520301, 5203, '市辖区');
INSERT INTO `ums_area` VALUES (2764, 520302, 5203, '红花岗区');
INSERT INTO `ums_area` VALUES (2765, 520321, 5203, '遵义县');
INSERT INTO `ums_area` VALUES (2766, 520322, 5203, '桐梓县');
INSERT INTO `ums_area` VALUES (2767, 520323, 5203, '绥阳县');
INSERT INTO `ums_area` VALUES (2768, 520324, 5203, '正安县');
INSERT INTO `ums_area` VALUES (2769, 520325, 5203, '道真仡佬族苗族自治县');
INSERT INTO `ums_area` VALUES (2770, 520326, 5203, '务川仡佬族苗族自治县');
INSERT INTO `ums_area` VALUES (2771, 520327, 5203, '凤冈县');
INSERT INTO `ums_area` VALUES (2772, 520328, 5203, '湄潭县');
INSERT INTO `ums_area` VALUES (2773, 520329, 5203, '余庆县');
INSERT INTO `ums_area` VALUES (2774, 520330, 5203, '习水县');
INSERT INTO `ums_area` VALUES (2775, 520381, 5203, '赤水市');
INSERT INTO `ums_area` VALUES (2776, 520382, 5203, '仁怀市');
INSERT INTO `ums_area` VALUES (2777, 5204, 52, '安顺');
INSERT INTO `ums_area` VALUES (2778, 520401, 5204, '市辖区');
INSERT INTO `ums_area` VALUES (2779, 520402, 5204, '西秀区');
INSERT INTO `ums_area` VALUES (2780, 520421, 5204, '平坝县');
INSERT INTO `ums_area` VALUES (2781, 520422, 5204, '普定县');
INSERT INTO `ums_area` VALUES (2782, 520423, 5204, '镇宁布依族苗族自治县');
INSERT INTO `ums_area` VALUES (2783, 520424, 5204, '关岭布依族苗族自治县');
INSERT INTO `ums_area` VALUES (2784, 520425, 5204, '紫云苗族布依族自治县');
INSERT INTO `ums_area` VALUES (2785, 5222, 52, '铜仁地区');
INSERT INTO `ums_area` VALUES (2786, 522201, 5222, '铜仁市');
INSERT INTO `ums_area` VALUES (2787, 522222, 5222, '江口县');
INSERT INTO `ums_area` VALUES (2788, 522223, 5222, '玉屏侗族自治县');
INSERT INTO `ums_area` VALUES (2789, 522224, 5222, '石阡县');
INSERT INTO `ums_area` VALUES (2790, 522225, 5222, '思南县');
INSERT INTO `ums_area` VALUES (2791, 522226, 5222, '印江土家族苗族自治县');
INSERT INTO `ums_area` VALUES (2792, 522227, 5222, '德江县');
INSERT INTO `ums_area` VALUES (2793, 522228, 5222, '沿河土家族自治县');
INSERT INTO `ums_area` VALUES (2794, 522229, 5222, '松桃苗族自治县');
INSERT INTO `ums_area` VALUES (2795, 522230, 5222, '万山特区');
INSERT INTO `ums_area` VALUES (2796, 5223, 52, '黔西南布依族苗族自治');
INSERT INTO `ums_area` VALUES (2797, 522301, 5223, '兴义市');
INSERT INTO `ums_area` VALUES (2798, 522322, 5223, '兴仁县');
INSERT INTO `ums_area` VALUES (2799, 522323, 5223, '普安县');
INSERT INTO `ums_area` VALUES (2800, 522324, 5223, '晴隆县');
INSERT INTO `ums_area` VALUES (2801, 522325, 5223, '贞丰县');
INSERT INTO `ums_area` VALUES (2802, 522326, 5223, '望谟县');
INSERT INTO `ums_area` VALUES (2803, 522327, 5223, '册亨县');
INSERT INTO `ums_area` VALUES (2804, 522328, 5223, '安龙县');
INSERT INTO `ums_area` VALUES (2805, 5224, 52, '毕节地区');
INSERT INTO `ums_area` VALUES (2806, 522401, 5224, '毕节市');
INSERT INTO `ums_area` VALUES (2807, 522422, 5224, '大方县');
INSERT INTO `ums_area` VALUES (2808, 522423, 5224, '黔西县');
INSERT INTO `ums_area` VALUES (2809, 522424, 5224, '金沙县');
INSERT INTO `ums_area` VALUES (2810, 522425, 5224, '织金县');
INSERT INTO `ums_area` VALUES (2811, 522426, 5224, '纳雍县');
INSERT INTO `ums_area` VALUES (2812, 522427, 5224, '威宁彝族回族苗族自治');
INSERT INTO `ums_area` VALUES (2813, 522428, 5224, '赫章县');
INSERT INTO `ums_area` VALUES (2814, 5226, 52, '黔东南苗族侗族自治州');
INSERT INTO `ums_area` VALUES (2815, 522601, 5226, '凯里市');
INSERT INTO `ums_area` VALUES (2816, 522622, 5226, '黄平县');
INSERT INTO `ums_area` VALUES (2817, 522623, 5226, '施秉县');
INSERT INTO `ums_area` VALUES (2818, 522624, 5226, '三穗县');
INSERT INTO `ums_area` VALUES (2819, 522625, 5226, '镇远县');
INSERT INTO `ums_area` VALUES (2820, 522626, 5226, '岑巩县');
INSERT INTO `ums_area` VALUES (2821, 522627, 5226, '天柱县');
INSERT INTO `ums_area` VALUES (2822, 522628, 5226, '锦屏县');
INSERT INTO `ums_area` VALUES (2823, 522629, 5226, '剑河县');
INSERT INTO `ums_area` VALUES (2824, 522630, 5226, '台江县');
INSERT INTO `ums_area` VALUES (2825, 522631, 5226, '黎平县');
INSERT INTO `ums_area` VALUES (2826, 522632, 5226, '榕江县');
INSERT INTO `ums_area` VALUES (2827, 522633, 5226, '从江县');
INSERT INTO `ums_area` VALUES (2828, 522634, 5226, '雷山县');
INSERT INTO `ums_area` VALUES (2829, 522635, 5226, '麻江县');
INSERT INTO `ums_area` VALUES (2830, 522636, 5226, '丹寨县');
INSERT INTO `ums_area` VALUES (2831, 5227, 52, '黔南布依族苗族自治州');
INSERT INTO `ums_area` VALUES (2832, 522701, 5227, '都匀市');
INSERT INTO `ums_area` VALUES (2833, 522702, 5227, '福泉市');
INSERT INTO `ums_area` VALUES (2834, 522722, 5227, '荔波县');
INSERT INTO `ums_area` VALUES (2835, 522723, 5227, '贵定县');
INSERT INTO `ums_area` VALUES (2836, 522725, 5227, '瓮安县');
INSERT INTO `ums_area` VALUES (2837, 522726, 5227, '独山县');
INSERT INTO `ums_area` VALUES (2838, 522727, 5227, '平塘县');
INSERT INTO `ums_area` VALUES (2839, 522728, 5227, '罗甸县');
INSERT INTO `ums_area` VALUES (2840, 522729, 5227, '长顺县');
INSERT INTO `ums_area` VALUES (2841, 522730, 5227, '龙里县');
INSERT INTO `ums_area` VALUES (2842, 522731, 5227, '惠水县');
INSERT INTO `ums_area` VALUES (2843, 522732, 5227, '三都水族自治县');
INSERT INTO `ums_area` VALUES (2844, 53, 0, '云南');
INSERT INTO `ums_area` VALUES (2845, 5301, 53, '昆明');
INSERT INTO `ums_area` VALUES (2846, 530101, 5301, '市辖区');
INSERT INTO `ums_area` VALUES (2847, 530102, 5301, '五华区');
INSERT INTO `ums_area` VALUES (2848, 530103, 5301, '盘龙区');
INSERT INTO `ums_area` VALUES (2849, 530111, 5301, '官渡区');
INSERT INTO `ums_area` VALUES (2850, 530112, 5301, '西山区');
INSERT INTO `ums_area` VALUES (2851, 530113, 5301, '东川区');
INSERT INTO `ums_area` VALUES (2852, 530121, 5301, '呈贡县');
INSERT INTO `ums_area` VALUES (2853, 530122, 5301, '晋宁县');
INSERT INTO `ums_area` VALUES (2854, 530124, 5301, '富民县');
INSERT INTO `ums_area` VALUES (2855, 530125, 5301, '宜良县');
INSERT INTO `ums_area` VALUES (2856, 530126, 5301, '石林彝族自治县');
INSERT INTO `ums_area` VALUES (2857, 530127, 5301, '嵩明县');
INSERT INTO `ums_area` VALUES (2858, 530128, 5301, '禄劝彝族苗族自治县');
INSERT INTO `ums_area` VALUES (2859, 530129, 5301, '寻甸回族彝族自治县');
INSERT INTO `ums_area` VALUES (2860, 530181, 5301, '安宁市');
INSERT INTO `ums_area` VALUES (2861, 5303, 53, '曲靖');
INSERT INTO `ums_area` VALUES (2862, 530301, 5303, '市辖区');
INSERT INTO `ums_area` VALUES (2863, 530302, 5303, '麒麟区');
INSERT INTO `ums_area` VALUES (2864, 530321, 5303, '马龙县');
INSERT INTO `ums_area` VALUES (2865, 530322, 5303, '陆良县');
INSERT INTO `ums_area` VALUES (2866, 530323, 5303, '师宗县');
INSERT INTO `ums_area` VALUES (2867, 530324, 5303, '罗平县');
INSERT INTO `ums_area` VALUES (2868, 530325, 5303, '富源县');
INSERT INTO `ums_area` VALUES (2869, 530326, 5303, '会泽县');
INSERT INTO `ums_area` VALUES (2870, 530328, 5303, '沾益县');
INSERT INTO `ums_area` VALUES (2871, 530381, 5303, '宣威市');
INSERT INTO `ums_area` VALUES (2872, 5304, 53, '玉溪');
INSERT INTO `ums_area` VALUES (2873, 530401, 5304, '市辖区');
INSERT INTO `ums_area` VALUES (2874, 530402, 5304, '红塔区');
INSERT INTO `ums_area` VALUES (2875, 530421, 5304, '江川县');
INSERT INTO `ums_area` VALUES (2876, 530422, 5304, '澄江县');
INSERT INTO `ums_area` VALUES (2877, 530423, 5304, '通海县');
INSERT INTO `ums_area` VALUES (2878, 530424, 5304, '华宁县');
INSERT INTO `ums_area` VALUES (2879, 530425, 5304, '易门县');
INSERT INTO `ums_area` VALUES (2880, 530426, 5304, '峨山彝族自治县');
INSERT INTO `ums_area` VALUES (2881, 530427, 5304, '新平彝族傣族自治县');
INSERT INTO `ums_area` VALUES (2882, 530428, 5304, '元江哈尼族彝族傣族自');
INSERT INTO `ums_area` VALUES (2883, 5305, 53, '保山');
INSERT INTO `ums_area` VALUES (2884, 530501, 5305, '市辖区');
INSERT INTO `ums_area` VALUES (2885, 530502, 5305, '隆阳区');
INSERT INTO `ums_area` VALUES (2886, 530521, 5305, '施甸县');
INSERT INTO `ums_area` VALUES (2887, 530522, 5305, '腾冲县');
INSERT INTO `ums_area` VALUES (2888, 530523, 5305, '龙陵县');
INSERT INTO `ums_area` VALUES (2889, 530524, 5305, '昌宁县');
INSERT INTO `ums_area` VALUES (2890, 5321, 53, '昭通地区');
INSERT INTO `ums_area` VALUES (2891, 532101, 5321, '昭通市');
INSERT INTO `ums_area` VALUES (2892, 532122, 5321, '鲁甸县');
INSERT INTO `ums_area` VALUES (2893, 532123, 5321, '巧家县');
INSERT INTO `ums_area` VALUES (2894, 532124, 5321, '盐津县');
INSERT INTO `ums_area` VALUES (2895, 532125, 5321, '大关县');
INSERT INTO `ums_area` VALUES (2896, 532126, 5321, '永善县');
INSERT INTO `ums_area` VALUES (2897, 532127, 5321, '绥江县');
INSERT INTO `ums_area` VALUES (2898, 532128, 5321, '镇雄县');
INSERT INTO `ums_area` VALUES (2899, 532129, 5321, '彝良县');
INSERT INTO `ums_area` VALUES (2900, 532130, 5321, '威信县');
INSERT INTO `ums_area` VALUES (2901, 532131, 5321, '水富县');
INSERT INTO `ums_area` VALUES (2902, 5323, 53, '楚雄彝族自治州');
INSERT INTO `ums_area` VALUES (2903, 532301, 5323, '楚雄市');
INSERT INTO `ums_area` VALUES (2904, 532322, 5323, '双柏县');
INSERT INTO `ums_area` VALUES (2905, 532323, 5323, '牟定县');
INSERT INTO `ums_area` VALUES (2906, 532324, 5323, '南华县');
INSERT INTO `ums_area` VALUES (2907, 532325, 5323, '姚安县');
INSERT INTO `ums_area` VALUES (2908, 532326, 5323, '大姚县');
INSERT INTO `ums_area` VALUES (2909, 532327, 5323, '永仁县');
INSERT INTO `ums_area` VALUES (2910, 532328, 5323, '元谋县');
INSERT INTO `ums_area` VALUES (2911, 532329, 5323, '武定县');
INSERT INTO `ums_area` VALUES (2912, 532331, 5323, '禄丰县');
INSERT INTO `ums_area` VALUES (2913, 5325, 53, '红河哈尼族彝族自治州');
INSERT INTO `ums_area` VALUES (2914, 532501, 5325, '个旧市');
INSERT INTO `ums_area` VALUES (2915, 532502, 5325, '开远市');
INSERT INTO `ums_area` VALUES (2916, 532522, 5325, '蒙自县');
INSERT INTO `ums_area` VALUES (2917, 532523, 5325, '屏边苗族自治县');
INSERT INTO `ums_area` VALUES (2918, 532524, 5325, '建水县');
INSERT INTO `ums_area` VALUES (2919, 532525, 5325, '石屏县');
INSERT INTO `ums_area` VALUES (2920, 532526, 5325, '弥勒县');
INSERT INTO `ums_area` VALUES (2921, 532527, 5325, '泸西县');
INSERT INTO `ums_area` VALUES (2922, 532528, 5325, '元阳县');
INSERT INTO `ums_area` VALUES (2923, 532529, 5325, '红河县');
INSERT INTO `ums_area` VALUES (2924, 532530, 5325, '金平苗族瑶族傣族自治');
INSERT INTO `ums_area` VALUES (2925, 532531, 5325, '绿春县');
INSERT INTO `ums_area` VALUES (2926, 532532, 5325, '河口瑶族自治县');
INSERT INTO `ums_area` VALUES (2927, 5326, 53, '文山壮族苗族自治州');
INSERT INTO `ums_area` VALUES (2928, 532621, 5326, '文山县');
INSERT INTO `ums_area` VALUES (2929, 532622, 5326, '砚山县');
INSERT INTO `ums_area` VALUES (2930, 532623, 5326, '西畴县');
INSERT INTO `ums_area` VALUES (2931, 532624, 5326, '麻栗坡县');
INSERT INTO `ums_area` VALUES (2932, 532625, 5326, '马关县');
INSERT INTO `ums_area` VALUES (2933, 532626, 5326, '丘北县');
INSERT INTO `ums_area` VALUES (2934, 532627, 5326, '广南县');
INSERT INTO `ums_area` VALUES (2935, 532628, 5326, '富宁县');
INSERT INTO `ums_area` VALUES (2936, 5327, 53, '思茅地区');
INSERT INTO `ums_area` VALUES (2937, 532701, 5327, '思茅市');
INSERT INTO `ums_area` VALUES (2938, 532722, 5327, '普洱哈尼族彝族自治县');
INSERT INTO `ums_area` VALUES (2939, 532723, 5327, '墨江哈尼族自治县');
INSERT INTO `ums_area` VALUES (2940, 532724, 5327, '景东彝族自治县');
INSERT INTO `ums_area` VALUES (2941, 532725, 5327, '景谷傣族彝族自治县');
INSERT INTO `ums_area` VALUES (2942, 532726, 5327, '镇沅彝族哈尼族拉祜族');
INSERT INTO `ums_area` VALUES (2943, 532727, 5327, '江城哈尼族彝族自治县');
INSERT INTO `ums_area` VALUES (2944, 532728, 5327, '孟连傣族拉祜族佤族自');
INSERT INTO `ums_area` VALUES (2945, 532729, 5327, '澜沧拉祜族自治县');
INSERT INTO `ums_area` VALUES (2946, 532730, 5327, '西盟佤族自治县');
INSERT INTO `ums_area` VALUES (2947, 5328, 53, '西双版纳傣族自治州');
INSERT INTO `ums_area` VALUES (2948, 532801, 5328, '景洪市');
INSERT INTO `ums_area` VALUES (2949, 532822, 5328, '勐海县');
INSERT INTO `ums_area` VALUES (2950, 532823, 5328, '勐腊县');
INSERT INTO `ums_area` VALUES (2951, 5329, 53, '大理白族自治州');
INSERT INTO `ums_area` VALUES (2952, 532901, 5329, '大理市');
INSERT INTO `ums_area` VALUES (2953, 532922, 5329, '漾濞彝族自治县');
INSERT INTO `ums_area` VALUES (2954, 532923, 5329, '祥云县');
INSERT INTO `ums_area` VALUES (2955, 532924, 5329, '宾川县');
INSERT INTO `ums_area` VALUES (2956, 532925, 5329, '弥渡县');
INSERT INTO `ums_area` VALUES (2957, 532926, 5329, '南涧彝族自治县');
INSERT INTO `ums_area` VALUES (2958, 532927, 5329, '巍山彝族回族自治县');
INSERT INTO `ums_area` VALUES (2959, 532928, 5329, '永平县');
INSERT INTO `ums_area` VALUES (2960, 532929, 5329, '云龙县');
INSERT INTO `ums_area` VALUES (2961, 532930, 5329, '洱源县');
INSERT INTO `ums_area` VALUES (2962, 532931, 5329, '剑川县');
INSERT INTO `ums_area` VALUES (2963, 532932, 5329, '鹤庆县');
INSERT INTO `ums_area` VALUES (2964, 5331, 53, '德宏傣族景颇族自治州');
INSERT INTO `ums_area` VALUES (2965, 533102, 5331, '瑞丽市');
INSERT INTO `ums_area` VALUES (2966, 533103, 5331, '潞西市');
INSERT INTO `ums_area` VALUES (2967, 533122, 5331, '梁河县');
INSERT INTO `ums_area` VALUES (2968, 533123, 5331, '盈江县');
INSERT INTO `ums_area` VALUES (2969, 533124, 5331, '陇川县');
INSERT INTO `ums_area` VALUES (2970, 5332, 53, '丽江地区');
INSERT INTO `ums_area` VALUES (2971, 533221, 5332, '丽江纳西族自治县');
INSERT INTO `ums_area` VALUES (2972, 533222, 5332, '永胜县');
INSERT INTO `ums_area` VALUES (2973, 533223, 5332, '华坪县');
INSERT INTO `ums_area` VALUES (2974, 533224, 5332, '宁蒗彝族自治县');
INSERT INTO `ums_area` VALUES (2975, 5333, 53, '怒江傈僳族自治州');
INSERT INTO `ums_area` VALUES (2976, 533321, 5333, '泸水县');
INSERT INTO `ums_area` VALUES (2977, 533323, 5333, '福贡县');
INSERT INTO `ums_area` VALUES (2978, 533324, 5333, '贡山独龙族怒族自治县');
INSERT INTO `ums_area` VALUES (2979, 533325, 5333, '兰坪白族普米族自治县');
INSERT INTO `ums_area` VALUES (2980, 5334, 53, '迪庆藏族自治州');
INSERT INTO `ums_area` VALUES (2981, 533421, 5334, '中甸县');
INSERT INTO `ums_area` VALUES (2982, 533422, 5334, '德钦县');
INSERT INTO `ums_area` VALUES (2983, 533423, 5334, '维西傈僳族自治县');
INSERT INTO `ums_area` VALUES (2984, 5335, 53, '临沧地区');
INSERT INTO `ums_area` VALUES (2985, 533521, 5335, '临沧县');
INSERT INTO `ums_area` VALUES (2986, 533522, 5335, '凤庆县');
INSERT INTO `ums_area` VALUES (2987, 533523, 5335, '云 县');
INSERT INTO `ums_area` VALUES (2988, 533524, 5335, '永德县');
INSERT INTO `ums_area` VALUES (2989, 533525, 5335, '镇康县');
INSERT INTO `ums_area` VALUES (2990, 533526, 5335, '双江拉祜族佤族布朗族');
INSERT INTO `ums_area` VALUES (2991, 533527, 5335, '耿马傣族佤族自治县');
INSERT INTO `ums_area` VALUES (2992, 533528, 5335, '沧源佤族自治县');
INSERT INTO `ums_area` VALUES (2993, 54, 0, '西藏');
INSERT INTO `ums_area` VALUES (2994, 5401, 54, '拉萨');
INSERT INTO `ums_area` VALUES (2995, 540101, 5401, '市辖区');
INSERT INTO `ums_area` VALUES (2996, 540102, 5401, '城关区');
INSERT INTO `ums_area` VALUES (2997, 540121, 5401, '林周县');
INSERT INTO `ums_area` VALUES (2998, 540122, 5401, '当雄县');
INSERT INTO `ums_area` VALUES (2999, 540123, 5401, '尼木县');
INSERT INTO `ums_area` VALUES (3000, 540124, 5401, '曲水县');
INSERT INTO `ums_area` VALUES (3001, 540125, 5401, '堆龙德庆县');
INSERT INTO `ums_area` VALUES (3002, 540126, 5401, '达孜县');
INSERT INTO `ums_area` VALUES (3003, 540127, 5401, '墨竹工卡县');
INSERT INTO `ums_area` VALUES (3004, 5421, 54, '昌都地区');
INSERT INTO `ums_area` VALUES (3005, 542121, 5421, '昌都县');
INSERT INTO `ums_area` VALUES (3006, 542122, 5421, '江达县');
INSERT INTO `ums_area` VALUES (3007, 542123, 5421, '贡觉县');
INSERT INTO `ums_area` VALUES (3008, 542124, 5421, '类乌齐县');
INSERT INTO `ums_area` VALUES (3009, 542125, 5421, '丁青县');
INSERT INTO `ums_area` VALUES (3010, 542126, 5421, '察雅县');
INSERT INTO `ums_area` VALUES (3011, 542127, 5421, '八宿县');
INSERT INTO `ums_area` VALUES (3012, 542128, 5421, '左贡县');
INSERT INTO `ums_area` VALUES (3013, 542129, 5421, '芒康县');
INSERT INTO `ums_area` VALUES (3014, 542132, 5421, '洛隆县');
INSERT INTO `ums_area` VALUES (3015, 542133, 5421, '边坝县');
INSERT INTO `ums_area` VALUES (3016, 5422, 54, '山南地区');
INSERT INTO `ums_area` VALUES (3017, 542221, 5422, '乃东县');
INSERT INTO `ums_area` VALUES (3018, 542222, 5422, '扎囊县');
INSERT INTO `ums_area` VALUES (3019, 542223, 5422, '贡嘎县');
INSERT INTO `ums_area` VALUES (3020, 542224, 5422, '桑日县');
INSERT INTO `ums_area` VALUES (3021, 542225, 5422, '琼结县');
INSERT INTO `ums_area` VALUES (3022, 542226, 5422, '曲松县');
INSERT INTO `ums_area` VALUES (3023, 542227, 5422, '措美县');
INSERT INTO `ums_area` VALUES (3024, 542228, 5422, '洛扎县');
INSERT INTO `ums_area` VALUES (3025, 542229, 5422, '加查县');
INSERT INTO `ums_area` VALUES (3026, 542231, 5422, '隆子县');
INSERT INTO `ums_area` VALUES (3027, 542232, 5422, '错那县');
INSERT INTO `ums_area` VALUES (3028, 542233, 5422, '浪卡子县');
INSERT INTO `ums_area` VALUES (3029, 5423, 54, '日喀则地区');
INSERT INTO `ums_area` VALUES (3030, 542301, 5423, '日喀则市');
INSERT INTO `ums_area` VALUES (3031, 542322, 5423, '南木林县');
INSERT INTO `ums_area` VALUES (3032, 542323, 5423, '江孜县');
INSERT INTO `ums_area` VALUES (3033, 542324, 5423, '定日县');
INSERT INTO `ums_area` VALUES (3034, 542325, 5423, '萨迦县');
INSERT INTO `ums_area` VALUES (3035, 542326, 5423, '拉孜县');
INSERT INTO `ums_area` VALUES (3036, 542327, 5423, '昂仁县');
INSERT INTO `ums_area` VALUES (3037, 542328, 5423, '谢通门县');
INSERT INTO `ums_area` VALUES (3038, 542329, 5423, '白朗县');
INSERT INTO `ums_area` VALUES (3039, 542330, 5423, '仁布县');
INSERT INTO `ums_area` VALUES (3040, 542331, 5423, '康马县');
INSERT INTO `ums_area` VALUES (3041, 542332, 5423, '定结县');
INSERT INTO `ums_area` VALUES (3042, 542333, 5423, '仲巴县');
INSERT INTO `ums_area` VALUES (3043, 542334, 5423, '亚东县');
INSERT INTO `ums_area` VALUES (3044, 542335, 5423, '吉隆县');
INSERT INTO `ums_area` VALUES (3045, 542336, 5423, '聂拉木县');
INSERT INTO `ums_area` VALUES (3046, 542337, 5423, '萨嘎县');
INSERT INTO `ums_area` VALUES (3047, 542338, 5423, '岗巴县');
INSERT INTO `ums_area` VALUES (3048, 5424, 54, '那曲地区');
INSERT INTO `ums_area` VALUES (3049, 542421, 5424, '那曲县');
INSERT INTO `ums_area` VALUES (3050, 542422, 5424, '嘉黎县');
INSERT INTO `ums_area` VALUES (3051, 542423, 5424, '比如县');
INSERT INTO `ums_area` VALUES (3052, 542424, 5424, '聂荣县');
INSERT INTO `ums_area` VALUES (3053, 542425, 5424, '安多县');
INSERT INTO `ums_area` VALUES (3054, 542426, 5424, '申扎县');
INSERT INTO `ums_area` VALUES (3055, 542427, 5424, '索 县');
INSERT INTO `ums_area` VALUES (3056, 542428, 5424, '班戈县');
INSERT INTO `ums_area` VALUES (3057, 542429, 5424, '巴青县');
INSERT INTO `ums_area` VALUES (3058, 542430, 5424, '尼玛县');
INSERT INTO `ums_area` VALUES (3059, 5425, 54, '阿里地区');
INSERT INTO `ums_area` VALUES (3060, 542521, 5425, '普兰县');
INSERT INTO `ums_area` VALUES (3061, 542522, 5425, '札达县');
INSERT INTO `ums_area` VALUES (3062, 542523, 5425, '噶尔县');
INSERT INTO `ums_area` VALUES (3063, 542524, 5425, '日土县');
INSERT INTO `ums_area` VALUES (3064, 542525, 5425, '革吉县');
INSERT INTO `ums_area` VALUES (3065, 542526, 5425, '改则县');
INSERT INTO `ums_area` VALUES (3066, 542527, 5425, '措勤县');
INSERT INTO `ums_area` VALUES (3067, 5426, 54, '林芝地区');
INSERT INTO `ums_area` VALUES (3068, 542621, 5426, '林芝县');
INSERT INTO `ums_area` VALUES (3069, 542622, 5426, '工布江达县');
INSERT INTO `ums_area` VALUES (3070, 542623, 5426, '米林县');
INSERT INTO `ums_area` VALUES (3071, 542624, 5426, '墨脱县');
INSERT INTO `ums_area` VALUES (3072, 542625, 5426, '波密县');
INSERT INTO `ums_area` VALUES (3073, 542626, 5426, '察隅县');
INSERT INTO `ums_area` VALUES (3074, 542627, 5426, '朗 县');
INSERT INTO `ums_area` VALUES (3075, 61, 0, '陕西');
INSERT INTO `ums_area` VALUES (3076, 6101, 61, '西安');
INSERT INTO `ums_area` VALUES (3077, 610101, 6101, '市辖区');
INSERT INTO `ums_area` VALUES (3078, 610102, 6101, '新城区');
INSERT INTO `ums_area` VALUES (3079, 610103, 6101, '碑林区');
INSERT INTO `ums_area` VALUES (3080, 610104, 6101, '莲湖区');
INSERT INTO `ums_area` VALUES (3081, 610111, 6101, '灞桥区');
INSERT INTO `ums_area` VALUES (3082, 610112, 6101, '未央区');
INSERT INTO `ums_area` VALUES (3083, 610113, 6101, '雁塔区');
INSERT INTO `ums_area` VALUES (3084, 610114, 6101, '阎良区');
INSERT INTO `ums_area` VALUES (3085, 610115, 6101, '临潼区');
INSERT INTO `ums_area` VALUES (3086, 610121, 6101, '长安县');
INSERT INTO `ums_area` VALUES (3087, 610122, 6101, '蓝田县');
INSERT INTO `ums_area` VALUES (3088, 610124, 6101, '周至县');
INSERT INTO `ums_area` VALUES (3089, 610125, 6101, '户 县');
INSERT INTO `ums_area` VALUES (3090, 610126, 6101, '高陵县');
INSERT INTO `ums_area` VALUES (3091, 6102, 61, '铜川');
INSERT INTO `ums_area` VALUES (3092, 610201, 6102, '市辖区');
INSERT INTO `ums_area` VALUES (3093, 610202, 6102, '王益区');
INSERT INTO `ums_area` VALUES (3094, 610203, 6102, '印台区');
INSERT INTO `ums_area` VALUES (3095, 610221, 6102, '耀 县');
INSERT INTO `ums_area` VALUES (3096, 610222, 6102, '宜君县');
INSERT INTO `ums_area` VALUES (3097, 6103, 61, '宝鸡');
INSERT INTO `ums_area` VALUES (3098, 610301, 6103, '市辖区');
INSERT INTO `ums_area` VALUES (3099, 610302, 6103, '渭滨区');
INSERT INTO `ums_area` VALUES (3100, 610303, 6103, '金台区');
INSERT INTO `ums_area` VALUES (3101, 610321, 6103, '宝鸡县');
INSERT INTO `ums_area` VALUES (3102, 610322, 6103, '凤翔县');
INSERT INTO `ums_area` VALUES (3103, 610323, 6103, '岐山县');
INSERT INTO `ums_area` VALUES (3104, 610324, 6103, '扶风县');
INSERT INTO `ums_area` VALUES (3105, 610326, 6103, '眉 县');
INSERT INTO `ums_area` VALUES (3106, 610327, 6103, '陇 县');
INSERT INTO `ums_area` VALUES (3107, 610328, 6103, '千阳县');
INSERT INTO `ums_area` VALUES (3108, 610329, 6103, '麟游县');
INSERT INTO `ums_area` VALUES (3109, 610330, 6103, '凤 县');
INSERT INTO `ums_area` VALUES (3110, 610331, 6103, '太白县');
INSERT INTO `ums_area` VALUES (3111, 6104, 61, '咸阳');
INSERT INTO `ums_area` VALUES (3112, 610401, 6104, '市辖区');
INSERT INTO `ums_area` VALUES (3113, 610402, 6104, '秦都区');
INSERT INTO `ums_area` VALUES (3114, 610403, 6104, '杨陵区');
INSERT INTO `ums_area` VALUES (3115, 610404, 6104, '渭城区');
INSERT INTO `ums_area` VALUES (3116, 610422, 6104, '三原县');
INSERT INTO `ums_area` VALUES (3117, 610423, 6104, '泾阳县');
INSERT INTO `ums_area` VALUES (3118, 610424, 6104, '乾 县');
INSERT INTO `ums_area` VALUES (3119, 610425, 6104, '礼泉县');
INSERT INTO `ums_area` VALUES (3120, 610426, 6104, '永寿县');
INSERT INTO `ums_area` VALUES (3121, 610427, 6104, '彬州市');
INSERT INTO `ums_area` VALUES (3122, 610428, 6104, '长武县');
INSERT INTO `ums_area` VALUES (3123, 610429, 6104, '旬邑县');
INSERT INTO `ums_area` VALUES (3124, 610430, 6104, '淳化县');
INSERT INTO `ums_area` VALUES (3125, 610431, 6104, '武功县');
INSERT INTO `ums_area` VALUES (3126, 610481, 6104, '兴平市');
INSERT INTO `ums_area` VALUES (3127, 6105, 61, '渭南');
INSERT INTO `ums_area` VALUES (3128, 610501, 6105, '市辖区');
INSERT INTO `ums_area` VALUES (3129, 610502, 6105, '临渭区');
INSERT INTO `ums_area` VALUES (3130, 610521, 6105, '华 县');
INSERT INTO `ums_area` VALUES (3131, 610522, 6105, '潼关县');
INSERT INTO `ums_area` VALUES (3132, 610523, 6105, '大荔县');
INSERT INTO `ums_area` VALUES (3133, 610524, 6105, '合阳县');
INSERT INTO `ums_area` VALUES (3134, 610525, 6105, '澄城县');
INSERT INTO `ums_area` VALUES (3135, 610526, 6105, '蒲城县');
INSERT INTO `ums_area` VALUES (3136, 610527, 6105, '白水县');
INSERT INTO `ums_area` VALUES (3137, 610528, 6105, '富平县');
INSERT INTO `ums_area` VALUES (3138, 610581, 6105, '韩城市');
INSERT INTO `ums_area` VALUES (3139, 610582, 6105, '华阴市');
INSERT INTO `ums_area` VALUES (3140, 6106, 61, '延安');
INSERT INTO `ums_area` VALUES (3141, 610601, 6106, '市辖区');
INSERT INTO `ums_area` VALUES (3142, 610602, 6106, '宝塔区');
INSERT INTO `ums_area` VALUES (3143, 610621, 6106, '延长县');
INSERT INTO `ums_area` VALUES (3144, 610622, 6106, '延川县');
INSERT INTO `ums_area` VALUES (3145, 610623, 6106, '子长县');
INSERT INTO `ums_area` VALUES (3146, 610624, 6106, '安塞县');
INSERT INTO `ums_area` VALUES (3147, 610625, 6106, '志丹县');
INSERT INTO `ums_area` VALUES (3148, 610626, 6106, '吴旗县');
INSERT INTO `ums_area` VALUES (3149, 610627, 6106, '甘泉县');
INSERT INTO `ums_area` VALUES (3150, 610628, 6106, '富 县');
INSERT INTO `ums_area` VALUES (3151, 610629, 6106, '洛川县');
INSERT INTO `ums_area` VALUES (3152, 610630, 6106, '宜川县');
INSERT INTO `ums_area` VALUES (3153, 610631, 6106, '黄龙县');
INSERT INTO `ums_area` VALUES (3154, 610632, 6106, '黄陵县');
INSERT INTO `ums_area` VALUES (3155, 6107, 61, '汉中');
INSERT INTO `ums_area` VALUES (3156, 610701, 6107, '市辖区');
INSERT INTO `ums_area` VALUES (3157, 610702, 6107, '汉台区');
INSERT INTO `ums_area` VALUES (3158, 610721, 6107, '南郑县');
INSERT INTO `ums_area` VALUES (3159, 610722, 6107, '城固县');
INSERT INTO `ums_area` VALUES (3160, 610723, 6107, '洋 县');
INSERT INTO `ums_area` VALUES (3161, 610724, 6107, '西乡县');
INSERT INTO `ums_area` VALUES (3162, 610725, 6107, '勉 县');
INSERT INTO `ums_area` VALUES (3163, 610726, 6107, '宁强县');
INSERT INTO `ums_area` VALUES (3164, 610727, 6107, '略阳县');
INSERT INTO `ums_area` VALUES (3165, 610728, 6107, '镇巴县');
INSERT INTO `ums_area` VALUES (3166, 610729, 6107, '留坝县');
INSERT INTO `ums_area` VALUES (3167, 610730, 6107, '佛坪县');
INSERT INTO `ums_area` VALUES (3168, 6108, 61, '榆林');
INSERT INTO `ums_area` VALUES (3169, 610801, 6108, '市辖区');
INSERT INTO `ums_area` VALUES (3170, 610802, 6108, '榆阳区');
INSERT INTO `ums_area` VALUES (3171, 610821, 6108, '神木县');
INSERT INTO `ums_area` VALUES (3172, 610822, 6108, '府谷县');
INSERT INTO `ums_area` VALUES (3173, 610823, 6108, '横山县');
INSERT INTO `ums_area` VALUES (3174, 610824, 6108, '靖边县');
INSERT INTO `ums_area` VALUES (3175, 610825, 6108, '定边县');
INSERT INTO `ums_area` VALUES (3176, 610826, 6108, '绥德县');
INSERT INTO `ums_area` VALUES (3177, 610827, 6108, '米脂县');
INSERT INTO `ums_area` VALUES (3178, 610828, 6108, '佳 县');
INSERT INTO `ums_area` VALUES (3179, 610829, 6108, '吴堡县');
INSERT INTO `ums_area` VALUES (3180, 610830, 6108, '清涧县');
INSERT INTO `ums_area` VALUES (3181, 610831, 6108, '子洲县');
INSERT INTO `ums_area` VALUES (3182, 6109, 61, '安康');
INSERT INTO `ums_area` VALUES (3183, 610901, 6109, '市辖区');
INSERT INTO `ums_area` VALUES (3184, 610902, 6109, '汉滨区');
INSERT INTO `ums_area` VALUES (3185, 610921, 6109, '汉阴县');
INSERT INTO `ums_area` VALUES (3186, 610922, 6109, '石泉县');
INSERT INTO `ums_area` VALUES (3187, 610923, 6109, '宁陕县');
INSERT INTO `ums_area` VALUES (3188, 610924, 6109, '紫阳县');
INSERT INTO `ums_area` VALUES (3189, 610925, 6109, '岚皋县');
INSERT INTO `ums_area` VALUES (3190, 610926, 6109, '平利县');
INSERT INTO `ums_area` VALUES (3191, 610927, 6109, '镇坪县');
INSERT INTO `ums_area` VALUES (3192, 610928, 6109, '旬阳县');
INSERT INTO `ums_area` VALUES (3193, 610929, 6109, '白河县');
INSERT INTO `ums_area` VALUES (3194, 6125, 61, '商洛地区');
INSERT INTO `ums_area` VALUES (3195, 612501, 6125, '商州市');
INSERT INTO `ums_area` VALUES (3196, 612522, 6125, '洛南县');
INSERT INTO `ums_area` VALUES (3197, 612523, 6125, '丹凤县');
INSERT INTO `ums_area` VALUES (3198, 612524, 6125, '商南县');
INSERT INTO `ums_area` VALUES (3199, 612525, 6125, '山阳县');
INSERT INTO `ums_area` VALUES (3200, 612526, 6125, '镇安县');
INSERT INTO `ums_area` VALUES (3201, 612527, 6125, '柞水县');
INSERT INTO `ums_area` VALUES (3202, 62, 0, '甘肃');
INSERT INTO `ums_area` VALUES (3203, 6201, 62, '兰州');
INSERT INTO `ums_area` VALUES (3204, 620101, 6201, '市辖区');
INSERT INTO `ums_area` VALUES (3205, 620102, 6201, '城关区');
INSERT INTO `ums_area` VALUES (3206, 620103, 6201, '七里河区');
INSERT INTO `ums_area` VALUES (3207, 620104, 6201, '西固区');
INSERT INTO `ums_area` VALUES (3208, 620105, 6201, '安宁区');
INSERT INTO `ums_area` VALUES (3209, 620111, 6201, '红古区');
INSERT INTO `ums_area` VALUES (3210, 620121, 6201, '永登县');
INSERT INTO `ums_area` VALUES (3211, 620122, 6201, '皋兰县');
INSERT INTO `ums_area` VALUES (3212, 620123, 6201, '榆中县');
INSERT INTO `ums_area` VALUES (3213, 6202, 62, '嘉峪关');
INSERT INTO `ums_area` VALUES (3214, 620201, 6202, '市辖区');
INSERT INTO `ums_area` VALUES (3215, 6203, 62, '金昌');
INSERT INTO `ums_area` VALUES (3216, 620301, 6203, '市辖区');
INSERT INTO `ums_area` VALUES (3217, 620302, 6203, '金川区');
INSERT INTO `ums_area` VALUES (3218, 620321, 6203, '永昌县');
INSERT INTO `ums_area` VALUES (3219, 6204, 62, '白银');
INSERT INTO `ums_area` VALUES (3220, 620401, 6204, '市辖区');
INSERT INTO `ums_area` VALUES (3221, 620402, 6204, '白银区');
INSERT INTO `ums_area` VALUES (3222, 620403, 6204, '平川区');
INSERT INTO `ums_area` VALUES (3223, 620421, 6204, '靖远县');
INSERT INTO `ums_area` VALUES (3224, 620422, 6204, '会宁县');
INSERT INTO `ums_area` VALUES (3225, 620423, 6204, '景泰县');
INSERT INTO `ums_area` VALUES (3226, 6205, 62, '天水');
INSERT INTO `ums_area` VALUES (3227, 620501, 6205, '市辖区');
INSERT INTO `ums_area` VALUES (3228, 620502, 6205, '秦城区');
INSERT INTO `ums_area` VALUES (3229, 620503, 6205, '北道区');
INSERT INTO `ums_area` VALUES (3230, 620521, 6205, '清水县');
INSERT INTO `ums_area` VALUES (3231, 620522, 6205, '秦安县');
INSERT INTO `ums_area` VALUES (3232, 620523, 6205, '甘谷县');
INSERT INTO `ums_area` VALUES (3233, 620524, 6205, '武山县');
INSERT INTO `ums_area` VALUES (3234, 620525, 6205, '张家川回族自治县');
INSERT INTO `ums_area` VALUES (3235, 6221, 62, '酒泉地区');
INSERT INTO `ums_area` VALUES (3236, 622101, 6221, '玉门市');
INSERT INTO `ums_area` VALUES (3237, 622102, 6221, '酒泉市');
INSERT INTO `ums_area` VALUES (3238, 622103, 6221, '敦煌市');
INSERT INTO `ums_area` VALUES (3239, 622123, 6221, '金塔县');
INSERT INTO `ums_area` VALUES (3240, 622124, 6221, '肃北蒙古族自治县');
INSERT INTO `ums_area` VALUES (3241, 622125, 6221, '阿克塞哈萨克族自治县');
INSERT INTO `ums_area` VALUES (3242, 622126, 6221, '安西县');
INSERT INTO `ums_area` VALUES (3243, 6222, 62, '张掖地区');
INSERT INTO `ums_area` VALUES (3244, 622201, 6222, '张掖市');
INSERT INTO `ums_area` VALUES (3245, 622222, 6222, '肃南裕固族自治县');
INSERT INTO `ums_area` VALUES (3246, 622223, 6222, '民乐县');
INSERT INTO `ums_area` VALUES (3247, 622224, 6222, '临泽县');
INSERT INTO `ums_area` VALUES (3248, 622225, 6222, '高台县');
INSERT INTO `ums_area` VALUES (3249, 622226, 6222, '山丹县');
INSERT INTO `ums_area` VALUES (3250, 6223, 62, '武威地区');
INSERT INTO `ums_area` VALUES (3251, 622301, 6223, '武威市');
INSERT INTO `ums_area` VALUES (3252, 622322, 6223, '民勤县');
INSERT INTO `ums_area` VALUES (3253, 622323, 6223, '古浪县');
INSERT INTO `ums_area` VALUES (3254, 622326, 6223, '天祝藏族自治县');
INSERT INTO `ums_area` VALUES (3255, 6224, 62, '定西地区');
INSERT INTO `ums_area` VALUES (3256, 622421, 6224, '定西县');
INSERT INTO `ums_area` VALUES (3257, 622424, 6224, '通渭县');
INSERT INTO `ums_area` VALUES (3258, 622425, 6224, '陇西县');
INSERT INTO `ums_area` VALUES (3259, 622426, 6224, '渭源县');
INSERT INTO `ums_area` VALUES (3260, 622427, 6224, '临洮县');
INSERT INTO `ums_area` VALUES (3261, 622428, 6224, '漳 县');
INSERT INTO `ums_area` VALUES (3262, 622429, 6224, '岷 县');
INSERT INTO `ums_area` VALUES (3263, 6226, 62, '陇南地区');
INSERT INTO `ums_area` VALUES (3264, 622621, 6226, '武都县');
INSERT INTO `ums_area` VALUES (3265, 622623, 6226, '宕昌县');
INSERT INTO `ums_area` VALUES (3266, 622624, 6226, '成 县');
INSERT INTO `ums_area` VALUES (3267, 622625, 6226, '康 县');
INSERT INTO `ums_area` VALUES (3268, 622626, 6226, '文 县');
INSERT INTO `ums_area` VALUES (3269, 622627, 6226, '西和县');
INSERT INTO `ums_area` VALUES (3270, 622628, 6226, '礼 县');
INSERT INTO `ums_area` VALUES (3271, 622629, 6226, '两当县');
INSERT INTO `ums_area` VALUES (3272, 622630, 6226, '徽 县');
INSERT INTO `ums_area` VALUES (3273, 6227, 62, '平凉地区');
INSERT INTO `ums_area` VALUES (3274, 622701, 6227, '平凉市');
INSERT INTO `ums_area` VALUES (3275, 622722, 6227, '泾川县');
INSERT INTO `ums_area` VALUES (3276, 622723, 6227, '灵台县');
INSERT INTO `ums_area` VALUES (3277, 622724, 6227, '崇信县');
INSERT INTO `ums_area` VALUES (3278, 622725, 6227, '华亭县');
INSERT INTO `ums_area` VALUES (3279, 622726, 6227, '庄浪县');
INSERT INTO `ums_area` VALUES (3280, 622727, 6227, '静宁县');
INSERT INTO `ums_area` VALUES (3281, 6228, 62, '庆阳地区');
INSERT INTO `ums_area` VALUES (3282, 622801, 6228, '西峰市');
INSERT INTO `ums_area` VALUES (3283, 622821, 6228, '庆阳县');
INSERT INTO `ums_area` VALUES (3284, 622822, 6228, '环 县');
INSERT INTO `ums_area` VALUES (3285, 622823, 6228, '华池县');
INSERT INTO `ums_area` VALUES (3286, 622824, 6228, '合水县');
INSERT INTO `ums_area` VALUES (3287, 622825, 6228, '正宁县');
INSERT INTO `ums_area` VALUES (3288, 622826, 6228, '宁 县');
INSERT INTO `ums_area` VALUES (3289, 622827, 6228, '镇原县');
INSERT INTO `ums_area` VALUES (3290, 6229, 62, '临夏回族自治州');
INSERT INTO `ums_area` VALUES (3291, 622901, 6229, '临夏市');
INSERT INTO `ums_area` VALUES (3292, 622921, 6229, '临夏县');
INSERT INTO `ums_area` VALUES (3293, 622922, 6229, '康乐县');
INSERT INTO `ums_area` VALUES (3294, 622923, 6229, '永靖县');
INSERT INTO `ums_area` VALUES (3295, 622924, 6229, '广河县');
INSERT INTO `ums_area` VALUES (3296, 622925, 6229, '和政县');
INSERT INTO `ums_area` VALUES (3297, 622926, 6229, '东乡族自治县');
INSERT INTO `ums_area` VALUES (3298, 622927, 6229, '积石山保安族东乡族撒');
INSERT INTO `ums_area` VALUES (3299, 6230, 62, '甘南藏族自治州');
INSERT INTO `ums_area` VALUES (3300, 623001, 6230, '合作市');
INSERT INTO `ums_area` VALUES (3301, 623021, 6230, '临潭县');
INSERT INTO `ums_area` VALUES (3302, 623022, 6230, '卓尼县');
INSERT INTO `ums_area` VALUES (3303, 623023, 6230, '舟曲县');
INSERT INTO `ums_area` VALUES (3304, 623024, 6230, '迭部县');
INSERT INTO `ums_area` VALUES (3305, 623025, 6230, '玛曲县');
INSERT INTO `ums_area` VALUES (3306, 623026, 6230, '碌曲县');
INSERT INTO `ums_area` VALUES (3307, 623027, 6230, '夏河县');
INSERT INTO `ums_area` VALUES (3308, 63, 0, '青海');
INSERT INTO `ums_area` VALUES (3309, 6301, 63, '西宁');
INSERT INTO `ums_area` VALUES (3310, 630101, 6301, '市辖区');
INSERT INTO `ums_area` VALUES (3311, 630102, 6301, '城东区');
INSERT INTO `ums_area` VALUES (3312, 630103, 6301, '城中区');
INSERT INTO `ums_area` VALUES (3313, 630104, 6301, '城西区');
INSERT INTO `ums_area` VALUES (3314, 630105, 6301, '城北区');
INSERT INTO `ums_area` VALUES (3315, 630121, 6301, '大通回族土族自治县');
INSERT INTO `ums_area` VALUES (3316, 630122, 6301, '湟中县');
INSERT INTO `ums_area` VALUES (3317, 630123, 6301, '湟源县');
INSERT INTO `ums_area` VALUES (3318, 6321, 63, '海东地区');
INSERT INTO `ums_area` VALUES (3319, 632121, 6321, '平安县');
INSERT INTO `ums_area` VALUES (3320, 632122, 6321, '民和回族土族自治县');
INSERT INTO `ums_area` VALUES (3321, 632123, 6321, '乐都县');
INSERT INTO `ums_area` VALUES (3322, 632126, 6321, '互助土族自治县');
INSERT INTO `ums_area` VALUES (3323, 632127, 6321, '化隆回族自治县');
INSERT INTO `ums_area` VALUES (3324, 632128, 6321, '循化撒拉族自治县');
INSERT INTO `ums_area` VALUES (3325, 6322, 63, '海北藏族自治州');
INSERT INTO `ums_area` VALUES (3326, 632221, 6322, '门源回族自治县');
INSERT INTO `ums_area` VALUES (3327, 632222, 6322, '祁连县');
INSERT INTO `ums_area` VALUES (3328, 632223, 6322, '海晏县');
INSERT INTO `ums_area` VALUES (3329, 632224, 6322, '刚察县');
INSERT INTO `ums_area` VALUES (3330, 6323, 63, '黄南藏族自治州');
INSERT INTO `ums_area` VALUES (3331, 632321, 6323, '同仁县');
INSERT INTO `ums_area` VALUES (3332, 632322, 6323, '尖扎县');
INSERT INTO `ums_area` VALUES (3333, 632323, 6323, '泽库县');
INSERT INTO `ums_area` VALUES (3334, 632324, 6323, '河南蒙古族自治县');
INSERT INTO `ums_area` VALUES (3335, 6325, 63, '海南藏族自治州');
INSERT INTO `ums_area` VALUES (3336, 632521, 6325, '共和县');
INSERT INTO `ums_area` VALUES (3337, 632522, 6325, '同德县');
INSERT INTO `ums_area` VALUES (3338, 632523, 6325, '贵德县');
INSERT INTO `ums_area` VALUES (3339, 632524, 6325, '兴海县');
INSERT INTO `ums_area` VALUES (3340, 632525, 6325, '贵南县');
INSERT INTO `ums_area` VALUES (3341, 6326, 63, '果洛藏族自治州');
INSERT INTO `ums_area` VALUES (3342, 632621, 6326, '玛沁县');
INSERT INTO `ums_area` VALUES (3343, 632622, 6326, '班玛县');
INSERT INTO `ums_area` VALUES (3344, 632623, 6326, '甘德县');
INSERT INTO `ums_area` VALUES (3345, 632624, 6326, '达日县');
INSERT INTO `ums_area` VALUES (3346, 632625, 6326, '久治县');
INSERT INTO `ums_area` VALUES (3347, 632626, 6326, '玛多县');
INSERT INTO `ums_area` VALUES (3348, 6327, 63, '玉树藏族自治州');
INSERT INTO `ums_area` VALUES (3349, 632721, 6327, '玉树县');
INSERT INTO `ums_area` VALUES (3350, 632722, 6327, '杂多县');
INSERT INTO `ums_area` VALUES (3351, 632723, 6327, '称多县');
INSERT INTO `ums_area` VALUES (3352, 632724, 6327, '治多县');
INSERT INTO `ums_area` VALUES (3353, 632725, 6327, '囊谦县');
INSERT INTO `ums_area` VALUES (3354, 632726, 6327, '曲麻莱县');
INSERT INTO `ums_area` VALUES (3355, 6328, 63, '海西蒙古族藏族自治州');
INSERT INTO `ums_area` VALUES (3356, 632801, 6328, '格尔木市');
INSERT INTO `ums_area` VALUES (3357, 632802, 6328, '德令哈市');
INSERT INTO `ums_area` VALUES (3358, 632821, 6328, '乌兰县');
INSERT INTO `ums_area` VALUES (3359, 632822, 6328, '都兰县');
INSERT INTO `ums_area` VALUES (3360, 632823, 6328, '天峻县');
INSERT INTO `ums_area` VALUES (3361, 64, 0, '宁夏回族自治区');
INSERT INTO `ums_area` VALUES (3362, 6401, 64, '银川');
INSERT INTO `ums_area` VALUES (3363, 640101, 6401, '市辖区');
INSERT INTO `ums_area` VALUES (3364, 640102, 6401, '城 区');
INSERT INTO `ums_area` VALUES (3365, 640103, 6401, '新城区');
INSERT INTO `ums_area` VALUES (3366, 640111, 6401, '郊 区');
INSERT INTO `ums_area` VALUES (3367, 640121, 6401, '永宁县');
INSERT INTO `ums_area` VALUES (3368, 640122, 6401, '贺兰县');
INSERT INTO `ums_area` VALUES (3369, 6402, 64, '石嘴山');
INSERT INTO `ums_area` VALUES (3370, 640201, 6402, '市辖区');
INSERT INTO `ums_area` VALUES (3371, 640202, 6402, '大武口区');
INSERT INTO `ums_area` VALUES (3372, 640203, 6402, '石嘴山区');
INSERT INTO `ums_area` VALUES (3373, 640204, 6402, '石炭井区');
INSERT INTO `ums_area` VALUES (3374, 640221, 6402, '平罗县');
INSERT INTO `ums_area` VALUES (3375, 640222, 6402, '陶乐县');
INSERT INTO `ums_area` VALUES (3376, 640223, 6402, '惠农县');
INSERT INTO `ums_area` VALUES (3377, 6403, 64, '吴忠');
INSERT INTO `ums_area` VALUES (3378, 640301, 6403, '市辖区');
INSERT INTO `ums_area` VALUES (3379, 640302, 6403, '利通区');
INSERT INTO `ums_area` VALUES (3380, 640321, 6403, '中卫县');
INSERT INTO `ums_area` VALUES (3381, 640322, 6403, '中宁县');
INSERT INTO `ums_area` VALUES (3382, 640323, 6403, '盐池县');
INSERT INTO `ums_area` VALUES (3383, 640324, 6403, '同心县');
INSERT INTO `ums_area` VALUES (3384, 640381, 6403, '青铜峡市');
INSERT INTO `ums_area` VALUES (3385, 640382, 6403, '灵武市');
INSERT INTO `ums_area` VALUES (3386, 6422, 64, '固原地区');
INSERT INTO `ums_area` VALUES (3387, 642221, 6422, '固原县');
INSERT INTO `ums_area` VALUES (3388, 642222, 6422, '海原县');
INSERT INTO `ums_area` VALUES (3389, 642223, 6422, '西吉县');
INSERT INTO `ums_area` VALUES (3390, 642224, 6422, '隆德县');
INSERT INTO `ums_area` VALUES (3391, 642225, 6422, '泾源县');
INSERT INTO `ums_area` VALUES (3392, 642226, 6422, '彭阳县');
INSERT INTO `ums_area` VALUES (3393, 65, 0, '新疆维吾尔自治区');
INSERT INTO `ums_area` VALUES (3394, 6501, 65, '乌鲁木齐');
INSERT INTO `ums_area` VALUES (3395, 650101, 6501, '市辖区');
INSERT INTO `ums_area` VALUES (3396, 650102, 6501, '天山区');
INSERT INTO `ums_area` VALUES (3397, 650103, 6501, '沙依巴克区');
INSERT INTO `ums_area` VALUES (3398, 650104, 6501, '新市区');
INSERT INTO `ums_area` VALUES (3399, 650105, 6501, '水磨沟区');
INSERT INTO `ums_area` VALUES (3400, 650106, 6501, '头屯河区');
INSERT INTO `ums_area` VALUES (3401, 650107, 6501, '南泉区');
INSERT INTO `ums_area` VALUES (3402, 650108, 6501, '东山区');
INSERT INTO `ums_area` VALUES (3403, 650121, 6501, '乌鲁木齐县');
INSERT INTO `ums_area` VALUES (3404, 6502, 65, '克拉玛依');
INSERT INTO `ums_area` VALUES (3405, 650201, 6502, '市辖区');
INSERT INTO `ums_area` VALUES (3406, 650202, 6502, '独山子区');
INSERT INTO `ums_area` VALUES (3407, 650203, 6502, '克拉玛依区');
INSERT INTO `ums_area` VALUES (3408, 650204, 6502, '白碱滩区');
INSERT INTO `ums_area` VALUES (3409, 650205, 6502, '乌尔禾区');
INSERT INTO `ums_area` VALUES (3410, 6521, 65, '吐鲁番地区');
INSERT INTO `ums_area` VALUES (3411, 652101, 6521, '吐鲁番市');
INSERT INTO `ums_area` VALUES (3412, 652122, 6521, '鄯善县');
INSERT INTO `ums_area` VALUES (3413, 652123, 6521, '托克逊县');
INSERT INTO `ums_area` VALUES (3414, 6522, 65, '哈密地区');
INSERT INTO `ums_area` VALUES (3415, 652201, 6522, '哈密市');
INSERT INTO `ums_area` VALUES (3416, 652222, 6522, '巴里坤哈萨克自治县');
INSERT INTO `ums_area` VALUES (3417, 652223, 6522, '伊吾县');
INSERT INTO `ums_area` VALUES (3418, 6523, 65, '昌吉回族自治州');
INSERT INTO `ums_area` VALUES (3419, 652301, 6523, '昌吉市');
INSERT INTO `ums_area` VALUES (3420, 652302, 6523, '阜康市');
INSERT INTO `ums_area` VALUES (3421, 652303, 6523, '米泉市');
INSERT INTO `ums_area` VALUES (3422, 652323, 6523, '呼图壁县');
INSERT INTO `ums_area` VALUES (3423, 652324, 6523, '玛纳斯县');
INSERT INTO `ums_area` VALUES (3424, 652325, 6523, '奇台县');
INSERT INTO `ums_area` VALUES (3425, 652327, 6523, '吉木萨尔县');
INSERT INTO `ums_area` VALUES (3426, 652328, 6523, '木垒哈萨克自治县');
INSERT INTO `ums_area` VALUES (3427, 6527, 65, '博尔塔拉蒙古自治州');
INSERT INTO `ums_area` VALUES (3428, 652701, 6527, '博乐市');
INSERT INTO `ums_area` VALUES (3429, 652722, 6527, '精河县');
INSERT INTO `ums_area` VALUES (3430, 652723, 6527, '温泉县');
INSERT INTO `ums_area` VALUES (3431, 6528, 65, '巴音郭楞蒙古自治州');
INSERT INTO `ums_area` VALUES (3432, 652801, 6528, '库尔勒市');
INSERT INTO `ums_area` VALUES (3433, 652822, 6528, '轮台县');
INSERT INTO `ums_area` VALUES (3434, 652823, 6528, '尉犁县');
INSERT INTO `ums_area` VALUES (3435, 652824, 6528, '若羌县');
INSERT INTO `ums_area` VALUES (3436, 652825, 6528, '且末县');
INSERT INTO `ums_area` VALUES (3437, 652826, 6528, '焉耆回族自治县');
INSERT INTO `ums_area` VALUES (3438, 652827, 6528, '和静县');
INSERT INTO `ums_area` VALUES (3439, 652828, 6528, '和硕县');
INSERT INTO `ums_area` VALUES (3440, 652829, 6528, '博湖县');
INSERT INTO `ums_area` VALUES (3441, 6529, 65, '阿克苏地区');
INSERT INTO `ums_area` VALUES (3442, 652901, 6529, '阿克苏市');
INSERT INTO `ums_area` VALUES (3443, 652922, 6529, '温宿县');
INSERT INTO `ums_area` VALUES (3444, 652923, 6529, '库车县');
INSERT INTO `ums_area` VALUES (3445, 652924, 6529, '沙雅县');
INSERT INTO `ums_area` VALUES (3446, 652925, 6529, '新和县');
INSERT INTO `ums_area` VALUES (3447, 652926, 6529, '拜城县');
INSERT INTO `ums_area` VALUES (3448, 652927, 6529, '乌什县');
INSERT INTO `ums_area` VALUES (3449, 652928, 6529, '阿瓦提县');
INSERT INTO `ums_area` VALUES (3450, 652929, 6529, '柯坪县');
INSERT INTO `ums_area` VALUES (3451, 6530, 65, '克孜勒苏柯尔克孜自治');
INSERT INTO `ums_area` VALUES (3452, 653001, 6530, '阿图什市');
INSERT INTO `ums_area` VALUES (3453, 653022, 6530, '阿克陶县');
INSERT INTO `ums_area` VALUES (3454, 653023, 6530, '阿合奇县');
INSERT INTO `ums_area` VALUES (3455, 653024, 6530, '乌恰县');
INSERT INTO `ums_area` VALUES (3456, 6531, 65, '喀什地区');
INSERT INTO `ums_area` VALUES (3457, 653101, 6531, '喀什市');
INSERT INTO `ums_area` VALUES (3458, 653121, 6531, '疏附县');
INSERT INTO `ums_area` VALUES (3459, 653122, 6531, '疏勒县');
INSERT INTO `ums_area` VALUES (3460, 653123, 6531, '英吉沙县');
INSERT INTO `ums_area` VALUES (3461, 653124, 6531, '泽普县');
INSERT INTO `ums_area` VALUES (3462, 653125, 6531, '莎车县');
INSERT INTO `ums_area` VALUES (3463, 653126, 6531, '叶城县');
INSERT INTO `ums_area` VALUES (3464, 653127, 6531, '麦盖提县');
INSERT INTO `ums_area` VALUES (3465, 653128, 6531, '岳普湖县');
INSERT INTO `ums_area` VALUES (3466, 653129, 6531, '伽师县');
INSERT INTO `ums_area` VALUES (3467, 653130, 6531, '巴楚县');
INSERT INTO `ums_area` VALUES (3468, 653131, 6531, '塔什库尔干塔吉克自治');
INSERT INTO `ums_area` VALUES (3469, 6532, 65, '和田地区');
INSERT INTO `ums_area` VALUES (3470, 653201, 6532, '和田市');
INSERT INTO `ums_area` VALUES (3471, 653221, 6532, '和田县');
INSERT INTO `ums_area` VALUES (3472, 653222, 6532, '墨玉县');
INSERT INTO `ums_area` VALUES (3473, 653223, 6532, '皮山县');
INSERT INTO `ums_area` VALUES (3474, 653224, 6532, '洛浦县');
INSERT INTO `ums_area` VALUES (3475, 653225, 6532, '策勒县');
INSERT INTO `ums_area` VALUES (3476, 653226, 6532, '于田县');
INSERT INTO `ums_area` VALUES (3477, 653227, 6532, '民丰县');
INSERT INTO `ums_area` VALUES (3478, 6540, 65, '伊犁哈萨克自治州');
INSERT INTO `ums_area` VALUES (3479, 654001, 6540, '奎屯市');
INSERT INTO `ums_area` VALUES (3480, 6541, 65, '伊犁地区');
INSERT INTO `ums_area` VALUES (3481, 654101, 6541, '伊宁市');
INSERT INTO `ums_area` VALUES (3482, 654121, 6541, '伊宁县');
INSERT INTO `ums_area` VALUES (3483, 654122, 6541, '察布查尔锡伯自治县');
INSERT INTO `ums_area` VALUES (3484, 654123, 6541, '霍城县');
INSERT INTO `ums_area` VALUES (3485, 654124, 6541, '巩留县');
INSERT INTO `ums_area` VALUES (3486, 654125, 6541, '新源县');
INSERT INTO `ums_area` VALUES (3487, 654126, 6541, '昭苏县');
INSERT INTO `ums_area` VALUES (3488, 654127, 6541, '特克斯县');
INSERT INTO `ums_area` VALUES (3489, 654128, 6541, '尼勒克县');
INSERT INTO `ums_area` VALUES (3490, 6542, 65, '塔城地区');
INSERT INTO `ums_area` VALUES (3491, 654201, 6542, '塔城市');
INSERT INTO `ums_area` VALUES (3492, 654202, 6542, '乌苏市');
INSERT INTO `ums_area` VALUES (3493, 654221, 6542, '额敏县');
INSERT INTO `ums_area` VALUES (3494, 654223, 6542, '沙湾县');
INSERT INTO `ums_area` VALUES (3495, 654224, 6542, '托里县');
INSERT INTO `ums_area` VALUES (3496, 654225, 6542, '裕民县');
INSERT INTO `ums_area` VALUES (3497, 654226, 6542, '和布克赛尔蒙古自治县');
INSERT INTO `ums_area` VALUES (3498, 6543, 65, '阿勒泰地区');
INSERT INTO `ums_area` VALUES (3499, 654301, 6543, '阿勒泰市');
INSERT INTO `ums_area` VALUES (3500, 654321, 6543, '布尔津县');
INSERT INTO `ums_area` VALUES (3501, 654322, 6543, '富蕴县');
INSERT INTO `ums_area` VALUES (3502, 654323, 6543, '福海县');
INSERT INTO `ums_area` VALUES (3503, 654324, 6543, '哈巴河县');
INSERT INTO `ums_area` VALUES (3504, 654325, 6543, '青河县');
INSERT INTO `ums_area` VALUES (3505, 654326, 6543, '吉木乃县');
INSERT INTO `ums_area` VALUES (3506, 6590, 65, '省直辖行政单位');
INSERT INTO `ums_area` VALUES (3507, 659001, 6590, '石河子市');
INSERT INTO `ums_area` VALUES (3508, 71, 0, '台湾');
INSERT INTO `ums_area` VALUES (3509, 7101, 71, '台湾市辖');
INSERT INTO `ums_area` VALUES (3510, 710101, 7101, '请选择');
INSERT INTO `ums_area` VALUES (3511, 710102, 7101, '市辖区');
INSERT INTO `ums_area` VALUES (3512, 710103, 7101, '台湾省');
INSERT INTO `ums_area` VALUES (3513, 81, 0, '香港');
INSERT INTO `ums_area` VALUES (3514, 8101, 81, '香港特区');
INSERT INTO `ums_area` VALUES (3515, 810101, 8101, '请选择');
INSERT INTO `ums_area` VALUES (3516, 810102, 8101, '市辖区');
INSERT INTO `ums_area` VALUES (3517, 810103, 8101, '香港特区');
INSERT INTO `ums_area` VALUES (3518, 91, 0, '澳门');
INSERT INTO `ums_area` VALUES (3519, 9101, 91, '澳门特区');
INSERT INTO `ums_area` VALUES (3520, 910101, 9101, '请选择');
INSERT INTO `ums_area` VALUES (3521, 910102, 9101, '市辖区');
INSERT INTO `ums_area` VALUES (3522, 910103, 9101, '澳门特区');

-- ----------------------------
-- Table structure for ums_follow_product
-- ----------------------------
DROP TABLE IF EXISTS `ums_follow_product`;
CREATE TABLE `ums_follow_product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) NOT NULL COMMENT '用户id',
  `product_id` bigint(10) NOT NULL COMMENT '收藏的商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_follow_product
-- ----------------------------
INSERT INTO `ums_follow_product` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for ums_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `ums_follow_user`;
CREATE TABLE `ums_follow_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) NOT NULL COMMENT '用户id',
  `collect_user_id` bigint(10) NOT NULL COMMENT '收藏的用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_follow_user
-- ----------------------------
INSERT INTO `ums_follow_user` VALUES (1, 2, 2);
INSERT INTO `ums_follow_user` VALUES (2, 2, 3);

-- ----------------------------
-- Table structure for ums_user
-- ----------------------------
DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE `ums_user`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 0-女 1-男 2-保密',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `type` int(2) NULL DEFAULT 0 COMMENT '类型',
  `status` int(2) NULL DEFAULT 0 COMMENT '用户状态',
  `head_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `sell_level` int(1) NULL DEFAULT 1 COMMENT '等级',
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `buy_count` int(5) NULL DEFAULT 0 COMMENT '已购买数量',
  `sell_count` int(5) NULL DEFAULT 0 COMMENT '在售数量',
  `deal_count` int(5) NULL DEFAULT 0 COMMENT '交易数量',
  `last_login` datetime(0) NULL DEFAULT NULL COMMENT '最近登录时间',
  `im_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '融云token',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_user
-- ----------------------------
INSERT INTO `ums_user` VALUES (1, '明明', 'pbkdf2_sha256$36000$e149LrK98G5R$+G00FL0+unmahUmLVCw6cnW1UzScGRPeMkTh1gg4buQ=', 2, '13111111111', NULL, 0, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `ums_user` VALUES (2, '红红', 'pbkdf2_sha256$36000$e149LrK98G5R$+G00FL0+unmahUmLVCw6cnW1UzScGRPeMkTh1gg4buQ=', 0, '13555555555', NULL, 0, NULL, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `ums_user` VALUES (5, 'myl', 'pbkdf2_sha256$36000$e149LrK98G5R$+G00FL0+unmahUmLVCw6cnW1UzScGRPeMkTh1gg4buQ=', 1, '15901533228', NULL, 0, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', '人在塔在', NULL, NULL, 1, NULL, 0, 0, 0, NULL, 'Ti7e39HxO8cQURuULAr+2VkISIyhhVg6TjCkuUzLARfVg1ItERzYQsI4pR3BfeGW/Vl/2DdTMO96bUKKzY6MrA==', NULL, '2020-04-08 12:50:42');
INSERT INTO `ums_user` VALUES (6, 'jiaozi', NULL, NULL, '13370145730', NULL, 0, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, '2020-04-14 10:22:59', 'OCvPjLnPPBQzNVueyNOyDlkISIyhhVg6TjCkuUzLARfVg1ItERzYQj1DvN7xw8NEvRmp0xGTKER6bUKKzY6MrA==', '2020-04-08 19:17:21', '2020-04-08 19:20:09');
INSERT INTO `ums_user` VALUES (7, 'liwei', NULL, NULL, '13888888888', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `ums_user` VALUES (8, 'myl666', NULL, NULL, '18210693027', NULL, 0, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, '2020-04-08 19:21:23', 'WrhFGuFmSIYhvGsiWnAk/8li1iXsh+J/1edH7kGW11XrdnJceH+xGSnvLoX6PO06Cbx1axDbyPgyerAsLHFd/g==', '2020-04-08 19:21:23', '2020-04-08 19:22:18');
INSERT INTO `ums_user` VALUES (9, '打排球的', NULL, NULL, '13520820254', NULL, 0, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, '2020-04-09 16:58:39', NULL, '2020-04-09 16:58:39', '2020-04-09 16:58:39');
INSERT INTO `ums_user` VALUES (10, '用户3227', NULL, NULL, '15901533227', NULL, 0, 0, 'https://myl-1301734031.cos.ap-beijing.myqcloud.com/default-head-pic/moren.png', NULL, NULL, NULL, 1, NULL, 0, 0, 0, '2020-04-13 18:21:09', NULL, '2020-04-13 18:21:09', '2020-04-13 18:21:09');

-- ----------------------------
-- Table structure for ums_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_address`;
CREATE TABLE `ums_user_address`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) NOT NULL COMMENT '用户id',
  `province` int(16) NOT NULL COMMENT '省编码',
  `city` int(16) NOT NULL COMMENT '市编码',
  `country` int(16) NULL DEFAULT NULL COMMENT '区县编码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `default_add` int(1) NOT NULL DEFAULT 0 COMMENT '是否默认 0-否 1-是',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_user_token
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_token`;
CREATE TABLE `ums_user_token`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) NOT NULL COMMENT '用户id',
  `user_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户token',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_user_token
-- ----------------------------
INSERT INTO `ums_user_token` VALUES (3, 5, 'user_token:65ea70b8eff6accae7b0a58677ee4e60', NULL, NULL);
INSERT INTO `ums_user_token` VALUES (5, 8, 'user_token:b036faff9ce2d47929605a49e3245eed', '2020-04-08 19:21:23', '2020-04-08 19:21:23');
INSERT INTO `ums_user_token` VALUES (6, 9, 'user_token:f054abbbc850538e41700e6b89a7a549', '2020-04-09 16:58:39', '2020-04-09 16:58:39');
INSERT INTO `ums_user_token` VALUES (7, 10, 'user_token:4dac9f429aaeaf5b20242a22cccf25bc', '2020-04-13 18:21:09', '2020-04-13 18:21:09');
INSERT INTO `ums_user_token` VALUES (11, 6, 'user_token:3de7bf7dad6d7a8af42bc34802e7f4cb', '2020-04-14 10:22:59', '2020-04-14 10:22:59');

SET FOREIGN_KEY_CHECKS = 1;
