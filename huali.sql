SET NAMES UTF8;
DROP DATABASE IF EXISTS huali;
CREATE DATABASE huali CHARSET=UTF8;
USE huali;

/*化妆品(cosmetic)型号(model)家族*/
CREATE TABLE  hl_cosmetic_mo_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(32)
);
INSERT INTO hl_cosmetic_mo_family VALUES
(NULL,'自然堂'),
(NULL,'丹姿水密码'),
(NULL,'百雀羚'),
(NULL,'相宜本草'),
(NULL,'韩后'),
(NULL,'艾璐卡'),
(NULL,'法兰琳卡'),
(NULL,'一叶子'),
(NULL,'墨菊');


/*化妆品*/
CREATE TABLE hl_cosmetic(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,						#所属型号家族编号
	title VARCHAR(128),				#主标题
	price DECIMAL(8,2),				#价格
	spec VARCHAR(64),           #规格/颜色
	promise VARCHAR(64),			#服务承诺
	lname VARCHAR(32),				#商品名称
	capacity VARCHAR(32),			#容量(capacity)
	shelf_time BIGINT,				#上架时间
	sold_count INT,						#已售出的数量
	is_onsalse BOOLEAN				#是否促销中
);
INSERT INTO hl_cosmetic VALUES
(1,1,'凝时鲜颜水乳套装（冰肌水+乳液+洁面+凝时三件套）（化妆品套装）',459,'自然堂凝时鲜颜水乳套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','凝时鲜颜水乳套装','120ml','20171107032412',380,true),
(2,1,'凝时鲜颜水乳套装 冰肌水',160,'自然堂水润保湿基础套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','凝时鲜颜水乳套装','120ml','20171107032412',300,true),
(3,1,'凝时鲜颜水乳套装 乳液',180,'自然堂雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','凝时鲜颜水乳套装','120ml','20171107032412',230,true),
(4,1,'凝时鲜颜水乳套装 洁面',120,'凝时鲜颜水乳套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','凝时鲜颜水乳套装','120ml','20171107032412',240,true),
(5,1,'凝时鲜颜水乳套装（冰肌水+乳液+洁面）',389,'雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','凝时鲜颜水乳套装','120ml','20171107032412',250,true),
(6,2,'水润保湿基础套装 柔肤水135ml',139,'水润保湿基础套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水润保湿基础套装','120ml','20171107032412',260,true),
(7,2,'水润保湿基础套装 柔肤乳100ml',169,'水润保湿基础套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水润保湿基础套装','120ml','20171107032412',310,true),
(8,2,'水润保湿基础套装 洗颜霜100g',128,'水润保湿基础套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水润保湿基础套装','120ml','20171107032412',320,true),
(9,2,'水润保湿基础套装 （洗颜霜100g+柔肤水135ml+柔肤乳100ml+雪域三件套）',359,'水润保湿基础套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水润保湿基础套装','120ml','20171107032412',333,true),
(10,3,'自然堂雪润皙白水乳精华套装(冰肌水+乳+精华液)(提亮保湿 套装)',398,'自然堂雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','雪润皙白水乳精华套装','120ml','20171107032412',340,true),
(11,3,'自然堂雪润皙白水乳精华套装(冰肌水+乳+精华液+小喷+霜霜组合+毛巾浴巾礼盒)(提亮保湿 套装)',398,'自然堂雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','雪润皙白水乳精华套装','120ml','20171107032412',355,true),
(12,3,'自然堂雪润皙白水乳精华套装 冰肌水',398,'自然堂雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','雪润皙白水乳精华套装','120ml','20171107032412',210,true),
(13,3,'自然堂雪润皙白水乳精华套装	乳',398,'自然堂雪润皙白水乳精华套装','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','雪润皙白水乳精华套装','120ml','20171107032412',220,true),
(14,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',118,true),
(15,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',356,true),
(16,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',45,true),
(17,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',63,true),
(18,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',87,true),
(19,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',87,true),
(20,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',87,true),
(21,4,'水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货',109,'水密码清新水润护肤礼盒4','*退货补运费 *7天无忧退货 *24小时快速退款 *48小时发货','水密码清新水润护肤','120ml','20171107032412',87,true);


/*化妆品图片*/
CREATE TABLE hl_cosmetic_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	cosmetic_id INT,						#化妆品编号
	sm VARCHAR(128),						#小图片路径
	md VARCHAR(128),						#中图片路径
	lg VARCHAR(128)							#大图片路径
);
INSERT INTO hl_cosmetic_pic VALUES
(NULL, 1, 'img/product/sm/1.jpg','img/product/md/1.jpg','img/product/lg/1.jpg'),
(NULL, 1, 'img/product/sm/2.jpg','img/product/md/2.jpg','img/product/lg/2.jpg'),
(NULL, 1, 'img/product/sm/3.jpg','img/product/md/3.jpg','img/product/lg/3.jpg'),
(NULL, 1, 'img/product/sm/4.jpg','img/product/md/4.jpg','img/product/lg/4.jpg'),
(NULL, 1, 'img/product/sm/5.jpg','img/product/md/5.jpg','img/product/lg/5.jpg'),
(NULL, 2, 'img/product/sm/6.jpg','img/product/md/6.jpg','img/product/lg/6.jpg'),
(NULL, 2, 'img/product/sm/7.jpg','img/product/md/7.jpg','img/product/lg/7.jpg'),
(NULL, 2, 'img/product/sm/8.jpg','img/product/md/8.jpg','img/product/lg/8.jpg'),
(NULL, 2, 'img/product/sm/9.jpg','img/product/md/9.jpg','img/product/lg/9.jpg'),
(NULL, 3, 'img/product/sm/10.jpg','img/product/md/10.jpg','img/product/lg/10.jpg'),
(NULL, 3, 'img/product/sm/11.jpg','img/product/md/11.jpg','img/product/lg/11.jpg'),
(NULL, 3, 'img/product/sm/12.jpg','img/product/md/12.jpg','img/product/lg/12.jpg'),
(NULL, 3, 'img/product/sm/13.jpg','img/product/md/13.jpg','img/product/lg/13.jpg'),
(NULL, 4, 'img/product/sm/14.jpg','img/product/md/14.jpg','img/product/lg/14.jpg'),
(NULL, 4, 'img/product/sm/15.jpg','img/product/md/15.jpg','img/product/lg/15.jpg'),
(NULL, 4, 'img/product/sm/16.jpg','img/product/md/16.jpg','img/product/lg/16.jpg'),
(NULL, 4, 'img/product/sm/17.jpg','img/product/md/17.jpg','img/product/lg/17.jpg'),
(NULL, 5, 'img/product/sm/18.jpg','img/product/md/18.jpg','img/product/lg/18.jpg'),
(NULL, 5, 'img/product/sm/19.jpg','img/product/md/19.jpg','img/product/lg/19.jpg'),
(NULL, 5, 'img/product/sm/20.jpg','img/product/md/20.jpg','img/product/lg/20.jpg'),
(NULL, 5, 'img/product/sm/21.jpg','img/product/md/21.jpg','img/product/lg/21.jpg'),
(NULL, 6, 'img/product/sm/22.jpg','img/product/md/22.jpg','img/product/lg/22.jpg'),
(NULL, 6, 'img/product/sm/23.jpg','img/product/md/23.jpg','img/product/lg/23.jpg'),
(NULL, 6, 'img/product/sm/24.jpg','img/product/md/24.jpg','img/product/lg/24.jpg'),
(NULL, 6, 'img/product/sm/25.jpg','img/product/md/25.jpg','img/product/lg/25.jpg'),
(NULL, 6, 'img/product/sm/26.jpg','img/product/md/26.jpg','img/product/lg/26.jpg'),
(NULL, 7, 'img/product/sm/27.jpg','img/product/md/27.jpg','img/product/lg/27.jpg'),
(NULL, 7, 'img/product/sm/28.jpg','img/product/md/28.jpg','img/product/lg/28.jpg'),
(NULL, 7, 'img/product/sm/29.jpg','img/product/md/29.jpg','img/product/lg/29.jpg'),
(NULL, 7, 'img/product/sm/30.jpg','img/product/md/30.jpg','img/product/lg/30.jpg'),
(NULL, 7, 'img/product/sm/31.jpg','img/product/md/31.jpg','img/product/lg/31.jpg'),
(NULL, 7, 'img/product/sm/32.jpg','img/product/md/32.jpg','img/product/lg/32.jpg'),
(NULL, 8, 'img/product/sm/33.jpg','img/product/md/33.jpg','img/product/lg/33.jpg'),
(NULL, 8, 'img/product/sm/34.jpg','img/product/md/34.jpg','img/product/lg/34.jpg'),
(NULL, 8, 'img/product/sm/35.jpg','img/product/md/35.jpg','img/product/lg/35.jpg'),
(NULL, 8, 'img/product/sm/36.jpg','img/product/md/36.jpg','img/product/lg/36.jpg'),
(NULL, 8, 'img/product/sm/37.jpg','img/product/md/37.jpg','img/product/lg/37.jpg'),
(NULL, 9, 'img/product/sm/38.jpg','img/product/md/38.jpg','img/product/lg/38.jpg'),
(NULL, 9, 'img/product/sm/39.jpg','img/product/md/39.jpg','img/product/lg/39.jpg'),
(NULL, 9, 'img/product/sm/40.jpg','img/product/md/40.jpg','img/product/lg/40.jpg'),
(NULL, 9, 'img/product/sm/41.jpg','img/product/md/41.jpg','img/product/lg/41.jpg'),
(NULL, 10, 'img/product/sm/42.jpg','img/product/md/42.jpg','img/product/lg/42.jpg'),
(NULL, 10, 'img/product/sm/43.jpg','img/product/md/43.jpg','img/product/lg/43.jpg'),
(NULL, 10, 'img/product/sm/44.jpg','img/product/md/44.jpg','img/product/lg/44.jpg'),
(NULL, 10, 'img/product/sm/45.jpg','img/product/md/45.jpg','img/product/lg/45.jpg'),
(NULL, 10, 'img/product/sm/46.jpg','img/product/md/46.jpg','img/product/lg/46.jpg'),
(NULL, 11, 'img/product/sm/47.jpg','img/product/md/47.jpg','img/product/lg/47.jpg'),
(NULL, 11, 'img/product/sm/48.jpg','img/product/md/48.jpg','img/product/lg/48.jpg'),
(NULL, 11, 'img/product/sm/49.jpg','img/product/md/49.jpg','img/product/lg/49.jpg'),
(NULL, 11, 'img/product/sm/50.jpg','img/product/md/50.jpg','img/product/lg/50.jpg'),
(NULL, 12, 'img/product/sm/51.jpg','img/product/md/51.jpg','img/product/lg/51.jpg'),
(NULL, 12, 'img/product/sm/52.jpg','img/product/md/52.jpg','img/product/lg/52.jpg'),
(NULL, 12, 'img/product/sm/53.jpg','img/product/md/53.jpg','img/product/lg/53.jpg'),
(NULL, 13, 'img/product/sm/54.jpg','img/product/md/54.jpg','img/product/lg/54.jpg'),
(NULL, 13, 'img/product/sm/55.jpg','img/product/md/55.jpg','img/product/lg/55.jpg'),
(NULL, 13, 'img/product/sm/56.jpg','img/product/md/56.jpg','img/product/lg/56.jpg'),
(NULL, 13, 'img/product/sm/57.jpg','img/product/md/57.jpg','img/product/lg/57.jpg'),
(NULL, 13, 'img/product/sm/58.jpg','img/product/md/58.jpg','img/product/lg/58.jpg'),
(NULL, 14, 'img/product/sm/59.jpg','img/product/md/59.jpg','img/product/lg/59.jpg'),
(NULL, 14, 'img/product/sm/60.jpg','img/product/md/60.jpg','img/product/lg/60.jpg'),
(NULL, 14, 'img/product/sm/61.jpg','img/product/md/61.jpg','img/product/lg/61.jpg'),
(NULL, 14, 'img/product/sm/62.jpg','img/product/md/62.jpg','img/product/lg/62.jpg'),
(NULL, 15, 'img/product/sm/1.jpg','img/product/md/1.jpg','img/product/lg/1.jpg'),
(NULL, 15, 'img/product/sm/2.jpg','img/product/md/2.jpg','img/product/lg/2.jpg'),
(NULL, 15, 'img/product/sm/3.jpg','img/product/md/3.jpg','img/product/lg/3.jpg'),
(NULL, 15, 'img/product/sm/4.jpg','img/product/md/4.jpg','img/product/lg/4.jpg'),
(NULL, 15, 'img/product/sm/5.jpg','img/product/md/5.jpg','img/product/lg/5.jpg'),
(NULL, 16, 'img/product/sm/6.jpg','img/product/md/6.jpg','img/product/lg/6.jpg'),
(NULL, 16, 'img/product/sm/7.jpg','img/product/md/7.jpg','img/product/lg/7.jpg'),
(NULL, 16, 'img/product/sm/8.jpg','img/product/md/8.jpg','img/product/lg/8.jpg'),
(NULL, 16, 'img/product/sm/9.jpg','img/product/md/9.jpg','img/product/lg/9.jpg'),
(NULL, 17, 'img/product/sm/10.jpg','img/product/md/10.jpg','img/product/lg/10.jpg'),
(NULL, 17, 'img/product/sm/11.jpg','img/product/md/11.jpg','img/product/lg/11.jpg'),
(NULL, 17, 'img/product/sm/12.jpg','img/product/md/12.jpg','img/product/lg/12.jpg'),
(NULL, 17, 'img/product/sm/13.jpg','img/product/md/13.jpg','img/product/lg/13.jpg'),
(NULL, 18, 'img/product/sm/14.jpg','img/product/md/14.jpg','img/product/lg/14.jpg'),
(NULL, 18, 'img/product/sm/15.jpg','img/product/md/15.jpg','img/product/lg/15.jpg'),
(NULL, 18, 'img/product/sm/16.jpg','img/product/md/16.jpg','img/product/lg/16.jpg'),
(NULL, 18, 'img/product/sm/17.jpg','img/product/md/17.jpg','img/product/lg/17.jpg'),
(NULL, 19, 'img/product/sm/18.jpg','img/product/md/18.jpg','img/product/lg/18.jpg'),
(NULL, 19, 'img/product/sm/19.jpg','img/product/md/19.jpg','img/product/lg/19.jpg'),
(NULL, 19, 'img/product/sm/20.jpg','img/product/md/20.jpg','img/product/lg/20.jpg'),
(NULL, 19, 'img/product/sm/21.jpg','img/product/md/21.jpg','img/product/lg/21.jpg'),
(NULL, 19, 'img/product/sm/22.jpg','img/product/md/22.jpg','img/product/lg/22.jpg'),
(NULL, 19, 'img/product/sm/23.jpg','img/product/md/23.jpg','img/product/lg/23.jpg'),
(NULL, 19, 'img/product/sm/24.jpg','img/product/md/24.jpg','img/product/lg/24.jpg'),
(NULL, 19, 'img/product/sm/25.jpg','img/product/md/25.jpg','img/product/lg/25.jpg'),
(NULL, 19, 'img/product/sm/26.jpg','img/product/md/26.jpg','img/product/lg/26.jpg'),
(NULL, 20, 'img/product/sm/27.jpg','img/product/md/27.jpg','img/product/lg/27.jpg'),
(NULL, 20, 'img/product/sm/28.jpg','img/product/md/28.jpg','img/product/lg/28.jpg'),
(NULL, 20, 'img/product/sm/29.jpg','img/product/md/29.jpg','img/product/lg/29.jpg'),
(NULL, 20, 'img/product/sm/30.jpg','img/product/md/30.jpg','img/product/lg/30.jpg'),
(NULL, 20, 'img/product/sm/31.jpg','img/product/md/31.jpg','img/product/lg/31.jpg'),
(NULL, 20, 'img/product/sm/32.jpg','img/product/md/32.jpg','img/product/lg/32.jpg'),
(NULL, 21, 'img/product/sm/33.jpg','img/product/md/33.jpg','img/product/lg/33.jpg'),
(NULL, 21, 'img/product/sm/34.jpg','img/product/md/34.jpg','img/product/lg/34.jpg'),
(NULL, 21, 'img/product/sm/35.jpg','img/product/md/35.jpg','img/product/lg/35.jpg'),
(NULL, 21, 'img/product/sm/36.jpg','img/product/md/36.jpg','img/product/lg/36.jpg'),
(NULL, 21, 'img/product/sm/37.jpg','img/product/md/37.jpg','img/product/lg/37.jpg'),
(NULL, 22, 'img/product/sm/38.jpg','img/product/md/38.jpg','img/product/lg/38.jpg'),
(NULL, 22, 'img/product/sm/39.jpg','img/product/md/39.jpg','img/product/lg/39.jpg'),
(NULL, 22, 'img/product/sm/40.jpg','img/product/md/40.jpg','img/product/lg/40.jpg'),
(NULL, 22, 'img/product/sm/41.jpg','img/product/md/41.jpg','img/product/lg/41.jpg'),
(NULL, 23, 'img/product/sm/42.jpg','img/product/md/42.jpg','img/product/lg/42.jpg'),
(NULL, 23, 'img/product/sm/43.jpg','img/product/md/43.jpg','img/product/lg/43.jpg'),
(NULL, 23, 'img/product/sm/44.jpg','img/product/md/44.jpg','img/product/lg/44.jpg'),
(NULL, 23, 'img/product/sm/45.jpg','img/product/md/45.jpg','img/product/lg/45.jpg'),
(NULL, 23, 'img/product/sm/46.jpg','img/product/md/46.jpg','img/product/lg/46.jpg');



/*用户信息*/
CREATE TABLE hl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),

	avatar VARCHAR(128),			#头像图片路径
	user_name VARCHAR(32),		#用户名，如王小明
	gender INT								#性别 0-女
);
INSERT INTO hl_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/*收货地址信息*/
CREATE TABLE hl_receiver_address(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,									#用户编号
	receiver VARCHAR(16),					#接收人姓名
	province	VARCHAR(16),				#省
	city VARCHAR(16),							#市
	county VARCHAR(16),						#县
	address VARCHAR(128),					#详细地址
	cellphone VARCHAR(16),				#手机
	fixedphone VARCHAR(16),				#固定电话
	postcode	CHAR(6),						#邮编
	tag VARCHAR(16),							#标签名

	is_default BOOLEAN						#是否为当前用户的默认收货地址
);

/*购物车条目*/
CREATE TABLE hl_shoppingcart_item(
	iid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,						#用户编号
	product_id INT,					#商品编号
	count INT,							#购买数量
	is_checked BOOLEAN			#是否已勾选，确定购买
);

/*用户订单*/
CREATE TABLE hl_order(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	address_id INT,
	status INT,									#订单状态	1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
	order_time BIGINT,					#下单时间
	pay_time BIGINT,						#付款时间
	deliver_time BIGINT,				#发货时间
	received_time BIGINT				#签收时间
)AUTO_INCREMENT=10000000;

/*用户订单*/
CREATE TABLE hl_order_detail(
	did INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT,							#订单编号
	product_id INT,						#产品编号
	count	INT									#购买数量
);

/*首页轮播广告商品*/
CREATE TABLE hl_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	href VARCHAR(128)
);
/****首页轮播广告商品****/
INSERT INTO hl_index_carousel VALUES
(NULL, 'img/bnr1.jpg','轮播广告商品1','product-details.html?lid=1'),
(NULL, 'img/bnr2.png','轮播广告商品2','product-details.html?lid=2'),
(NULL, 'img/bnr3.jpg','轮播广告商品3','product-details.html?lid=3'),
(NULL, 'img/bnr4.jpg','轮播广告商品4','product-details.html?lid=4'); 


/*首页商品*/
CREATE TABLE hl_index_product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(64),
	details VARCHAR(128),
	pic VARCHAR(128),
	price DECIMAL(8,2),
	href VARCHAR(128),
	seq_recommended TINYINT,
	seq_new_arrival TINYINT,
	seq_top_sale TINYINT
);
INSERT INTO hl_index_product VALUES
(NULL, '自然堂护肤系列', '自然堂（CHANDO）凝时鲜颜水乳套装（冰肌水+乳液+洁面+凝时三件套）（化妆品套装）', 'img/index/1.png', 588, 'product-details.html?lid=1', 1, 1, 1),
(NULL, '丹姿水密码系列', '水密码清新水润护肤礼盒（洗面奶+水+乳液+面膜）补水保湿 化妆品套装 新老包装随机发货', 'img/index/2.png', 288, 'product-details.html?lid=10', 2, 2, 2),
(NULL, '百雀羚系列', '百雀羚 肌初赋活致臻套装（紧肤水90ml+紧肤乳90ml+抗皱霜50g+肌初眼霜15g+化妆包+化妆棉）', 'img/index/3.png',399, 'product-details.html?lid=5', 3, 3, 3),
(NULL, '相宜本草系列', '相宜本草四倍护肤套装洗面奶爽肤水乳液补水霜化妆品', 'img/index/4.png', 266, 'product-details.html?lid=9', 4, 4, 4),
(NULL, '韩束系列', '韩束 红石榴倍润滋养护肤六件套 洗面奶爽肤水乳液眼霜面霜bb霜 补水保湿鲜活 ', 'img/index/5.png', 299, 'product-details.html?lid=6', 5, 5, 5),
(NULL, '艾璐卡系列', '红石榴倍润滋养护肤六件套 洗面奶爽肤水乳液眼霜面霜bb霜 补水保湿鲜活', 'img/index/6.png', 599, 'product-details.html?lid=7', 6, 6, 6),
(NULL, '墨菊系列', '红石榴倍润滋养护肤六件套 洗面奶爽肤水乳液眼霜面霜bb霜 补水保湿鲜活', 'img/index/7.png', 359, 'product-details.html?lid=8', 0, 0, 0);



