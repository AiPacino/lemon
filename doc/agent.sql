-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-02-01 16:05:56
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agent`
--

-- --------------------------------------------------------

--
-- 表的结构 `agent_apply`
--

CREATE TABLE `agent_apply` (
  `id` int(11) NOT NULL,
  `openid` varchar(1024) CHARACTER SET utf8mb4 NOT NULL COMMENT 'openid',
  `real_name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `iphone` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `wx_token` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wx_token',
  `zhifubao` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付宝帐号',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请理由',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='申请代理表';

--
-- 转存表中的数据 `agent_apply`
--

INSERT INTO `agent_apply` (`id`, `openid`, `real_name`, `iphone`, `wx_token`, `zhifubao`, `reason`, `status`, `createtime`, `updatetime`) VALUES
(1, 'system', '杨**', '18380205203', 'qmqdd666', '1803705718@qq.com', 'goods', 1, 1516271460, NULL),
(2, 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', '12313', '18428360735', 'fas', '123', '132', 0, 1516702613, 1516702613),
(3, 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', '12313', '18428360735', 'fas', '123', '132', 0, 1516702689, 1516702689),
(4, 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', '43', '18428360735', '321', '312', '123123', 1, 1516702832, 1516702832);

-- --------------------------------------------------------

--
-- 表的结构 `agent_classlist`
--

CREATE TABLE `agent_classlist` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `c_name` varchar(1024) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='淘客基地类别目录';

--
-- 转存表中的数据 `agent_classlist`
--

INSERT INTO `agent_classlist` (`id`, `c_id`, `c_name`, `status`, `createtime`, `updatetime`) VALUES
(1, 1, '女装', 1, 1516109244, 1516109244),
(2, 2, '男装', 1, 1516109244, 1516109244),
(3, 3, '内衣', 1, 1516109244, 1516109244),
(4, 4, '母婴', 1, 1516109244, 1516109244),
(5, 5, '美妆', 1, 1516109244, 1516109244),
(6, 6, '居家', 1, 1516109244, 1516109244),
(7, 7, '鞋包配饰', 1, 1516109244, 1516109244),
(8, 8, '美食', 1, 1516109244, 1516109244),
(9, 9, '文体车品', 1, 1516109244, 1516109244),
(10, 10, '数码家电', 1, 1516109244, 1516109244),
(11, 11, '运动户外', 1, 1516109244, 1516109244),
(12, 12, '其他', 1, 1516109244, 1516109244);

-- --------------------------------------------------------

--
-- 表的结构 `agent_click`
--

CREATE TABLE `agent_click` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '代理id',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `date` int(11) NOT NULL COMMENT '日期',
  `dumps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '点击商品',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理点击收集表';

--
-- 转存表中的数据 `agent_click`
--

INSERT INTO `agent_click` (`id`, `user_id`, `count`, `date`, `dumps`, `status`, `createtime`, `updatetime`) VALUES
(1, 1, 37, 1516291201, '[{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"156","type":"0"},{"openid":"system","id":"172","type":"0"},{"openid":"system","id":"174","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"159","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"156","type":"0"},{"openid":"system","id":"161","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"158","type":"0"},{"openid":"system","id":"158","type":"0"},{"openid":"system","id":"435","type":"0"},{"openid":"system","id":"439","type":"0"},{"openid":"system","id":"445","type":"0"}]', 1, 1516373610, 1516373610),
(2, 1, 37, 1516636801, '[{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"undefined","type":"undefined"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"156","type":"0"},{"openid":"system","id":"172","type":"0"},{"openid":"system","id":"174","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"159","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"156","type":"0"},{"openid":"system","id":"161","type":"0"},{"openid":"system","id":"157","type":"0"},{"openid":"system","id":"158","type":"0"},{"openid":"system","id":"158","type":"0"},{"openid":"system","id":"435","type":"0"},{"openid":"system","id":"439","type":"0"},{"openid":"system","id":"445","type":"0"}]', 1, 1516646661, 1516646661),
(3, 4, 3, 1516809601, '[{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"619","type":"0"},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"617","type":"0"},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"617","type":"0"}]', 1, 1516810973, 1516810973),
(4, 4, 5, 1516982401, '[{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"59","type":0},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"-1","type":0},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"-1","type":"556406529310"},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"230","type":"562979471326"},{"openid":"ok6sq5PK4EQnTij_y1H2mDRP4QxI","id":"150","type":"560822515716"}]', 1, 1517034776, 1517034776);

-- --------------------------------------------------------

--
-- 表的结构 `agent_configure`
--

CREATE TABLE `agent_configure` (
  `id` int(11) NOT NULL,
  `tkl_cookie` text COLLATE utf8mb4_unicode_ci COMMENT '淘口令cookie',
  `reserve` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '保留字段',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置表';

--
-- 转存表中的数据 `agent_configure`
--

INSERT INTO `agent_configure` (`id`, `tkl_cookie`, `reserve`, `status`, `createtime`, `updatetime`) VALUES
(1, 'UM_distinctid=160e5d40e18105-02e378280029eb-454c0a2b-1fa400-160e5d40e1da3; CNZZDATA1255591768=1881858639-1515683014-http%253A%252F%252Ftool.chaozhi.hk%252F%7C1516011552; PHPSESSID=pj3doab3vaa3qe2osa13nrdla3; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A%22100%22%2C%22token%22%3A%22700021005390f169b6da0e8f066c779702fd7642a498247e5601d6d71d9a2e9a0eed9cf2032537227%22%7D', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `agent_goods`
--

CREATE TABLE `agent_goods` (
  `id` int(11) NOT NULL,
  `iid` varchar(1024) NOT NULL COMMENT '商品id',
  `type` int(11) NOT NULL COMMENT '(0表示lunbotu，1表示打牌券，2表示9.9，3表示人气榜，4表示聚划算，5表示首页商品，6表示好券精选',
  `name` varchar(1024) NOT NULL COMMENT '商品名称',
  `pic` varchar(1024) NOT NULL COMMENT '商品主图',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `rate` double NOT NULL DEFAULT '0' COMMENT '佣金比率',
  `page` int(11) NOT NULL DEFAULT '1' COMMENT '分页',
  `coupon_price` double NOT NULL DEFAULT '0' COMMENT '券价格',
  `coupon_link` varchar(1024) DEFAULT NULL COMMENT '券地址',
  `is_tmall` int(11) NOT NULL DEFAULT '0' COMMENT '(1表示天猫，0表示淘宝）',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '类别id',
  `cname` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类别名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `edata` text COMMENT 'json数据',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品数据缓';

-- --------------------------------------------------------

--
-- 表的结构 `agent_order`
--

CREATE TABLE `agent_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `iid` varchar(1024) NOT NULL COMMENT '商品id',
  `name` varchar(1024) NOT NULL COMMENT '商品名称',
  `pic` varchar(1024) DEFAULT NULL COMMENT '商品图片',
  `shop` varchar(1024) NOT NULL COMMENT '店铺',
  `pay_money` double NOT NULL DEFAULT '0' COMMENT '付款金额',
  `income` double NOT NULL DEFAULT '0' COMMENT '佣金',
  `order_time` int(11) NOT NULL COMMENT '订单时间',
  `adzone_id` int(11) NOT NULL COMMENT '广告位id',
  `rate` double NOT NULL COMMENT '佣金比率',
  `order_num` varchar(1024) NOT NULL COMMENT '订单号',
  `goods_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `is_tmall` int(11) NOT NULL DEFAULT '0' COMMENT '是否天猫',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

--
-- 转存表中的数据 `agent_order`
--

INSERT INTO `agent_order` (`id`, `user_id`, `iid`, `name`, `pic`, `shop`, `pay_money`, `income`, `order_time`, `adzone_id`, `rate`, `order_num`, `goods_num`, `is_tmall`, `status`, `createtime`, `updatetime`) VALUES
(1, 1, '536016286407', '艺栢氛 电表箱装饰画 配电箱遮挡画壁画 现代简约餐厅挂画', 'https://img.alicdn.com/tfscom/i2/2772580387/TB2Jm2Wdh6I8KJjSszfXXaZVXXa_!!2772580387.jpg', '艺栢氛', 79.67, 1.2, 1515856919, 177878190, 1.5, '114243284116554488', 1, 0, 1, 1516352121, 1516352121),
(2, 1, '556997651266', 'vivox9splus手机壳v0vix9外套步步高x9薄磨砂硬vivox9S男女款x9L', 'https://img.alicdn.com/tfscom/i1/3385954813/TB20.KGatqgF1Jjy1zdXXc8dFXa_!!3385954813.jpg', '摩斯维品牌企业店', 22, 9.2, 1515845724, 177878190, 44, '107401646481592459', 1, 0, 1, 1516352121, 1516352121),
(3, 1, '524356526074', '百雀羚小雀幸补水保湿面膜贴睡眠收缩毛孔官方旗舰店官网专柜正品', 'https://img.alicdn.com/tfscom/i3/2051583450/TB1vgz7ndzJ8KJjSspkXXbF7VXa_!!0-item_pic.jpg', '百雀羚尚之美专卖店', 59, 12.39, 1515825483, 177878190, 21, '114042189522605594', 1, 1, 1, 1516352121, 1516352121),
(4, 1, '45729459021', '抱枕表情包笑脸毛绒玩具暖手捂布娃娃公仔韩国搞怪抱枕生日礼物女', 'https://img.alicdn.com/tfscom/i3/409278028/TB2ju5hswxlpuFjSszgXXcJdpXa_!!409278028.jpg', '万宝乐玩具大世界', 97, 13.86, 1515823449, 177878190, 15, '114080914177532772', 10, 0, 1, 1516352121, 1516352121),
(5, 1, '521149222907', '凡士林身体乳 特润修护保湿润肤露清香型滋润易吸收粗糙', 'https://img.alicdn.com/tfscom/i1/2594916711/TB1qWKWeYsTMeJjSszgXXacpFXa_!!0-item_pic.jpg', 'vaseline凡士林官方旗舰店', 20, 0.8, 1515804907, 177878190, 4, '121455262466996914', 1, 1, 1, 1516352121, 1516352121),
(6, 1, '557194773453', '文艺简约小清新复古贩卖梦境笔记本记事本手账本日记本手帐本子', 'https://img.alicdn.com/tfscom/i3/296669595/TB2vs7IcQfb_uJkHFJHXXb4vFXa_!!296669595.jpg', '娜小屋文具店', 17.86, 0.89, 1515802374, 177878190, 5, '121450194458996914', 1, 0, 1, 1516352121, 1516352121),
(7, 1, '523016033340', '挂历2018年福字吊牌创意狗年月历家用黄历择吉皇历定制广告本日历', 'https://img.alicdn.com/tfscom/i2/1761691598/TB1G2q2dkfb_uJkHFJHXXb4vFXa_!!0-item_pic.jpg', '浚瑄办公专营店', 12, 2.44, 1515731895, 177878190, 20.3, '106822212938657337', 1, 1, 1, 1516352121, 1516352121),
(8, 1, '555677720689', '荣仕健康鞋春秋透气防滑中老年运动健步鞋男鞋爸爸鞋老人户外旅游', 'https://img.alicdn.com/tfscom/i4/2769730961/TB2l3TKb8DH8KJjSspnXXbNAVXa_!!2769730961.jpg', '荣仕企业店', 188, 15.04, 1515718494, 177878190, 8, '113552917770327371', 1, 0, 1, 1516352121, 1516352121),
(9, 1, '558496492524', '秋冬新款裤子男韩版潮流休闲裤男哈伦裤修身九分裤小脚裤长裤', 'https://img.alicdn.com/tfscom/i1/1782714901/TB1VxnVjx6I8KJjy0FgXXXXzVXa_!!0-item_pic.jpg', '欧萨威帝旗舰店', 29.9, 1.65, 1516710185, 177878190, 5.5, '111105345039787458', 1, 1, 1, 1516955656, 1516955656),
(10, 1, '556836531524', '听雨轩可擦笔中性笔芯学生可擦笔芯0.50./38/0.35黑色晶蓝替笔芯', 'https://img.alicdn.com/tfscom/i4/3354524348/TB1ITrySFXXXXa1XVXXXXXXXXXX_!!0-item_pic.jpg', '吊中吊办公用品专营店', 12.8, 2.6, 1516455672, 177878190, 20.3, '116897238492406770', 1, 1, 1, 1516955884, 1516955884),
(11, 1, '536180423644', '卡姿兰眉笔非眉粉不易晕染不易脱色初学者带眉刷一字眉', 'https://img.alicdn.com/tfscom/i3/755579902/TB1vzvvonnI8KJjy0FfXXcdoVXa_!!0-item_pic.jpg', '卡姿兰官方旗舰店', 24, 2.16, 1516411035, 177878190, 9, '109850863076194561', 1, 1, 1, 1516955884, 1516955884),
(12, 1, '562740813883', 'TTMIX狗狗吊坠本命年狗年生肖饰品个性锁骨链项链女925银生日礼物', 'https://img.alicdn.com/tfscom/i3/744002152/TB1W4BWogvD8KJjy0FlXXagBFXa_!!0-item_pic.jpg', 'ttmix旗舰店', 79, 2.77, 1516346847, 177878190, 3.5, '109591946449194561', 1, 0, 1, 1516955884, 1516955884),
(13, 1, '20883795692', '【西域美农特级红枣500g】新疆特产和田大枣骏枣可夹核桃仁吃袋装', 'https://img.alicdn.com/tfscom/i2/736093685/TB1sYOgonnI8KJjSszbXXb4KFXa_!!0-item_pic.jpg', '西域美农旗舰店', 18.99, 3.89, 1516322714, 177878190, 20.5, '109430162005194561', 1, 1, 1, 1516955884, 1516955884),
(14, 1, '538020012058', 'DIY照片抱枕定制微微一笑很倾城明星周边创意靠垫定做女生日礼物', 'https://img.alicdn.com/tfscom/i4/56901433/TB2WIaGXjvlJKJjSspnXXblTVXa_!!56901433.jpg', '钰洲家纺', 15, 3, 1515665688, 177878190, 20, '106637358988313551', 1, 0, 1, 1516958010, 1516958010),
(15, 1, '555083368538', '四川泡菜坛子玻璃加厚腌菜缸家用透明密封罐腌制蛋酸菜咸菜泡菜罐', 'https://img.alicdn.com/tfscom/i1/3064518804/TB1kz2vofDH8KJjy1XcXXcpdXXa_!!0-item_pic.jpg', '新顾仕旗舰店', 32.9, 10.03, 1515656544, 177878190, 30.5, '113397266881245170', 1, 1, 1, 1516958010, 1516958010),
(16, 1, '563089485239', '防撞条加厚加宽儿童防护条宝宝桌角防碰撞婴儿安全桌子桌边保护条', 'https://img.alicdn.com/tfscom/i2/2273862146/TB2VoMOoh6I8KJjSszfXXaZVXXa_!!2273862146.jpg', '依一母婴用品店', 120.60000000000001, 36.18, 1515584751, 177878190, 30, '106249921554657337', 12, 0, 1, 1516958010, 1516958010),
(17, 1, '523391538160', '2双 羊毛保暖鞋垫 男女吸汗透气加厚减震加绒毛绒冬季运动棉鞋垫', 'https://img.alicdn.com/tfscom/i1/2455489390/TB1qd9Hj8HH8KJjy0FbXXcqlpXa_!!0-item_pic.jpg', 'footmaster足大师旗舰店', 13.8, 4.2, 1515557778, 177878190, 32, '120734822555671515', 1, 1, 1, 1516958010, 1516958010),
(18, 1, '563558115010', '冬季新款女装羽绒棉服韩版棉衣女中长款修身大毛领棉袄加厚外套潮', 'https://img.alicdn.com/tfscom/i1/2832353909/TB2lMwNkx6I8KJjy0FgXXXXzVXa_!!2832353909.jpg', '祥钰时尚衣柜女装', 169, 33.8, 1515554934, 177878190, 20, '120555649331590924', 1, 0, 1, 1516958010, 1516958010),
(19, 1, '561851119974', '图特手套女冬加绒保暖毛线针织加厚学生户外骑车韩版触屏针织手套', 'https://img.alicdn.com/tfscom/i4/1907772394/TB2vgd5ecnI8KJjSspeXXcwIpXa_!!1907772394.jpg', '哈特企业店', 9.9, 2.97, 1515553571, 177878190, 30, '120547865823590924', 1, 0, 1, 1516958010, 1516958010),
(20, 1, '553403728737', 'DIY抱枕定制抱枕被子两用来图定做照片汽车午睡床头沙发靠垫礼物', 'https://img.alicdn.com/tfscom/i4/2949001296/TB2lzLWa.4WMKJjSspmXXcznpXa_!!2949001296.jpg', '美意梦家纺', 29.9, 8.55, 1515509787, 177878190, 30.1, '105985910668313551', 1, 0, 1, 1516958010, 1516958010),
(21, 1, '562215183774', 'MMH多肉植物小老桩组合新手套餐多肉组合绿植盆栽花卉含盆包邮', 'https://img.alicdn.com/tfscom/i2/2916035677/TB1eAQYftbJ8KJjy1zjXXaqapXa_!!0-item_pic.jpg', 'mumuhome园艺旗舰店', 30.1, 9.18, 1515508960, 177878190, 30.5, '105949760943657337', 1, 0, 1, 1516958010, 1516958010),
(22, 1, '545508229793', 'DIY简约唯美专属首字母名字体定制抱枕个性创意沙发靠垫定做礼品', 'https://img.alicdn.com/tfscom/i1/56901433/TB2oXIHf0RopuFjSZFtXXcanpXa_!!56901433.jpg', '钰洲家纺', 15, 3.45, 1515508442, 177878190, 23, '105977622774313551', 1, 0, 1, 1516958010, 1516958010),
(23, 1, '41718004458', '2018年狗年台历定制定做个性DIY照片日历公司企业年历商务台历', 'https://img.alicdn.com/tfscom/i2/TB1H0hrOXXXXXajXpXXXXXXXXXX_!!0-item_pic.jpg', '自个乐旗舰店', 14.8, 4.51, 1515507832, 177878190, 30.5, '105935705568657337', 1, 1, 1, 1516958010, 1516958010),
(24, 1, '561912255687', '每日坚果混合坚果30包成人款组合装儿童款零食大礼包网红年货食品', 'https://img.alicdn.com/tfscom/i1/2216927306/TB1_PKJiBDH8KJjSszcXXbDTFXa_!!0-item_pic.jpg', '珍妞食品专营店', 85, 1.71, 1515503318, 177878190, 2, '112728933570143079', 1, 1, 1, 1516958010, 1516958010),
(25, 1, '561912255687', '每日坚果混合坚果30包成人款组合装儿童款零食大礼包网红年货食品', 'https://img.alicdn.com/tfscom/i1/2216927306/TB1_PKJiBDH8KJjSszcXXbDTFXa_!!0-item_pic.jpg', '珍妞食品专营店', 85, 1.71, 1515503232, 177878190, 2, '112768778299143079', 1, 1, 1, 1516958010, 1516958010),
(26, 1, '547702583589', '飞科除毛球修剪器充电式去剪家用毛衣服衣物刮吸毛球器剃打脱毛机', 'https://img.alicdn.com/tfscom/i4/2106517863/TB1LyZ8ctLO8KJjSZFxXXaGEVXa_!!0-item_pic.jpg', '琅铂旺电器专营店', 39, 2.07, 1515418913, 177878190, 5.3, '120188988138430229', 1, 1, 1, 1516958010, 1516958010),
(27, 1, '560259851936', 'vivoy67手机壳vivoxy67女 防摔步步高磨砂浮雕vivoy66 vivoy67a', 'https://img.alicdn.com/tfscom/i4/3373709334/TB1IfHfisnI8KJjSsziXXb8QpXa_!!0-item_pic.jpg', '易日达数码专营店', 9.8, 0.52, 1515418040, 177878190, 5.3, '112336177384194561', 1, 1, 1, 1516958010, 1516958010),
(28, 1, '561672765073', '羽绒服女中长款2017新款韩版潮修身加厚过膝韩国女士欧洲站冬装', 'https://img.alicdn.com/tfscom/i1/3029542506/TB1PQLXasic_eJjSZFnXXXVwVXa_!!2-item_pic.png', 'adllmas旗舰店', 173, 35.47, 1515326479, 177878190, 20.5, '111881737809245170', 1, 1, 1, 1516958010, 1516958010),
(29, 1, '541771423776', '膜法世家水光VC素颜霜补水保湿裸妆遮瑕懒人面霜学生魔法世家正品', 'https://img.alicdn.com/tfscom/i2/2687784399/TB1VDFklnTI8KJjSsphXXcFppXa_!!0-item_pic.jpg', '膜法世家1908仨人兴专卖店', 50, 10.5, 1515326136, 177878190, 21, '111891032174245170', 1, 1, 1, 1516958010, 1516958010),
(30, 1, '545442271596', '膜法世家补水面膜酵素面膜贴吸黑补水保湿魔法世家面膜官方旗舰店', 'https://img.alicdn.com/tfscom/i1/684378304/TB1wek0n3LD8KJjSszeXXaGRpXa_!!0-item_pic.jpg', '膜法世家1908日照店', 79.9, 16.78, 1515326109, 177878190, 21, '111816443736245170', 1, 1, 1, 1516958010, 1516958010),
(31, 1, '562803175084', '送运费险冬季男士保暖修身连帽中长款棉衣外套青年棉服小林1707-2', 'https://img.alicdn.com/tfscom/i4/1970852602/TB1iUSch8TH8KJjy0FiXXcRsXXa_!!0-item_pic.jpg', '马迪利旗舰店', 188, 38.54, 1515298302, 177878190, 20.5, '111730566102245170', 1, 1, 1, 1516958010, 1516958010),
(32, 1, '556533077468', '浪莎保暖内衣加绒加厚男士女士冬季圆领秋衣秋裤大码棉毛衫套装', 'https://img.alicdn.com/tfscom/i4/1702687803/TB1CB1Ma5qAXuNjy1XdXXaYcVXa_!!0-item_pic.jpg', '浪莎八零后专卖店', 79, 16.2, 1515297843, 177878190, 20.5, '111726534254245170', 1, 1, 1, 1516958010, 1516958010),
(33, 1, '558465443532', '门后挂钩挂衣架不锈钢衣服挂钩壁挂挂钩创意卫生间浴室免打孔挂钩', 'https://img.alicdn.com/tfscom/i2/2342088027/TB1DSaee7.HL1JjSZFlXXaiRFXa_!!0-item_pic.jpg', '阿堂优品', 19.9, 5.97, 1515247842, 177878190, 30, '119676758726430229', 1, 0, 1, 1516958011, 1516958011),
(34, 1, '557146479250', '康瑞欣纯棉毛巾成人家用柔软吸水纯色棉面巾全棉洗脸巾纯色四条装', 'https://img.alicdn.com/tfscom/i4/3364517000/TB1U.W5ntrJ8KJjSspaXXXuKpXa_!!0-item_pic.jpg', '康瑞欣旗舰店', 19.9, 4.08, 1515233310, 177878190, 20.5, '119497556164137109', 1, 1, 1, 1516958011, 1516958011),
(35, 1, '545151151012', '采琪采无香竹纤维本色抽纸巾家用面巾纸餐巾纸300张*18包家庭装', 'https://img.alicdn.com/tfscom/i1/2260919384/TB160d.nwDD8KJjy0FdXXcjvXXa_!!0-item_pic.jpg', 'cchoice采琪采旗舰店', 24.9, 5.1, 1515232900, 177878190, 20.5, '119494980975137109', 1, 1, 1, 1516958011, 1516958011),
(36, 1, '558338871199', '雅诚德砂锅炖锅家用煲汤陶瓷明火耐高温汤煲大沙锅炖汤砂锅煲燃气', 'https://img.alicdn.com/tfscom/i1/2456018243/TB1UkECntrJ8KJjSspaXXXuKpXa_!!0-item_pic.jpg', '雅诚德广州专卖店', 99, 30.2, 1515227287, 177878190, 30.5, '111457706076245170', 1, 1, 1, 1516958011, 1516958011),
(37, 1, '558338871199', '雅诚德砂锅炖锅家用煲汤陶瓷明火耐高温汤煲大沙锅炖汤砂锅煲燃气', 'https://img.alicdn.com/tfscom/i1/2456018243/TB1UkECntrJ8KJjSspaXXXuKpXa_!!0-item_pic.jpg', '雅诚德广州专卖店', 99, 30.2, 1515224507, 177878190, 30.5, '104910933257565242', 1, 1, 1, 1516958011, 1516958011),
(38, 1, '537554336551', '俞兆林秋衣秋裤套装男士V领纯棉薄款青年修身棉毛衫保暖内衣套装', 'https://img.alicdn.com/tfscom/i1/2089289571/TB13kI3hJzJ8KJjSspkXXbF7VXa_!!0-item_pic.jpg', '俞兆林宝鼎专卖店', 39.8, 8.16, 1515163053, 177878190, 20.5, '119273640590671515', 1, 1, 1, 1516958011, 1516958011),
(39, 1, '524808564423', '恒源祥妈妈中老年人加厚羊毛衫女装半高领短款打底针织衫毛衣女冬', 'https://img.alicdn.com/tfscom/i1/2096023921/TB15ebAekfb_uJkSnb4XXXCrXXa_!!0-item_pic.jpg', '健羽服饰专营店', 148, 45.88, 1515161762, 177878190, 31, '119266528657671515', 1, 1, 1, 1516958011, 1516958011),
(40, 1, '561937710777', '2018春季新款金丝绒百褶裙韩版风琴褶高腰秋冬百搭中长款半身裙子', 'https://img.alicdn.com/tfscom/i4/2215230149/TB1sWfKeInI8KJjSspeXXcwIpXa_!!0-item_pic.jpg', '沂公主旗舰店', 39, 11.9, 1515141984, 177878190, 30.5, '111041960956462080', 1, 1, 1, 1516958011, 1516958011),
(41, 1, '540210371620', '森尔雅2017冬季新款羽绒服女中长款可爱少女装学生冬装外套连帽潮', 'https://img.alicdn.com/tfscom/i2/1023136999/TB1kpkalnnI8KJjSszgXXc8ApXa_!!0-item_pic.jpg', '森尔雅旗舰店', 138, 42.09, 1514983992, 177878190, 30.5, '110356942357245170', 1, 1, 1, 1516958011, 1516958011),
(42, 1, '552693058152', '袜子男士长短袜中筒秋冬款防臭吸汗黑纯棉袜冬季男袜批发加厚船袜', 'https://img.alicdn.com/tfscom/i4/710895077/TB1W0UYlvxNTKJjy0FjXXX6yVXa_!!0-item_pic.jpg', '阿诗玛旗舰店', 19.9, 4.08, 1514941117, 177878190, 20.5, '110007361704247397', 1, 1, 1, 1516958011, 1516958011),
(43, 1, '554416608819', '卡帝乐鳄鱼钱包男士正品真皮横款超薄头层牛皮短款潮钱夹男包皮夹', 'https://img.alicdn.com/tfscom/i3/3211040595/TB1avR0n4rI8KJjy0FpXXb5hVXa_!!0-item_pic.jpg', '卡帝乐鳄鱼莱昂专卖店', 19.9, 6.07, 1514940841, 177878190, 30.5, '110019148197247397', 1, 1, 1, 1516958011, 1516958011),
(44, 1, '562638287749', 'oppoa79手机壳oppoa79a保护套硅胶A33防摔A53软壳女款A57红壳', 'https://img.alicdn.com/tfscom/i1/3373709334/TB1jV7hcvjM8KJjSZFyXXXdzVXa_!!0-item_pic.jpg', '易日达数码专营店', 9.8, 1.99, 1514884784, 177878190, 20.3, '109806740748194561', 1, 1, 1, 1516958011, 1516958011),
(45, 1, '560135296385', '【焕新价】绿林内六角扳手套装内六方梅花六角螺丝刀六花楞六棱扳手工具组套', 'https://img.alicdn.com/tfscom/i2/2408239898/TB14EISnDnI8KJjSszgXXc8ApXa_!!0-item_pic.jpg', 'greener绿林旗舰店', 12.7, 5.14, 1514865511, 177878190, 40.5, '109579327040254586', 1, 1, 1, 1516958011, 1516958011),
(46, 4, '556978207023', '【年货价】little tikes美国小泰克车溜娃神器儿童三轮车遛娃神器宝宝脚踏车', 'https://img.alicdn.com/tfscom/i3/3383437526/TB1LVtHov2H8KJjy1zkXXXr7pXa_!!0-item_pic.jpg', 'littletikes小泰克旗舰店', 312.76, 6.25, 1516859279, 174188835, 2, '112134767609711543', 1, 1, 1, 1516958829, 1516958829),
(47, 4, '37482825568', '【年货价】贝恩施儿童女童过家家厨房玩具小女孩做饭宝宝仿真厨具套装3-6岁', 'https://img.alicdn.com/tfscom/i2/1701224431/TB1AglOonvI8KJjSspjXXcgjXXa_!!0-item_pic.jpg', '金万豪玩具专营店', 47.04, 3.34, 1516859279, 174188835, 7.1, '112134767610711543', 1, 0, 1, 1516958829, 1516958829),
(48, 4, '42899498940', '【年货价】陶煲王砂锅炖锅家用燃气陶瓷煲汤锅小沙锅汤锅明火耐高温瓦罐汤煲', 'https://img.alicdn.com/tfscom/i1/1132474133/TB12tJnodrJ8KJjSspaXXXuKpXa_!!0-item_pic.jpg', '陶煲王旗舰店', 46.17, 6.23, 1516859279, 174188835, 13.5, '112134767611711543', 1, 1, 1, 1516958829, 1516958829),
(49, 4, '527752001036', '安踏运动裤男长裤2017秋季新款休闲舒适棉跑步裤修身显瘦卫裤长裤', 'https://img.alicdn.com/tfscom/i3/1946762568/TB1a67Pejgy_uJjSZLeXXaPlFXa_!!0-item_pic.jpg', 'anta安踏安驰专卖店', 104, 2.6, 1516814341, 174188835, 2.5, '118663421399532772', 1, 0, 1, 1516958829, 1516958829),
(50, 4, '562559794906', '华为荣耀v10手机壳v9保护套薄创意磨砂男女款paly荣耀9硬壳防摔九', 'https://img.alicdn.com/tfscom/i3/2228661100/TB1NAcZd7fb_uJkHFNRXXc3vpXa_!!0-item_pic.jpg', '佳贝数码专营店', 25, 0.33, 1516608335, 174188835, 1.3, '123837248787996914', 1, 1, 1, 1516958829, 1516958829),
(51, 4, '527092570204', '奥义瑜伽垫加长加宽加厚瑜珈垫子初学者男女防滑运动健身垫三件套', 'https://img.alicdn.com/tfscom/i1/2783478757/TB1v5LScjb.heNjSZFAXXchKXXa_!!0-item_pic.jpg', '奥义健与美专卖店', 32.9, 6.74, 1516529300, 174188835, 20.5, '123568309685284207', 1, 1, 1, 1516958829, 1516958829),
(52, 4, '549797219254', '第一卫 正品iPhone6电池6s苹果5s六6plus手机5大容量sp电板5c换7p', 'https://img.alicdn.com/tfscom/i1/2455420587/TB1pOIdaZic_eJjSZFnXXXVwVXa_!!0-item_pic.jpg', '第一卫旗舰店', 124, 19.2, 1516522397, 174188835, 16.3, '117109140170809795', 1, 1, 1, 1516958829, 1516958829),
(53, 4, '550617499033', '钟情原生本色抽纸不漂白卫生纸手纸厕纸母婴用餐巾纸3层18包', 'https://img.alicdn.com/tfscom/i1/3190745395/TB1y8bqmsnI8KJjSspeXXcwIpXa_!!0-item_pic.jpg', '钟情家居旗舰店', 29.9, 9.12, 1516436930, 174188835, 30.5, '123561143355284207', 1, 1, 1, 1516958829, 1516958829),
(54, 4, '538523747234', '褚小姐梳子卷发梳木梳猪鬃毛内扣圆滚梳卷梳直发美发防静电造型梳', 'https://img.alicdn.com/tfscom/i4/2378374678/TB1QI8fezgy_uJjSZSyXXbqvVXa_!!2-item_pic.png', '褚小姐旗舰店', 12.8, 0.7, 1516426223, 174188835, 5.5, '123285424724996914', 1, 1, 1, 1516958829, 1516958829),
(55, 4, '543319752776', '冬季卡通珊瑚绒睡衣女冬加厚加绒甜美可爱韩版袄可外穿家居服套装', 'https://img.alicdn.com/tfscom/i3/2961270289/TB1lDNWgY3XS1JjSZFFXXcvupXa_!!0-item_pic.jpg', '茉婷旗舰店', 118, 34.31, 1516376612, 174188835, 30.61, '116561994149135484', 1, 1, 1, 1516958829, 1516958829),
(56, 4, '560610094487', '金丝绒萝卜裤加厚加绒哈伦裤子女冬季2017新款韩版学生休闲裤秋冬', 'https://img.alicdn.com/tfscom/i4/1706960088/TB1c7NfiRDH8KJjSszcXXbDTFXa_!!0-item_pic.jpg', 'baabibaaby旗舰店', 75.9, 4.18, 1516374555, 174188835, 5.5, '123268346339996914', 1, 1, 1, 1516958829, 1516958829),
(57, 4, '557007080075', '千鸟格子外套女2017新款秋冬韩版毛呢外套中长款学生加厚原宿大衣', 'https://img.alicdn.com/tfscom/i1/803368268/TB1sNEsnTnI8KJjy0FfXXcdoVXa_!!0-item_pic.jpg', '衣品天成女装旗舰店', 239.9, 13.2, 1516373871, 174188835, 5.5, '123165108309996914', 1, 0, 1, 1516958829, 1516958829),
(58, 4, '526472337134', '安踏男裤 2017新款针织直筒长裤运动裤 冬季加绒加厚小脚收口裤子', 'https://img.alicdn.com/tfscom/i1/2336221782/TB15Mdiezgy_uJjSZR0XXaK5pXa_!!0-item_pic.jpg', 'anta安踏北京专卖店', 129, 2.59, 1516366911, 174188835, 2, '116496978268532772', 1, 1, 1, 1516958829, 1516958829),
(59, 4, '562111328745', '绘柔品质 悦享法式浪漫 圣诞主题心形口 红正品专柜同步销售', 'https://img.alicdn.com/tfscom/i4/3367335553/TB1xLNigm_I8KJjy0FoXXaFnVXa_!!0-item_pic.jpg', '绘柔旗舰店', 19.9, 0.7, 1516334316, 174188835, 3.5, '122988736017284207', 1, 1, 1, 1516958829, 1516958829),
(60, 4, '562111328745', '绘柔品质 悦享法式浪漫 圣诞主题心形口 红正品专柜同步销售', 'https://img.alicdn.com/tfscom/i4/3367335553/TB1xLNigm_I8KJjy0FoXXaFnVXa_!!0-item_pic.jpg', '绘柔旗舰店', 19.9, 0.7, 1516334214, 174188835, 3.5, '122988064156284207', 1, 1, 1, 1516958829, 1516958829),
(61, 4, '541935814457', '奥利弗安卓数据线高速三星vivo小米华为通用加长1.5米手机充电线', 'https://img.alicdn.com/tfscom/i4/TB1Toh6SFXXXXbVXXXXXXXXXXXX_!!0-item_pic.jpg', '奥利弗旗舰店', 8.9, 3.15, 1516276150, 174188835, 35.3, '109295342977232059', 1, 1, 1, 1516958829, 1516958829),
(62, 4, '15806918356', '麦红不锈钢晾衣架落地折叠双杆式晾衣杆阳台室内挂被子伸缩晒衣架', 'https://img.alicdn.com/tfscom/i4/685006360/TB1K2uEdm_I8KJjy0FoXXaFnVXa_!!0-item_pic.jpg', '麦红家居专营店', 57, 3.43, 1516105463, 174188835, 6, '115311430597782086', 1, 1, 1, 1516958830, 1516958830),
(63, 4, '563449914594', 'MC新品弹力哈伦裤男士牛仔裤宽松大码小脚裤青少年日系学生裤子男', 'https://img.alicdn.com/tfscom/i1/2023416346/TB14VKAc6gy_uJjSZJnXXbuOXXa_!!0-item_pic.jpg', '曼古卡丹旗舰店', 78, 19.64, 1516087075, 174188835, 26.5, '122450859139318605', 1, 1, 1, 1516958830, 1516958830),
(64, 4, '563892567028', '2017秋冬季新款复古蝴蝶结蕾丝拼接修身中长款长袖收腰连衣裙女装', 'https://img.alicdn.com/tfscom/i4/1669775682/TB2bfyvlTnI8KJjSszbXXb4KFXa_!!1669775682.jpg', '小菲家新款每日更新', 51.8, 3.11, 1516080233, 174188835, 6, '115067299282135484', 1, 0, 1, 1516958830, 1516958830),
(65, 4, '42037842967', '彩虹电热毯单人学生安全宿舍床调温防水加厚家用电褥子官方旗舰店', NULL, 'rainbow彩虹旗舰店', 86, 1.55, 1516020430, 174188835, 1.8, '122265863275996914', 1, 1, 1, 1516958830, 1516958830),
(66, 4, '556013326914', '时克牙膏去口臭美白口气清新去黄牙渍烟渍牙结石日本进口含氟牙膏', 'https://img.alicdn.com/tfscom/i1/3364726971/TB1OHDOoDnI8KJjSszbXXb4KFXa_!!0-item_pic.jpg', 'sayclo时克旗舰店', 26.9, 8.2, 1516016307, 174188835, 30.5, '122133170098284207', 1, 1, 1, 1516958830, 1516958830),
(67, 4, '563413947334', '17春季男款黑色休闲裤夜店酒吧演出小脚紧身裤非主流柳钉潮男裤子', 'https://img.alicdn.com/tfscom/i1/2075644482/TB2Sd9xhVXXXXXlXpXXXXXXXXXX_!!2075644482.jpg', '2017精品潮流男装', 58, 2.9, 1516010074, 174188835, 5, '108034921248592459', 1, 0, 1, 1516958830, 1516958830),
(68, 4, '7836718573', '地垫门垫进门欧式吸水防滑入户门脚垫卧室客厅大门口进门地毯定制', 'https://img.alicdn.com/tfscom/i2/519579574/TB1BFkbodrJ8KJjSspaXXXuKpXa_!!2-item_pic.png', '湛蓝家居专营店', 70, 14.36, 1515935708, 174188835, 21.6, '114492067166048582', 1, 1, 1, 1516958830, 1516958830),
(69, 4, '7836718573', '地垫门垫进门欧式吸水防滑入户门脚垫卧室客厅大门口进门地毯定制', 'https://img.alicdn.com/tfscom/i2/519579574/TB1BFkbodrJ8KJjSspaXXXuKpXa_!!2-item_pic.png', '湛蓝家居专营店', 23, 4.72, 1515929955, 174188835, 21.6, '121980151456876006', 1, 1, 1, 1516958830, 1516958830),
(70, 4, '562924287852', '羽绒服女中长款过膝2017冬装韩版彩色超大毛领时尚收腰加厚外套潮', 'https://img.alicdn.com/tfscom/i7/TB1yblLiDnI8KJjy0FfYXIdoVXa_M2.SS2', 'MX Studio 高端定制', 345.94, 24.22, 1515648398, 174188835, 7, '121117415225284207', 1, 0, 1, 1516958830, 1516958830),
(71, 4, '561758375582', '诗云仙黛可爱加厚保暖法莱绒水晶绒床单床笠纯棉被套床上三四件套', 'https://img.alicdn.com/tfscom/i5/TB1PDfKajgy_uJjSZLeYXGPlFXa_M2.SS2', '诗云仙黛家居旗舰店', 188, 36.97, 1515640759, 174188835, 20.7, '106438165845232059', 1, 1, 1, 1516958830, 1516958830),
(72, 4, '536595294363', '乐扣乐扣米桶10KG家用防虫防潮密封米缸装米桶储米箱20斤', 'https://img.alicdn.com/tfscom/i3/2730574894/TB1hHdWoDnI8KJjSszbXXb4KFXa_!!0-item_pic.jpg', '乐扣乐扣厨具旗舰店', 76.9, 15.76, 1515583523, 174188835, 20.5, '106241828366132837', 1, 1, 1, 1516958830, 1516958830),
(73, 4, '561988411797', '【冰雪燃冬价】南极人电热毯双人双控调温单人电褥子学生宿舍定时安全家用无辐射', 'https://img.alicdn.com/tfscom/i3/2917554413/TB1Rme3g3fH8KJjy1zcXXcTzpXa_!!0-item_pic.jpg', '南极人骁时代专卖店', 168, 3.02, 1515569712, 174188835, 1.8, '112914015535598968', 1, 1, 1, 1516958830, 1516958830),
(74, 4, '557599370153', '【冰雪燃冬价】长虹电暖器电热油汀电暖气片节能省电静音油丁 取暖器家用电暖风', 'https://img.alicdn.com/tfscom/i3/2938556915/TB1yj8YlfDH8KJjy1XcXXcpdXXa_!!0-item_pic.jpg', '长虹跟斗云专卖店', 229, 23.59, 1515566503, 174188835, 10.3, '112894415086598968', 1, 1, 1, 1516958830, 1516958830),
(75, 4, '546044607030', 'x展架 60 160架子80X180结婚海报支架广告宣传易拉宝制作展示架', 'https://img.alicdn.com/tfscom/i3/1583526689/TB2iXJTbjgy_uJjSZKzXXb_jXXa_!!1583526689.jpg', '大德数码展示', 27, 1.35, 1515561744, 174188835, 5, '112934648196532772', 3, 0, 1, 1516958830, 1516958830),
(76, 4, '538778398513', '奥林格 ZX-200B6电热水壶家用自动断电快壶保温电壶电热烧水宿舍', 'https://img.alicdn.com/tfscom/i2/2995349161/TB1ZtfZmRDH8KJjSspnXXbNAVXa_!!0-item_pic.jpg', '奥林格厨房电器旗舰店', 32.9, 5.04, 1515504806, 174188835, 15.3, '120452833855996914', 1, 1, 1, 1516958830, 1516958830),
(77, 4, '20615695295', '美的电磁炉Midea/美的 WK2102电磁炉家用火锅电池炉智能特价正品', 'https://img.alicdn.com/tfscom/i1/1688704882/TB1H518eAfb_uJkSmLyXXcxoXXa_!!0-item_pic.jpg', '美的天天购专卖店', 168, 3.02, 1515503679, 174188835, 1.8, '120611790562996914', 1, 0, 1, 1516958830, 1516958830),
(78, 4, '563543802801', '2018早春新款复古港味气质深V领丝绒吊带连衣裙网纱打底衫两套装', NULL, 'yy潮流精品女装 3金冠', 47.98, 3.36, 1515490499, 174188835, 7, '112649693855135484', 1, 0, 1, 1516958830, 1516958830),
(79, 4, '42420999650', '围裙韩版时尚厨房防水防油长袖反穿做饭工作带袖围腰男罩衣成人女', 'https://img.alicdn.com/tfscom/i1/267485546/TB2iNHQgNHI8KJjy1zbXXaxdpXa_!!267485546.jpg', '清清玉露 百货商城', 7.8, 0.9, 1515385798, 174188835, 12.2, '105506019211132837', 1, 0, 1, 1516958830, 1516958830),
(80, 4, '538412374615', '成人衣橱简约现代经济型组装衣柜收纳柜塑料布艺简易衣柜钢架单人', 'https://img.alicdn.com/tfscom/i2/TB15RI6NXXXXXbxapXXXXXXXXXX_!!0-item_pic.jpg', '乐莉旗舰店', 55, 11.28, 1515368694, 174188835, 20.5, '120135623670996914', 1, 1, 1, 1516958830, 1516958830),
(81, 4, '16733914490', '天竹切菜板家用实木砧板厨房大号案板擀面板不粘板迷你小占板刀板', 'https://img.alicdn.com/tfscom/i4/678519505/TB1qMgjcxHI8KJjy1zbXXaxdpXa_!!0-item_pic.jpg', '天竹旗舰店', 9.9, 1.83, 1515367446, 174188835, 18.5, '119875865056996914', 1, 1, 1, 1516958830, 1516958830),
(82, 4, '40849662542', '浴室置物架卫生间脸盆洗手间角厕所塑料储物收纳洗脸三角落地架子', 'https://img.alicdn.com/tfscom/i2/2068437008/TB1rMOnmP3z9KJjy0FmXXXiwXXa_!!0-item_pic.jpg', '雨露居家日用专营店', 14.9, 1.56, 1515366935, 174188835, 10.5, '120133663096996914', 1, 1, 1, 1516958830, 1516958830),
(83, 4, '44786544363', '沃之沃 大号塑料带盖厨房置物架透明角架碗架整理碗柜碗碟沥水架', 'https://img.alicdn.com/tfscom/i3/2396525506/TB1Bqv8nDTI8KJjSsphXXcFppXa_!!0-item_pic.jpg', '沃之沃上海专卖店', 24, 1.32, 1515336887, 174188835, 5.5, '119836497925996914', 1, 1, 1, 1516958830, 1516958830),
(84, 4, '538585379380', '亿家达电脑桌台式家用电脑桌子简约现代书桌经济型写字台办公桌子', 'https://img.alicdn.com/tfscom/i2/1058517030/TB1G85CocjI8KJjSsppXXXbyVXa_!!0-item_pic.jpg', '亿家达旗舰店', 69, 7.25, 1515336040, 174188835, 10.5, '119885580438996914', 1, 1, 1, 1516958830, 1516958830),
(85, 4, '539020241804', '烤火炉电烤炉子木质家用实木取暖器暖脚器烤火箱烤脚电火桶电火盆', 'https://img.alicdn.com/tfscom/i1/48064266/TB2j1nxelfH8KJjy1XbXXbLdXXa_!!48064266.jpg', '湘芙电器', 217.5, 6.53, 1515297635, 174188835, 3, '111692597324245170', 1, 0, 1, 1516958830, 1516958830),
(86, 4, '542459708725', '华硕戴尔惠普联想小新小米笔记本电脑接口网络接头usb网线转换器', 'https://img.alicdn.com/tfscom/i1/1672975935/TB1JUz_koUIL1JjSZFrXXb3xFXa_!!0-item_pic.jpg', '司各托数码配件专营店', 58, 3.07, 1515232168, 174188835, 5.3, '111392103525532772', 1, 1, 1, 1516958831, 1516958831),
(87, 4, '556777283104', '加厚保暖法兰绒四件套珊瑚绒冬季1.8m床上用品双面法莱绒被套床单', 'https://img.alicdn.com/tfscom/i4/2222850086/TB1vJbgcxTI8KJjSspiXXbM4FXa_!!0-item_pic.jpg', '觉先生家居旗舰店', 159, 10.5, 1515214571, 174188835, 6.6, '119341457248996914', 1, 1, 1, 1516958831, 1516958831),
(88, 4, '42037842967', '彩虹电热毯单人学生安全宿舍床调温防水加厚家用电褥子官方旗舰店', NULL, 'rainbow彩虹旗舰店', 86, 1.55, 1515210810, 174188835, 1.8, '119320597229996914', 1, 1, 1, 1516958831, 1516958831),
(89, 4, '526051545678', '4条孕妇内裤低腰纯棉底裆怀孕期产妇不抗菌短裤头女大码内衣透气', 'https://img.alicdn.com/tfscom/i3/TB1UlOfRVXXXXa0XpXXXXXXXXXX_!!0-item_pic.jpg', '容易母婴专营店', 29.8, 1.49, 1515164065, 174188835, 5, '119278484578876006', 1, 1, 1, 1516958831, 1516958831),
(90, 4, '560083960502', '全棉可拆洗带被套被子单双人棉被新疆棉絮棉花被加厚保暖冬被纯棉', 'https://img.alicdn.com/tfscom/i4/2211230505/TB19n52d0bJ8KJjy1zjXXaqapXa_!!0-item_pic.jpg', '艾格妮斯旗舰店', 135, 2.71, 1514893992, 174188835, 2, '109872736134532772', 1, 1, 1, 1516958831, 1516958831);

-- --------------------------------------------------------

--
-- 表的结构 `agent_pid`
--

CREATE TABLE `agent_pid` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `nick` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `openid` varchar(1024) DEFAULT NULL COMMENT 'openid',
  `pid` varchar(1024) NOT NULL COMMENT 'pid',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0表示未使用,1表示使用',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pid管理表';

--
-- 转存表中的数据 `agent_pid`
--

INSERT INTO `agent_pid` (`id`, `user_id`, `nick`, `openid`, `pid`, `use_time`, `status`, `createtime`, `updatetime`) VALUES
(1, 4, '杨启华', 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', 'mm_126370153_41214963_184032482', 1516779318, 0, 1516778751, 1516778751),
(2, 4, '杨启华', 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', 'mm_126370153_42216849_208558703', 1516783282, 0, 1516779916, 1516779916),
(3, NULL, NULL, NULL, 'mm_126370153_42216849_208562825', NULL, 0, 1516779929, 1516779929),
(4, NULL, NULL, NULL, 'mm_126370153_42216849_208584453', NULL, 0, 1516779939, 1516779939),
(5, NULL, NULL, NULL, 'mm_126370153_42216849_208554735', NULL, 0, 1516779952, 1516779952),
(6, NULL, NULL, NULL, 'mm_126370153_42216849_208592031', NULL, 0, 1516779967, 1516779967),
(7, NULL, NULL, NULL, 'mm_126370153_42216849_208580543', NULL, 0, NULL, NULL),
(8, NULL, NULL, NULL, 'mm_126370153_42216849_208574671', NULL, 0, 1517062876, 1517062876),
(9, NULL, NULL, NULL, 'mm_126370153_42216849_208588117', NULL, 0, 1517062876, 1517062876),
(10, NULL, NULL, NULL, 'mm_126370153_42216849_208576479', NULL, 0, 1517062876, 1517062876),
(11, NULL, NULL, NULL, 'mm_126370153_42216849_208588123', NULL, 0, 1517062876, 1517062876),
(12, NULL, NULL, NULL, 'mm_126370153_42216849_208548863', NULL, 0, 1517062876, 1517062876),
(13, NULL, NULL, NULL, 'mm_126370153_42316876_214102735', NULL, 0, 1517062876, 1517062876),
(14, NULL, NULL, NULL, 'mm_126370153_42316876_214168344', NULL, 0, 1517062876, 1517062876),
(15, NULL, NULL, NULL, 'mm_126370153_42316876_214156946', NULL, 0, 1517062876, 1517062876),
(16, NULL, NULL, NULL, 'mm_126370153_42316876_214176337', NULL, 0, 1517062876, 1517062876),
(17, NULL, NULL, NULL, 'mm_126370153_42316876_214148757', NULL, 0, 1517062876, 1517062876),
(18, NULL, NULL, NULL, 'mm_126370153_42316876_214168350', NULL, 0, 1517062876, 1517062876),
(19, NULL, NULL, NULL, 'mm_126370153_42316876_214164378', NULL, 0, 1517062876, 1517062876),
(20, NULL, NULL, NULL, 'mm_126370153_42316876_214180097', NULL, 0, 1517062876, 1517062876),
(21, NULL, NULL, NULL, 'mm_126370153_42316876_214190029', NULL, 0, 1517062877, 1517062877),
(22, NULL, NULL, NULL, 'mm_126370153_42316876_214188037', NULL, 0, 1517062877, 1517062877),
(23, NULL, NULL, NULL, 'mm_126370153_42316876_214142851', NULL, 0, 1517062877, 1517062877),
(24, NULL, NULL, NULL, 'mm_126370153_42316876_214168547', NULL, 0, 1517063140, 1517063140),
(25, NULL, NULL, NULL, 'mm_126370153_42316876_214158724', NULL, 0, 1517063140, 1517063140),
(26, NULL, NULL, NULL, 'mm_126370153_42316876_214190220', NULL, 0, 1517063140, 1517063140),
(27, NULL, NULL, NULL, 'mm_126370153_42316876_214178403', NULL, 0, 1517063140, 1517063140),
(28, NULL, NULL, NULL, 'mm_126370153_42316876_214162751', NULL, 0, 1517063140, 1517063140),
(29, NULL, NULL, NULL, 'mm_126370153_42316876_214172511', NULL, 0, 1517063140, 1517063140),
(30, NULL, NULL, NULL, 'mm_126370153_42316876_214168557', NULL, 0, 1517063140, 1517063140),
(31, NULL, NULL, NULL, 'mm_126370153_42316876_214186253', NULL, 0, 1517063140, 1517063140),
(32, NULL, NULL, NULL, 'mm_126370153_42316876_214168562', NULL, 0, 1517063140, 1517063140),
(33, NULL, NULL, NULL, 'mm_126370153_42316876_214196032', NULL, 0, 1517063140, 1517063140),
(34, NULL, NULL, NULL, 'mm_126370153_42316876_214178413', NULL, 0, 1517063140, 1517063140),
(35, NULL, NULL, NULL, 'mm_126370153_42316876_214162759', NULL, 0, 1517063140, 1517063140),
(36, NULL, NULL, NULL, 'mm_126370153_42316876_214190233', NULL, 0, 1517063140, 1517063140),
(37, NULL, NULL, NULL, 'mm_126370153_42316876_214176577', NULL, 0, 1517063140, 1517063140),
(38, NULL, NULL, NULL, 'mm_126370153_42316876_214174540', NULL, 0, 1517063140, 1517063140),
(39, NULL, NULL, NULL, 'mm_126370153_42316876_214172523', NULL, 0, 1517063140, 1517063140),
(40, NULL, NULL, NULL, 'mm_126370153_42316876_214194084', NULL, 0, 1517063140, 1517063140),
(41, NULL, NULL, NULL, 'mm_126370153_42316876_214184349', NULL, 0, 1517063140, 1517063140),
(42, NULL, NULL, NULL, 'mm_126370153_42316876_214164521', NULL, 0, 1517063140, 1517063140),
(43, NULL, NULL, NULL, 'mm_126370153_42316876_214182252', NULL, 0, 1517063140, 1517063140),
(44, NULL, NULL, NULL, 'mm_126370153_42316876_214148990', NULL, 0, 1517063673, 1517063673),
(45, NULL, NULL, NULL, 'mm_126370153_42316876_214194219', NULL, 0, 1517063673, 1517063673),
(46, NULL, NULL, NULL, 'mm_126370153_42316876_214158820', NULL, 0, 1517063673, 1517063673),
(47, NULL, NULL, NULL, 'mm_126370153_42316876_214180320', NULL, 0, 1517063673, 1517063673),
(48, NULL, NULL, NULL, 'mm_126370153_42316876_214194222', NULL, 0, 1517063673, 1517063673),
(49, NULL, NULL, NULL, 'mm_126370153_42316876_214200055', NULL, 0, 1517063673, 1517063673),
(50, NULL, NULL, NULL, 'mm_126370153_42316876_214186403', NULL, 0, 1517063673, 1517063673),
(51, NULL, NULL, NULL, 'mm_126370153_42316876_214186404', NULL, 0, 1517063673, 1517063673),
(52, NULL, NULL, NULL, 'mm_126370153_42316876_214174675', NULL, 0, 1517063673, 1517063673),
(53, NULL, NULL, NULL, 'mm_126370153_42316876_214200058', NULL, 0, 1517063673, 1517063673),
(54, NULL, NULL, NULL, 'mm_126370153_42316876_214174676', NULL, 0, 1517063673, 1517063673),
(55, NULL, NULL, NULL, 'mm_126370153_42316876_214180327', NULL, 0, 1517063673, 1517063673),
(56, NULL, NULL, NULL, 'mm_126370153_42316876_214168710', NULL, 0, 1517063673, 1517063673);

-- --------------------------------------------------------

--
-- 表的结构 `agent_spread`
--

CREATE TABLE `agent_spread` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL COMMENT '推广者',
  `to_user_id` int(11) NOT NULL COMMENT '被推广者',
  `reward` double NOT NULL DEFAULT '0' COMMENT '奖励',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理推广奖励表';

--
-- 转存表中的数据 `agent_spread`
--

INSERT INTO `agent_spread` (`id`, `from_user_id`, `to_user_id`, `reward`, `status`, `createtime`, `updatetime`) VALUES
(1, 1, 2, 0, 1, 1516271460, NULL),
(2, 1, 4, 98, 1, 1516702689, 1516702689),
(3, 1, 4, 98, 1, 1516702832, 1516702832);

-- --------------------------------------------------------

--
-- 表的结构 `agent_tixian`
--

CREATE TABLE `agent_tixian` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `money` double NOT NULL DEFAULT '0' COMMENT '提现金额',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0微信，1支付宝',
  `token` varchar(1024) DEFAULT NULL COMMENT '提现账户',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表';

--
-- 转存表中的数据 `agent_tixian`
--

INSERT INTO `agent_tixian` (`id`, `user_id`, `money`, `type`, `token`, `status`, `createtime`, `updatetime`) VALUES
(1, 1, 20, 0, 'qmqdd666', 1, 1516374265, NULL),
(2, 1, 16.8, 1, '1803705718@qq.com', 0, 1516271467, NULL),
(3, 1, 10, 0, '123', 0, 1516619186, 1516619186),
(4, 1, 10, 0, '123', 0, 1516619278, 1516619278);

-- --------------------------------------------------------

--
-- 表的结构 `agent_user`
--

CREATE TABLE `agent_user` (
  `id` int(11) NOT NULL,
  `openid` varchar(1024) NOT NULL COMMENT 'openid',
  `nick` varchar(1024) DEFAULT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL DEFAULT '1' COMMENT '性别',
  `province` varchar(1024) DEFAULT NULL COMMENT '省份',
  `city` varchar(1024) DEFAULT NULL COMMENT '城市',
  `fid` varchar(1024) NOT NULL DEFAULT 'system' COMMENT '上级openid',
  `head_img` varchar(1024) DEFAULT NULL COMMENT '头像',
  `is_agent` int(11) NOT NULL DEFAULT '0' COMMENT '是否代理',
  `money` double NOT NULL DEFAULT '0' COMMENT '账户余额',
  `pid` varchar(1024) DEFAULT NULL COMMENT 'mm_xx_xx_xx',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `order_count` int(11) NOT NULL DEFAULT '0' COMMENT '订单数',
  `total_commission` double NOT NULL DEFAULT '0' COMMENT '累积返佣',
  `request_code` varchar(1024) NOT NULL DEFAULT 'lhyqh0' COMMENT '邀请码',
  `tixian` double NOT NULL DEFAULT '0' COMMENT '已提现',
  `spread_count` int(11) NOT NULL DEFAULT '0' COMMENT '推广代理数',
  `spread_money` double NOT NULL DEFAULT '0' COMMENT '推广代理奖励',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `agent_time` int(11) DEFAULT NULL COMMENT '成为代理时间',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

--
-- 转存表中的数据 `agent_user`
--

INSERT INTO `agent_user` (`id`, `openid`, `nick`, `sex`, `province`, `city`, `fid`, `head_img`, `is_agent`, `money`, `pid`, `customer_count`, `order_count`, `total_commission`, `request_code`, `tixian`, `spread_count`, `spread_money`, `status`, `agent_time`, `createtime`, `updatetime`) VALUES
(1, 'system', '总代理', 1, NULL, NULL, 'system', NULL, 1, 4.699999999999999, 'mm_126370153_41252811_177878190', 9, 0, 0, 'lhyqh0', 20, 3, 294, 1, 1516291199, 1516271460, 1516271460),
(2, 'lh', '云之巅', 1, '四川', '成都', 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', 'https://img.alicdn.com/imgextra/i1/1879660321/TB2eTNge0LO8KJjSZFxXXaGEVXa_!!1879660321.jpg', 0, 0, 'mm_126370153_42216849_208558703', 0, 0, 0, 'fc517e', 0, 0, 0, 1, NULL, 1516271460, NULL),
(3, 'yqh', '云之巅', 1, ' 湖南 ', '长沙', 'system', 'https://img.alicdn.com/imgextra/i1/1879660321/TB2eTNge0LO8KJjSZFxXXaGEVXa_!!1879660321.jpg', 0, 0, NULL, 0, 0, 0, 'lhyqh0', 0, 0, 0, 1, NULL, 1516271460, NULL),
(4, 'ok6sq5PK4EQnTij_y1H2mDRP4QxI', '杨启华', 1, 'Sichuan', 'Chengdu', 'system', 'https://wx.qlogo.cn/mmopen/vi_32/ySAH6vk0pVFUvllf9GlmvmxekWyHiaVtwjx3PSK5FqC4hcYFlgEdznWAicTnHSPh0NzJJ1HxVW3KGpl9hlyt9bsg/0', 1, 0, 'mm_126370153_41252811_174188835', 3, 0, 0, 'fc517e', 0, 0, 0, 1, 1516783282, 1516641017, 1516641017);

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin`
--

CREATE TABLE `fa_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_admin`
--

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', 0, 1516608720, 1492186163, 1516608720, 'ba92544d-ad09-4152-8433-c6f306c44996', 'normal'),
(2, 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', 0, 1505450906, 1492186163, 1505450906, 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal'),
(3, 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', 0, 1501980868, 1492186201, 1501982377, '', 'normal'),
(4, 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', 0, 0, 1492186240, 1492186240, '', 'normal'),
(5, 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', 0, 0, 1492186263, 1492186263, '', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin_log`
--

CREATE TABLE `fa_admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日志表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `fa_admin_log`
--

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1317, 1, 'admin', '/agent/public/index.php/admin/index/login.html', '登录', '{"__token__":"04f5ea5b6e53eb8f734b175b8c964499","username":"admin"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1515744133),
(1318, 1, 'admin', '/agent/public/index.php/admin/index/login.html', '登录', '{"__token__":"7b236c0ab2f13af3454b503725ba4b95","username":"admin","keeplogin":"1"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516525253),
(1319, 1, 'admin', '/agent/public/index.php/admin/index/login.html', '登录', '{"__token__":"53c19754e6588c66a19875880ed2f4f2","username":"admin"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516608720),
(1320, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"notice"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516608837),
(1321, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"dictionary","name":"notice","title":"\\u4e2a\\u4eba\\u4e2d\\u5fc3\\u516c\\u544a","value":"\\u6bcf\\u670825\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670825\\u65e5\\u7ed3\\u7b97\\u3002","content":"key1|value1\\r\\nkey2|value2","tip":"\\u4e2a\\u4eba\\u4e2d\\u5fc3\\u516c\\u544a","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516608913),
(1322, 1, 'admin', '/agent/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{"row":{"categorytype":{"field":{"default":"default","page":"page","article":"article","test":"test"},"value":{"default":"Default","page":"Page","article":"Article","test":"Test"}},"configgroup":{"field":{"basic":"basic","email":"email","dictionary":"dictionary","user":"user","example":"example"},"value":{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}},"notice":"\\u6bcf\\u670825\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670825\\u65e5\\u7ed3\\u7b97"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516610689),
(1323, 1, 'admin', '/agent/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{"row":{"categorytype":{"field":{"default":"default","page":"page","article":"article","test":"test"},"value":{"default":"Default","page":"Page","article":"Article","test":"Test"}},"configgroup":{"field":{"basic":"basic","email":"email","dictionary":"dictionary","user":"user","example":"example"},"value":{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}},"notice":"\\u6bcf\\u670821\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670821\\u65e5\\u7ed3\\u7b97"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516610709),
(1324, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"tixian_notice"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516612565),
(1325, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"basic","name":"tixian_notice","title":"\\u63d0\\u73b0\\u516c\\u544a","value":"\\u5355\\u7b14\\u63d0\\u73b0\\u4f59\\u989d\\u4e0d\\u80fd\\u5c11\\u4e8e10\\u5143","content":"key1|value1\\r\\nkey2|value2","tip":"\\u63d0\\u73b0\\u516c\\u544a","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516612602),
(1326, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"normal_notice"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516640128),
(1327, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"dictionary","name":"normal_notice","title":"\\u666e\\u901a\\u7528\\u6237\\u516c\\u544a","value":"\\u67e0\\u6aac\\u597d\\u7269\\u6b63\\u5728\\u62db\\u5408\\u4f19\\u4eba\\uff0c\\u5feb\\u6765\\u52a0\\u5165\\u5427\\uff01","content":"key1|value1\\r\\nkey2|value2","tip":"\\u666e\\u901a\\u7528\\u6237\\u516c\\u544a","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516640188),
(1328, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"alimama_cookie"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516897558),
(1329, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"dictionary","name":"alimama_cookie","title":"\\u963f\\u91cc\\u5988\\u5988cookie","value":"t=016b7584eef6ef5a9d4549abf428090c; 126370153_yxjh-filter-1=true; undefined_yxjh-filter-1=true; account-path-guide-s1=true; cna=n+daDozLlDACAbaVnLpee+Rt; UM_distinctid=1608756c8d62b3-01ba5813a9c4ca-6113187e-1fa400-1608756c8d7111; qq-best-goods-down-time=1515831677233; v=0; cookie2=1e9265942326a4777bef77b06629adba; _tb_token_=eeb3695e15361; alimamapwag=TW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4yOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzYzLjAuMzIzOS4xMzIgU2FmYXJpLzUzNy4zNg%3D%3D; cookie32=45827167dae699d81bc1047ab98f5243; alimamapw=QCAEFCVSF3BTE3gjRHMAFXV7QCAIFCQnF3BVE39fRHNwFXUBbFQFVVJSUwNSBltTVg8DU1cJBlcH%0AAlUGAwNUUA1XBVNT; cookie31=MTI2MzcwMTUzLCVFNCVCQSU5MSVFNCVCOSU4QiVFNSVCNyU4NSVFNCVCOCVCNiVFOCVCRCVBOSVFNiU5QiVBNiwxODAzNzA1NzE4QHFxLmNvbSxUQg%3D%3D; login=V32FPkk%2Fw0dUvg%3D%3D; rurl=aHR0cDovL3B1Yi5hbGltYW1hLmNvbS8%2Fc3BtPWEyMTl0Ljc2NjQ1NTQuYTIxNHRyOC45LjRiMjc1MzM1cnNXZ2Nv; apush87259e0e0b98351e62f8d308516a70ce=%7B%22ts%22%3A1516896176317%2C%22heir%22%3A1516892960897%2C%22parentId%22%3A1516885695150%7D; isg=BAgI8b5NxkIBtSkffTmBvr9A2XbaGW3SGT7X-8K6EwMQna4HasG9SknbEXXtrSST","content":"key1|value1\\r\\nkey2|value2","tip":"\\u963f\\u91cc\\u5988\\u5988cookie","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516897594),
(1330, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"chaozhi_cookie"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516897646),
(1331, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"dictionary","name":"chaozhi_cookie","title":"\\u91ce\\u9e21cookie","value":"user_name=hiluo302; user_pass=95luohui; UM_distinctid=160e5d40e18105-02e378280029eb-454c0a2b-1fa400-160e5d40e1da3; PHPSESSID=u0u5cfmvegm3u421kn3e6v6143; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A%22100%22%2C%22token%22%3A%2270002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227%22%7D; CNZZDATA1255591768=1881858639-1515683014-http%253A%252F%252Ftool.chaozhi.hk%252F%7C1516813138","content":"key1|value1\\r\\nkey2|value2","tip":"\\u91ce\\u9e21cookie","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516897677),
(1332, 1, 'admin', '/agent/public/index.php/admin/general/config/check', '', '{"row":{"name":"chaozhi_key"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516898674),
(1333, 1, 'admin', '/agent/public/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{"row":{"type":"string","group":"dictionary","name":"chaozhi_key","title":"\\u91ce\\u9e21key","value":"70002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227","content":"key1|value1\\r\\nkey2|value2","tip":"\\u91ce\\u9e21key","rule":"","extend":""}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516898693),
(1334, 1, 'admin', '/agent/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{"row":{"categorytype":{"field":{"default":"default","page":"page","article":"article","test":"test"},"value":{"default":"Default","page":"Page","article":"Article","test":"Test"}},"configgroup":{"field":{"basic":"basic","email":"email","dictionary":"dictionary","user":"user","example":"example"},"value":{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}},"notice":"\\u6bcf\\u670821\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670821\\u65e5\\u7ed3\\u7b97","tixian_notice":"\\u5355\\u7b14\\u63d0\\u73b0\\u4f59\\u989d\\u4e0d\\u80fd\\u5c11\\u4e8e10\\u5143","normal_notice":"\\u67e0\\u6aac\\u597d\\u7269\\u6b63\\u5728\\u62db\\u5408\\u4f19\\u4eba\\uff0c\\u5feb\\u6765\\u52a0\\u5165\\u5427\\uff01","alimama_cookie":"t=016b7584eef6ef5a9d4549abf428090c; 126370153_yxjh-filter-1=true; undefined_yxjh-filter-1=true; account-path-guide-s1=true; cna=n+daDozLlDACAbaVnLpee+Rt; UM_distinctid=1608756c8d62b3-01ba5813a9c4ca-6113187e-1fa400-1608756c8d7111; qq-best-goods-down-time=1515831677233; v=0; cookie2=1e9265942326a4777bef77b06629adba; _tb_token_=eeb3695e15361; alimamapwag=TW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4yOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzYzLjAuMzIzOS4xMzIgU2FmYXJpLzUzNy4zNg%3D%3D; cookie32=45827167dae699d81bc1047ab98f5243; alimamapw=QCAEFCVSF3BTE3gjRHMAFXV7QCAIFCQnF3BVE39fRHNwFXUBbFQFVVJSUwNSBltTVg8DU1cJBlcH%0AAlUGAwNUUA1XBVNT; cookie31=MTI2MzcwMTUzLCVFNCVCQSU5MSVFNCVCOSU4QiVFNSVCNyU4NSVFNCVCOCVCNiVFOCVCRCVBOSVFNiU5QiVBNiwxODAzNzA1NzE4QHFxLmNvbSxUQg%3D%3D; login=V32FPkk%2Fw0dUvg%3D%3D; rurl=aHR0cDovL3B1Yi5hbGltYW1hLmNvbS8%2Fc3BtPWEyMTl0Ljc2NjQ1NTQuYTIxNHRyOC45LjRiMjc1MzM1cnNXZ2Nv; apush87259e0e0b98351e62f8d308516a70ce=%7B%22ts%22%3A1516896176317%2C%22heir%22%3A1516892960897%2C%22parentId%22%3A1516885695150%7D; isg=BAgI8b5NxkIBtSkffTmBvr9A2XbaGW3SGT7X-8K6EwMQna4HasG9SknbEXXtrSST","chaozhi_cookie":"PHPSESSID=mibl7ndc8pkddd1vhkupfika35; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A97%2C%22token%22%3A%2270002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227%22%7D"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516904487),
(1335, 1, 'admin', '/agent/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{"row":{"categorytype":{"field":{"default":"default","page":"page","article":"article","test":"test"},"value":{"default":"Default","page":"Page","article":"Article","test":"Test"}},"configgroup":{"field":{"basic":"basic","email":"email","dictionary":"dictionary","user":"user","example":"example"},"value":{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}},"notice":"\\u6bcf\\u670821\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670821\\u65e5\\u7ed3\\u7b97","tixian_notice":"\\u5355\\u7b14\\u63d0\\u73b0\\u4f59\\u989d\\u4e0d\\u80fd\\u5c11\\u4e8e10\\u5143","normal_notice":"\\u67e0\\u6aac\\u597d\\u7269\\u6b63\\u5728\\u62db\\u5408\\u4f19\\u4eba\\uff0c\\u5feb\\u6765\\u52a0\\u5165\\u5427\\uff01","alimama_cookie":"t=016b7584eef6ef5a9d4549abf428090c; 126370153_yxjh-filter-1=true; undefined_yxjh-filter-1=true; account-path-guide-s1=true; cna=n+daDozLlDACAbaVnLpee+Rt; UM_distinctid=1608756c8d62b3-01ba5813a9c4ca-6113187e-1fa400-1608756c8d7111; qq-best-goods-down-time=1515831677233; v=0; cookie2=1e9265942326a4777bef77b06629adba; _tb_token_=eeb3695e15361; alimamapwag=TW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4yOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzYzLjAuMzIzOS4xMzIgU2FmYXJpLzUzNy4zNg%3D%3D; cookie32=45827167dae699d81bc1047ab98f5243; alimamapw=QCAEFCVSF3BTE3gjRHMAFXV7QCAIFCQnF3BVE39fRHNwFXUBbFQFVVJSUwNSBltTVg8DU1cJBlcH%0AAlUGAwNUUA1XBVNT; cookie31=MTI2MzcwMTUzLCVFNCVCQSU5MSVFNCVCOSU4QiVFNSVCNyU4NSVFNCVCOCVCNiVFOCVCRCVBOSVFNiU5QiVBNiwxODAzNzA1NzE4QHFxLmNvbSxUQg%3D%3D; login=Vq8l%2BKCLz3%2F65A%3D%3D; rurl=aHR0cDovL3B1Yi5hbGltYW1hLmNvbS8%2Fc3BtPWEyMTl0Ljc2NjQ1NTQuYTIxNHRyOC43LjI4MGY4NDU2eHJ6YTBE; apush87259e0e0b98351e62f8d308516a70ce=%7B%22ts%22%3A1516952839137%2C%22heir%22%3A1516952803878%2C%22parentId%22%3A1516885695150%7D; isg=BGFhSXdXn1qyNTD0PHZIVa4XcC27ptRpqKnu0MM0M2jZKoj8Cl_M0e4siF6s4m04","chaozhi_cookie":"PHPSESSID=mibl7ndc8pkddd1vhkupfika35; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A97%2C%22token%22%3A%2270002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227%22%7D","chaozhi_key":"70002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1516952856),
(1336, 1, 'admin', '/agent/public/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{"row":{"categorytype":{"field":{"default":"default","page":"page","article":"article","test":"test"},"value":{"default":"Default","page":"Page","article":"Article","test":"Test"}},"configgroup":{"field":{"basic":"basic","email":"email","dictionary":"dictionary","user":"user","example":"example"},"value":{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}},"notice":"\\u6bcf\\u670821\\u65e5\\u7ed3\\u7b97\\u4e0a\\u6708\\u9884\\u4f30\\u6536\\u5165\\uff0c\\u672c\\u6708\\u9884\\u4f30\\u6536\\u5165\\u5219\\u5728\\u4e0b\\u670821\\u65e5\\u7ed3\\u7b97","tixian_notice":"\\u5355\\u7b14\\u63d0\\u73b0\\u4f59\\u989d\\u4e0d\\u80fd\\u5c11\\u4e8e10\\u5143","normal_notice":"\\u67e0\\u6aac\\u597d\\u7269\\u6b63\\u5728\\u62db\\u5408\\u4f19\\u4eba\\uff0c\\u5feb\\u6765\\u52a0\\u5165\\u5427\\uff01","alimama_cookie":"t=016b7584eef6ef5a9d4549abf428090c; 126370153_yxjh-filter-1=true; undefined_yxjh-filter-1=true; account-path-guide-s1=true; cna=n+daDozLlDACAbaVnLpee+Rt; UM_distinctid=1608756c8d62b3-01ba5813a9c4ca-6113187e-1fa400-1608756c8d7111; qq-best-goods-down-time=1515831677233; v=0; cookie2=1e9265942326a4777bef77b06629adba; _tb_token_=eeb3695e15361; alimamapwag=TW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4yOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzYzLjAuMzIzOS4xMzIgU2FmYXJpLzUzNy4zNg%3D%3D; cookie32=45827167dae699d81bc1047ab98f5243; alimamapw=QCAEFCVSF3BTE3gjRHMAFXV7QCAIFCQnF3BVE39fRHNwFXUBbFQFVVJSUwNSBltTVg8DU1cJBlcH%0AAlUGAwNUUA1XBVNT; cookie31=MTI2MzcwMTUzLCVFNCVCQSU5MSVFNCVCOSU4QiVFNSVCNyU4NSVFNCVCOCVCNiVFOCVCRCVBOSVFNiU5QiVBNiwxODAzNzA1NzE4QHFxLmNvbSxUQg%3D%3D; login=V32FPkk%2Fw0dUvg%3D%3D; rurl=aHR0cDovL3B1Yi5hbGltYW1hLmNvbS8%3D; apush87259e0e0b98351e62f8d308516a70ce=%7B%22ts%22%3A1517060177637%2C%22parentId%22%3A1517059759446%7D; isg=BE9PtOJ3SSqtqk6KXhxeoyyt3uOZ3KL_auMwTmFYSb7KMHoyakYG5oFmNmCOSHsO","chaozhi_cookie":"PHPSESSID=mibl7ndc8pkddd1vhkupfika35; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A97%2C%22token%22%3A%2270002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227%22%7D","chaozhi_key":"70002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1517060571);

-- --------------------------------------------------------

--
-- 表的结构 `fa_attachment`
--

CREATE TABLE `fa_attachment` (
  `id` int(20) UNSIGNED NOT NULL COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `fa_attachment`
--

INSERT INTO `fa_attachment` (`id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group`
--

CREATE TABLE `fa_auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表';

--
-- 转存表中的数据 `fa_auth_group`
--

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group_access`
--

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

--
-- 转存表中的数据 `fa_auth_group_access`
--

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_rule`
--

CREATE TABLE `fa_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_auth_rule`
--

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(66, 'file', 0, 'addon', '插件管理', 'fa fa-circle-o', '', '可在线安装、卸载、禁用、启用插件，同时支持添加本地插件。FastAdmin已上线插件商店 ，你可以发布你的免费或付费插件：<a href="http://www.fastadmin.net/store.html" target="_blank">http://www.fastadmin.net/store.html</a>', 1, 1516693803, 1516693803, 0, 'normal'),
(67, 'file', 66, 'addon/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(68, 'file', 66, 'addon/config', '配置', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(69, 'file', 66, 'addon/install', '安装', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(70, 'file', 66, 'addon/uninstall', '卸载', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(71, 'file', 66, 'addon/state', '禁用启用', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(72, 'file', 66, 'addon/local', '本地上传', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(73, 'file', 66, 'addon/refresh', '刷新缓存', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(74, 'file', 66, 'addon/downloaded', '已装插件', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(75, 'file', 66, 'addon/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(76, 'file', 66, 'addon/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(77, 'file', 66, 'addon/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(78, 'file', 66, 'addon/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(79, 'file', 66, 'addon/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(80, 'file', 66, 'addon/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(81, 'file', 66, 'addon/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693803, 1516693803, 0, 'normal'),
(82, 'file', 0, 'category', '分类管理', 'fa fa-list', '', '用于统一管理网站的所有分类,分类可进行无限级分类', 1, 1516693804, 1516693804, 0, 'normal'),
(83, 'file', 82, 'category/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(84, 'file', 82, 'category/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(85, 'file', 82, 'category/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(86, 'file', 82, 'category/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(87, 'file', 82, 'category/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(88, 'file', 82, 'category/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(89, 'file', 82, 'category/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(90, 'file', 82, 'category/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(91, 'file', 0, 'dashboard', '控制台', 'fa fa-dashboard', '', '用于展示当前系统中的统计数据、统计报表及重要实时数据', 1, 1516693804, 1516693804, 0, 'normal'),
(92, 'file', 91, 'dashboard/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(93, 'file', 91, 'dashboard/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(94, 'file', 91, 'dashboard/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(95, 'file', 91, 'dashboard/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(96, 'file', 91, 'dashboard/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(97, 'file', 91, 'dashboard/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(98, 'file', 91, 'dashboard/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(99, 'file', 91, 'dashboard/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693804, 1516693804, 0, 'normal'),
(100, 'file', 0, 'agent', 'agent', 'fa fa-list', '', '', 1, 1516693804, 1516693804, 0, 'normal'),
(101, 'file', 100, 'agent/apply', '申请代理管理', 'fa fa-circle-o', '', '', 1, 1516693804, 1516693804, 0, 'normal'),
(102, 'file', 101, 'agent/apply/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(103, 'file', 101, 'agent/apply/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(104, 'file', 101, 'agent/apply/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(105, 'file', 101, 'agent/apply/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(106, 'file', 101, 'agent/apply/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(107, 'file', 101, 'agent/apply/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(108, 'file', 101, 'agent/apply/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(109, 'file', 101, 'agent/apply/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(110, 'file', 100, 'agent/classlist', '淘客基地类别目录', 'fa fa-circle-o', '', '', 1, 1516693805, 1516693805, 0, 'normal'),
(111, 'file', 110, 'agent/classlist/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(112, 'file', 110, 'agent/classlist/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(113, 'file', 110, 'agent/classlist/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(114, 'file', 110, 'agent/classlist/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(115, 'file', 110, 'agent/classlist/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(116, 'file', 110, 'agent/classlist/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(117, 'file', 110, 'agent/classlist/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(118, 'file', 110, 'agent/classlist/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693805, 1516693805, 0, 'normal'),
(119, 'file', 100, 'agent/click', '代理点击收集管理', 'fa fa-circle-o', '', '', 1, 1516693805, 1516693805, 0, 'normal'),
(120, 'file', 119, 'agent/click/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(121, 'file', 119, 'agent/click/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(122, 'file', 119, 'agent/click/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(123, 'file', 119, 'agent/click/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(124, 'file', 119, 'agent/click/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(125, 'file', 119, 'agent/click/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(126, 'file', 119, 'agent/click/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(127, 'file', 119, 'agent/click/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(128, 'file', 100, 'agent/configure', '系统配置管理', 'fa fa-circle-o', '', '', 1, 1516693806, 1516693806, 0, 'normal'),
(129, 'file', 128, 'agent/configure/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(130, 'file', 128, 'agent/configure/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(131, 'file', 128, 'agent/configure/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(132, 'file', 128, 'agent/configure/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(133, 'file', 128, 'agent/configure/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(134, 'file', 128, 'agent/configure/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(135, 'file', 128, 'agent/configure/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(136, 'file', 128, 'agent/configure/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(137, 'file', 100, 'agent/goods', '商品数据缓', 'fa fa-circle-o', '', '', 1, 1516693806, 1516693806, 0, 'normal'),
(138, 'file', 137, 'agent/goods/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(139, 'file', 137, 'agent/goods/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(140, 'file', 137, 'agent/goods/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(141, 'file', 137, 'agent/goods/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(142, 'file', 137, 'agent/goods/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(143, 'file', 137, 'agent/goods/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(144, 'file', 137, 'agent/goods/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(145, 'file', 137, 'agent/goods/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(146, 'file', 100, 'agent/order', '订单管理', 'fa fa-circle-o', '', '', 1, 1516693806, 1516693806, 0, 'normal'),
(147, 'file', 146, 'agent/order/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(148, 'file', 146, 'agent/order/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(149, 'file', 146, 'agent/order/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(150, 'file', 146, 'agent/order/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(151, 'file', 146, 'agent/order/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(152, 'file', 146, 'agent/order/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(153, 'file', 146, 'agent/order/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(154, 'file', 146, 'agent/order/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693806, 1516693806, 0, 'normal'),
(155, 'file', 100, 'agent/spread', '代理推广奖励管理', 'fa fa-circle-o', '', '', 1, 1516693807, 1516693807, 0, 'normal'),
(156, 'file', 155, 'agent/spread/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(157, 'file', 155, 'agent/spread/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(158, 'file', 155, 'agent/spread/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(159, 'file', 155, 'agent/spread/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(160, 'file', 155, 'agent/spread/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(161, 'file', 155, 'agent/spread/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(162, 'file', 155, 'agent/spread/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(163, 'file', 155, 'agent/spread/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(164, 'file', 100, 'agent/tixian', '提现记录管理', 'fa fa-circle-o', '', '', 1, 1516693807, 1516693807, 0, 'normal'),
(165, 'file', 164, 'agent/tixian/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(166, 'file', 164, 'agent/tixian/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(167, 'file', 164, 'agent/tixian/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(168, 'file', 164, 'agent/tixian/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(169, 'file', 164, 'agent/tixian/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(170, 'file', 164, 'agent/tixian/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(171, 'file', 164, 'agent/tixian/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(172, 'file', 164, 'agent/tixian/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(173, 'file', 100, 'agent/user', '用户管理', 'fa fa-circle-o', '', '', 1, 1516693807, 1516693807, 0, 'normal'),
(174, 'file', 173, 'agent/user/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(175, 'file', 173, 'agent/user/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(176, 'file', 173, 'agent/user/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(177, 'file', 173, 'agent/user/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(178, 'file', 173, 'agent/user/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(179, 'file', 173, 'agent/user/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(180, 'file', 173, 'agent/user/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(181, 'file', 173, 'agent/user/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693807, 1516693807, 0, 'normal'),
(182, 'file', 0, 'auth', 'auth', 'fa fa-list', '', '', 1, 1516693808, 1516693808, 0, 'normal'),
(183, 'file', 182, 'auth/admin', '管理员管理', 'fa fa-users', '', '一个管理员可以有多个角色组,左侧的菜单根据管理员所拥有的权限进行生成', 1, 1516693808, 1516693808, 0, 'normal'),
(184, 'file', 183, 'auth/admin/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(185, 'file', 183, 'auth/admin/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(186, 'file', 183, 'auth/admin/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(187, 'file', 183, 'auth/admin/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(188, 'file', 183, 'auth/admin/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(189, 'file', 183, 'auth/admin/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(190, 'file', 183, 'auth/admin/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(191, 'file', 182, 'auth/adminlog', '管理员日志', 'fa fa-users', '', '管理员可以查看自己所拥有的权限的管理员日志', 1, 1516693808, 1516693808, 0, 'normal'),
(192, 'file', 191, 'auth/adminlog/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(193, 'file', 191, 'auth/adminlog/detail', '详情', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(194, 'file', 191, 'auth/adminlog/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(195, 'file', 191, 'auth/adminlog/selectpage', 'Selectpage', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(196, 'file', 191, 'auth/adminlog/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(197, 'file', 191, 'auth/adminlog/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(198, 'file', 191, 'auth/adminlog/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693808, 1516693808, 0, 'normal'),
(199, 'file', 182, 'auth/group', '角色组', 'fa fa-group', '', '角色组可以有多个,角色有上下级层级关系,如果子角色有角色组和管理员的权限则可以派生属于自己组别下级的角色组或管理员', 1, 1516693808, 1516693808, 0, 'normal'),
(200, 'file', 199, 'auth/group/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(201, 'file', 199, 'auth/group/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(202, 'file', 199, 'auth/group/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(203, 'file', 199, 'auth/group/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(204, 'file', 199, 'auth/group/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(205, 'file', 199, 'auth/group/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(206, 'file', 199, 'auth/group/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(207, 'file', 182, 'auth/rule', '规则管理', 'fa fa-list', '', '规则通常对应一个控制器的方法,同时左侧的菜单栏数据也从规则中体现,通常建议通过控制台进行生成规则节点', 1, 1516693809, 1516693809, 0, 'normal'),
(208, 'file', 207, 'auth/rule/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(209, 'file', 207, 'auth/rule/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(210, 'file', 207, 'auth/rule/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(211, 'file', 207, 'auth/rule/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(212, 'file', 207, 'auth/rule/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(213, 'file', 207, 'auth/rule/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(214, 'file', 207, 'auth/rule/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(215, 'file', 207, 'auth/rule/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(216, 'file', 0, 'general', 'general', 'fa fa-list', '', '', 1, 1516693809, 1516693809, 0, 'normal'),
(217, 'file', 216, 'general/attachment', '附件管理', 'fa fa-circle-o', '', '主要用于管理上传到又拍云的数据或上传至本服务的上传数据', 1, 1516693809, 1516693809, 0, 'normal'),
(218, 'file', 217, 'general/attachment/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(219, 'file', 217, 'general/attachment/select', '选择附件', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(220, 'file', 217, 'general/attachment/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(221, 'file', 217, 'general/attachment/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(222, 'file', 217, 'general/attachment/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(223, 'file', 217, 'general/attachment/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(224, 'file', 217, 'general/attachment/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(225, 'file', 217, 'general/attachment/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(226, 'file', 217, 'general/attachment/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693809, 1516693809, 0, 'normal'),
(227, 'file', 216, 'general/config', '系统配置', 'fa fa-circle-o', '', '可以在此增改系统的变量和分组,也可以自定义分组和变量,如果需要删除请从数据库中删除', 1, 1516693810, 1516693810, 0, 'normal'),
(228, 'file', 227, 'general/config/index', 'Index', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(229, 'file', 227, 'general/config/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(230, 'file', 227, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(231, 'file', 227, 'general/config/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(232, 'file', 227, 'general/config/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(233, 'file', 227, 'general/config/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(234, 'file', 227, 'general/config/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(235, 'file', 227, 'general/config/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(236, 'file', 216, 'general/profile', '个人配置', 'fa fa-user', '', '', 1, 1516693810, 1516693810, 0, 'normal'),
(237, 'file', 236, 'general/profile/index', '查看', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(238, 'file', 236, 'general/profile/update', '更新个人信息', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(239, 'file', 236, 'general/profile/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(240, 'file', 236, 'general/profile/add', '添加', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(241, 'file', 236, 'general/profile/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(242, 'file', 236, 'general/profile/del', '删除', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(243, 'file', 236, 'general/profile/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(244, 'file', 236, 'general/profile/restore', '还原', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal'),
(245, 'file', 236, 'general/profile/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1516693810, 1516693810, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_category`
--

CREATE TABLE `fa_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `fa_category`
--

INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal'),
(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal'),
(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal'),
(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal'),
(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal'),
(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal'),
(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal'),
(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal'),
(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal'),
(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal'),
(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal'),
(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal'),
(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_config`
--

CREATE TABLE `fa_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

--
-- 转存表中的数据 `fa_config`
--

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{"backend":"zh-cn","frontend":"zh-cn"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{"default":"Default","page":"Page","article":"Article","test":"Test"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '["Please select","SMTP","Mail"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '["None","TLS","SSL"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', ''),
(18, 'notice', 'dictionary', '个人中心公告', '个人中心公告', 'string', '每月21日结算上月预估收入，本月预估收入则在下月21日结算', '', '', ''),
(19, 'tixian_notice', 'dictionary', '提现公告', '提现公告', 'string', '单笔提现余额不能少于10元', '', '', ''),
(20, 'normal_notice', 'dictionary', '普通用户公告', '普通用户公告', 'string', '柠檬好物正在招合伙人，快来加入吧！', '', '', ''),
(21, 'alimama_cookie', 'dictionary', '阿里妈妈cookie', '阿里妈妈cookie', 'string', 't=016b7584eef6ef5a9d4549abf428090c; 126370153_yxjh-filter-1=true; undefined_yxjh-filter-1=true; account-path-guide-s1=true; cna=n+daDozLlDACAbaVnLpee+Rt; UM_distinctid=1608756c8d62b3-01ba5813a9c4ca-6113187e-1fa400-1608756c8d7111; qq-best-goods-down-time=1515831677233; v=0; cookie2=1e9265942326a4777bef77b06629adba; _tb_token_=eeb3695e15361; alimamapwag=TW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4yOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzYzLjAuMzIzOS4xMzIgU2FmYXJpLzUzNy4zNg%3D%3D; cookie32=45827167dae699d81bc1047ab98f5243; alimamapw=QCAEFCVSF3BTE3gjRHMAFXV7QCAIFCQnF3BVE39fRHNwFXUBbFQFVVJSUwNSBltTVg8DU1cJBlcH%0AAlUGAwNUUA1XBVNT; cookie31=MTI2MzcwMTUzLCVFNCVCQSU5MSVFNCVCOSU4QiVFNSVCNyU4NSVFNCVCOCVCNiVFOCVCRCVBOSVFNiU5QiVBNiwxODAzNzA1NzE4QHFxLmNvbSxUQg%3D%3D; login=V32FPkk%2Fw0dUvg%3D%3D; rurl=aHR0cDovL3B1Yi5hbGltYW1hLmNvbS8%3D; apush87259e0e0b98351e62f8d308516a70ce=%7B%22ts%22%3A1517060177637%2C%22parentId%22%3A1517059759446%7D; isg=BE9PtOJ3SSqtqk6KXhxeoyyt3uOZ3KL_auMwTmFYSb7KMHoyakYG5oFmNmCOSHsO', '', '', ''),
(22, 'chaozhi_cookie', 'dictionary', '野鸡cookie', '野鸡cookie', 'string', 'PHPSESSID=mibl7ndc8pkddd1vhkupfika35; userInfo=%7B%22user%22%3A%22oGXe5jjUw9e03jAG4qOYYYTSoZrc%22%2C%22setting%22%3A%22%7B%5C%22isDxFi%5C%22%3Afalse%2C%5C%22isShowPic%5C%22%3Afalse%2C%5C%22isHSL%5C%22%3Afalse%2C%5C%22isHPIC%5C%22%3Afalse%2C%5C%22isDisc%5C%22%3Afalse%2C%5C%22isChangeTitle%5C%22%3Afalse%2C%5C%22ChangeTitle%5C%22%3A%5C%22%5C%22%2C%5C%22isShare%5C%22%3Afalse%2C%5C%22moreTj%5C%22%3Afalse%2C%5C%22tklEnc%5C%22%3Afalse%2C%5C%22tklTransfor%5C%22%3Afalse%2C%5C%22shareID%5C%22%3A%5C%22%5C%22%2C%5C%22setPid%5C%22%3A%5C%22mm_126370153_36622270_131112319%2Cmm_126370153_41252811_177878190%5C%22%7D%22%2C%22head_img%22%3A%22%22%2C%22nick_name%22%3A%22%22%2C%22times%22%3A97%2C%22token%22%3A%2270002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227%22%7D', '', '', ''),
(23, 'chaozhi_key', 'dictionary', '野鸡key', '野鸡key', 'string', '70002100142174d222fdfcb82c2c7c568985c1190088693c5f19ef190dd1a929358c8aa2032537227', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_test`
--

CREATE TABLE `fa_test` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `fa_test`
--

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, 0, 1, 'normal', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_apply`
--
ALTER TABLE `agent_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_classlist`
--
ALTER TABLE `agent_classlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_click`
--
ALTER TABLE `agent_click`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_configure`
--
ALTER TABLE `agent_configure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_goods`
--
ALTER TABLE `agent_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_order`
--
ALTER TABLE `agent_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_pid`
--
ALTER TABLE `agent_pid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_spread`
--
ALTER TABLE `agent_spread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_tixian`
--
ALTER TABLE `agent_tixian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_user`
--
ALTER TABLE `agent_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_admin`
--
ALTER TABLE `fa_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- Indexes for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group_access`
--
ALTER TABLE `fa_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `weigh` (`weigh`);

--
-- Indexes for table `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `fa_config`
--
ALTER TABLE `fa_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fa_test`
--
ALTER TABLE `fa_test`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `agent_apply`
--
ALTER TABLE `agent_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `agent_classlist`
--
ALTER TABLE `agent_classlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `agent_click`
--
ALTER TABLE `agent_click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `agent_configure`
--
ALTER TABLE `agent_configure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `agent_goods`
--
ALTER TABLE `agent_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `agent_order`
--
ALTER TABLE `agent_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- 使用表AUTO_INCREMENT `agent_pid`
--
ALTER TABLE `agent_pid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `agent_spread`
--
ALTER TABLE `agent_spread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `agent_tixian`
--
ALTER TABLE `agent_tixian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `agent_user`
--
ALTER TABLE `agent_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `fa_admin`
--
ALTER TABLE `fa_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=1337;
--
-- 使用表AUTO_INCREMENT `fa_attachment`
--
ALTER TABLE `fa_attachment`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
--
-- 使用表AUTO_INCREMENT `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `fa_config`
--
ALTER TABLE `fa_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `fa_test`
--
ALTER TABLE `fa_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
