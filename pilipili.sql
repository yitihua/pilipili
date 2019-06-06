/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : pilipili

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 06/06/2019 23:29:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` tinyblob NULL,
  `layer` int(11) NOT NULL,
  `level` bigint(20) NULL DEFAULT NULL,
  `author` bigint(20) NULL DEFAULT NULL,
  `father_comment` bigint(20) NULL DEFAULT NULL,
  `original` bigint(20) NULL DEFAULT NULL,
  `root_comment` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_5o3gedu0o11ixye4bka3dbhsb`(`author`) USING BTREE,
  INDEX `FK_q88p4wirm28ptjxcgp88rbihb`(`father_comment`) USING BTREE,
  INDEX `FK_g52m68amyltaufob1n473e5cp`(`original`) USING BTREE,
  INDEX `FK_8b15ry8eyciph1g3p0vesfm75`(`root_comment`) USING BTREE,
  CONSTRAINT `FK_5o3gedu0o11ixye4bka3dbhsb` FOREIGN KEY (`author`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_8b15ry8eyciph1g3p0vesfm75` FOREIGN KEY (`root_comment`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_g52m68amyltaufob1n473e5cp` FOREIGN KEY (`original`) REFERENCES `t_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_q88p4wirm28ptjxcgp88rbihb` FOREIGN KEY (`father_comment`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, '女', 0, '性别');
INSERT INTO `t_dict` VALUES (2, '男', 0, '性别');
INSERT INTO `t_dict` VALUES (3, '保密', 0, '性别');
INSERT INTO `t_dict` VALUES (4, '无', 0, '学历');
INSERT INTO `t_dict` VALUES (5, '小学', 0, '学历');
INSERT INTO `t_dict` VALUES (6, '初中', 0, '学历');
INSERT INTO `t_dict` VALUES (7, '高中', 0, '学历');
INSERT INTO `t_dict` VALUES (8, '大学及以上', 0, '学历');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_at` tinyblob NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` bigint(20) NULL DEFAULT NULL,
  `type` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_598uqt5jtjy1llmrvo69plld2`(`author`) USING BTREE,
  INDEX `FK_jiffpe1kcek1eug7p7b8nbjsu`(`type`) USING BTREE,
  CONSTRAINT `FK_598uqt5jtjy1llmrvo69plld2` FOREIGN KEY (`author`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_jiffpe1kcek1eug7p7b8nbjsu` FOREIGN KEY (`type`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (1, '<p>\r\n</p><h2>笔者写在前面的话</h2><blockquote><b><font color=\"#9053b9\">这是一篇观影前原创专稿，已于猫眼电影分为三篇文章首发，现在@X战警吧 微博和 X战警吧各发一份完整版。本文因通过物料分析，干货多，可能含有少量剧透，因本文创作于观影前，若有与电影正片不相符的地方，敬请见谅；</font></b></blockquote><blockquote><font color=\"#d24a35\"><b><font color=\"#9053b9\">转载前请得到作者许可，任何转载者不可以此盈利，违者必究！</font></b></font></blockquote><p></p><p></p><p></p><hr><p></p><h2>“狼叔”诞生记</h2><p img-box=\"img-box\"><img alt=\"金刚狼在大荧幕上首亮相。\" src=\"https://wx2.sinaimg.cn/large/006mvNlKgy1fd8ojz2t5vj30gs0b6t9c.jpg\"><span>金刚狼在大荧幕上首亮相。</span></p><p><font color=\"#000000\">80</font><font color=\"#000000\">年代至</font><font color=\"#000000\">90</font><font color=\"#000000\">年代，漫威陷入运营危机、背上巨大债务，并陆续卖出漫画角色改编权，缺钱又不想自己拍电影的漫威以此盈利（无论电影票房盈亏，漫威均赚百分之一，收益稳定：如电影票房大卖数十亿，漫威可以分一亿；如电影票房惨败，漫威也可赚钱，稳赚不赔）；</font></p><p><font color=\"#000000\">1994</font><font color=\"#000000\">年，</font><font color=\"#000000\">20</font><font color=\"#000000\">世纪福斯制片人劳伦</font><font color=\"#000000\">·</font><font color=\"#000000\">舒勒</font><font color=\"#000000\">·</font><font color=\"#000000\">唐纳买下了《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警》电影版权；</font></p><p><font color=\"#000000\">1999</font><font color=\"#000000\">年，福斯筹划多年的《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警》电影终于筹拍，</font>电影通过一个外部人视角为电影观众打开陌生世界的大门，<font color=\"#000000\">而这个“外部人”男一号角色却一直找不到合适的演员，第一人选罗素·克劳拒绝了邀请，另一人选多格雷·斯科特因《碟中谍</font><font color=\"#000000\">2</font><font color=\"#000000\">》档期相冲，放弃了这个角色。就这样，角色空缺到影片正式开拍三周后，</font>一个从未在美国拍过戏的澳洲男<font color=\"#000000\">演员</font>休·杰克曼来到剧组，在等待这天通告拍摄完成后，通过了导演布莱恩·辛格的试镜，成为最后被敲定的演员，顶着巨大的压力饰演了这个在漫画与动画均拥有无数粉丝的超级英雄——这个叫做“金刚狼”的暴躁浑球。</p><p img-box=\"img-box\"><img alt=\"1999年，休凭《奥克拉荷马》“库里”一角入围英国“奥利佛奖”年度最佳歌剧演员。\" src=\"https://wx2.sinaimg.cn/large/006mvNlKgy1fd8okrazdij309b0d7wf6.jpg\"><span>1999年，休凭《奥克拉荷马》“库里”一角入围英国“奥利佛奖”年度最佳歌剧演员。</span></p><p></p><p img-box=\"img-box\"><img alt=\"1999年，休•杰克曼首次试镜金刚狼，镜头外休对面的导演布莱恩•辛格为其搭词、说戏。\" src=\"https://wx4.sinaimg.cn/large/006mvNlKgy1fd8omkk1q5j30k80fj4a3.jpg\"><span>1999年，休•杰克曼首次试镜金刚狼，镜头外休对面的导演布莱恩•辛格为其搭词、说戏。</span></p><p>现实与漫画不同，既身高一米六、又能恰好诠释角色的演员打着灯笼也不好找，电影筹划之初，便放弃了金刚狼如他的原型“狼獾”那样粗短身板的漫画化设定，但外形英俊、高大挺拔的休·杰克曼仍由于紧张、不自信陷入了深深地自卑，即便是当时的福斯主席兼CEO汤姆·罗斯曼鼓励了他之后。十<font color=\"#333333\">七年后的今天，休·杰克曼袒露了心声：</font></p><blockquote><font color=\"#d49225\">&nbsp;“《X战警》是我在美国拍摄的第一部电影，我整个人没办法放松，超级紧张。我寂寂无名，没人说什么，但我想找个地缝钻进去。汤姆·罗斯曼约谈我，他说对我有信心，在镜头里有一刻从我身上看到了金刚狼。但看到我自己登上报纸，真心感觉黯淡无光。”</font></blockquote><p img-box=\"img-box\"><img alt=\"休•杰克曼在《X战警》饰演金刚狼的定妆照，致敬模仿《金刚狼》漫画经典封面。\" src=\"https://wx2.sinaimg.cn/large/006mvNlKgy1fd8q8gdfb9j30ql0hywiw.jpg\"><span>休•杰克曼在《X战警》饰演金刚狼的定妆照，致敬模仿《金刚狼》漫画经典封面。</span></p><p><br></p><p img-box=\"img-box\"><img alt=\"漫画中的金刚狼。\" src=\"https://wx4.sinaimg.cn/large/006mvNlKgy1fd8orpspncj30r60hotcd.jpg\"><span>漫画中的金刚狼。</span></p><p>深知自己外形不会被粉丝买账的休·杰克曼，为了贴近金刚狼角色形象，开始改变饮食规律，吃蛋白，并加强运动训练增肌，但他不知道的是这一训练就是将近十七年。每次饰演金刚狼前，都要提前严格饮食、有拍摄时健身两个半小时，没拍摄时健身一个小时，以此保持符合金刚狼的体型。</p><p img-box=\"img-box\"><img alt=\"17年来为贴近角色，每一次锻炼成金刚狼身材都是精神和肉体的双重考验。\" src=\"https://wx3.sinaimg.cn/large/006mvNlKgy1fd8osllxz5j30vw0paagm.jpg\"><span>17年来为贴近角色，每一次锻炼成金刚狼身材都是精神和肉体的双重考验。</span></p><p>为了符合“旧正史”三部曲首部电影中变种人刚被社会发现，\r\n \r\nX战警隐藏自我的世界观，电影中X战警的制服不采用漫画黄色和蓝色配色设定，改用帮助他们融入黑夜行动的耐用黑色皮衣制服。漫画创作者斯坦·李和克里斯·克莱蒙支持这一决策，克里斯·克莱蒙说：“画纸上可以那么做，可要是穿在真人身上，实在太诡异了。”</p><p img-box=\"img-box\"><img alt=\"金刚狼的漫画版制服VS电影版制服。\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8q9nv3l2j30sg0qe43e.jpg\"><span>金刚狼的漫画版制服VS电影版制服。</span></p><p><br></p><p img-box=\"img-box\"><img alt=\"《X战警》电影的破壳日：2000年7月14日\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8ovq04ykj30of0dq3ze.jpg\"><span>《X战警》电影的破壳日：2000年7月14日</span></p><p><font color=\"#000000\">2000</font><font color=\"#000000\">年</font><font color=\"#000000\">7</font><font color=\"#000000\">月</font><font color=\"#000000\">14</font><font color=\"#000000\">日，</font><font color=\"#000000\">21</font><font color=\"#000000\">世纪首部超级英雄漫画电影《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警》横空出世，它扭转</font><font color=\"#000000\">90</font><font color=\"#000000\">年代末超英电影走向低龄、庸俗化的恶化局面，带领超英电影从低谷中走了出来，《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警》首部电影的成功，点燃了其他漫威漫画电影的拍摄。</font></p><p><font color=\"#000000\">随着</font><font color=\"#000000\">2002</font><font color=\"#000000\">年《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警</font><font color=\"#000000\">2</font><font color=\"#000000\">》作为佳作被列入超英电影</font>教科书，导演布莱恩·辛格坐稳了“超英电影教父”的位置，休·杰克曼更是成为了影迷心目中独一无二的“狼叔”，许多影迷因对《X战警》电影的热忱，转战入坑漫威漫画《X战警》原作，成为了忠实的漫画粉丝。</p><p img-box=\"img-box\"><img alt=\"“旧正史”三部曲的狼叔。\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8owtsgmpj30y90eitc6.jpg\"><span>“旧正史”三部曲的狼叔。</span></p><p>随着布莱恩·辛格卸任导演职位，前去华纳“救火”拍摄《超人归来》，而这边福斯工作室马不停蹄的打造了“狼叔”为主角的两部电影，2006年电影《X战警：背水一战》及2009年“X战警起源”系列前传第一弹电影《金刚狼》。但两部电影的口碑都不是很理想：不愿扩展电影的“宇宙线索”、不敢挖掘漫画内核本质、不想碰触金刚狼角色的黑暗史、造成角色OOC等成为批评的主要原因，大家害怕自己喜欢的《X战警》电影系列躺在功劳簿上，被过去的荣誉冲昏头脑。</p><p>然，力挺的粉丝也不在少数，由于喜好不同，粉丝之间为此争执数年，直到今天也没有休止。大家常常在争论中，忘记了喜恶之间并没有绝对的“对“与绝对的“错”，忘记了大家共同喜爱的《X战警》中传达的理念：每个人都是不同的，我们要求同存异，尊重差异性。</p><p></p><hr><p></p><h2>“狼叔”独立电影的挫败</h2><p img-box=\"img-box\"><img alt=\"2009年3月31日，《金刚狼》全片盗版泄漏事件，成为好莱坞史上最严重的盗版案。\" src=\"https://wx3.sinaimg.cn/large/006mvNlKgy1fd8oyrlp0rj30sg0iz417.jpg\"><span>2009年3月31日，《金刚狼》全片盗版泄漏事件，成为好莱坞史上最严重的盗版案。</span></p><p>不愿只赚百分之一蝇头小利的漫威影业于2008年推出《钢铁侠》《无敌浩克》，展开漫威电影宇宙（MCU）长线计划；2009年<font color=\"#000000\">迪斯尼收购漫威影业，加强了在各大影业角色改编版权的回收力度；</font></p><p>福斯影业越挫越勇，同在2009年，<font color=\"#000000\">福斯制片人劳伦</font><font color=\"#000000\">·</font><font color=\"#000000\">舒勒</font><font color=\"#000000\">·</font><font color=\"#000000\">唐纳</font>公布了<font color=\"#000000\">《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警：第一战》《万磁王》《《金刚狼</font><font color=\"#000000\">2</font><font color=\"#000000\">》《死侍》《新变种人》《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警</font><font color=\"#000000\">4</font><font color=\"#000000\">》多部电影的筹划。</font></p><p>随着“X战警起源”系列前传第二弹《万磁王》计划并入《X战警：第一战》项目，福斯决定从《第一战》这个全新的前传故事开始，重新规划X战警电影系列。演员换血年轻化，而演员唯独不变的是“狼叔”休杰克曼，像轴心一样牵连着不同时间点“前传”系列与“正传”的关系。</p><p>2011年狼叔客串的《X战警：第一战》上映；同年，<font color=\"#000000\">詹姆斯</font><font color=\"#000000\">·</font><font color=\"#000000\">曼高德确定指导《金刚狼</font><font color=\"#000000\">2</font><font color=\"#000000\">》。</font></p><p img-box=\"img-box\"><img alt=\"狼叔客串《X战警：第一战》。\" src=\"https://wx2.sinaimg.cn/large/006mvNlKgy1fd8p1858lmj30q40fkdj1.jpg\"><span>狼叔客串《X战警：第一战》。</span></p><p><br></p><p img-box=\"img-box\"><img alt=\"2011年3月开机的《金刚狼2》剧本惨遭泄露。\" src=\"https://wx3.sinaimg.cn/large/006mvNlKgy1fd8p2hkvvbj31kw2ca4jv.jpg\"><span>2011年3月开机的《金刚狼2》剧本惨遭泄露。</span></p><p>2010年，<font color=\"#000000\">原定于</font><font color=\"#000000\">2011</font><font color=\"#000000\">年</font><font color=\"#000000\">3</font><font color=\"#000000\">月开机的《金刚狼</font><font color=\"#000000\">2</font><font color=\"#000000\">》剧本惨遭泄露，流传网络，原导演达伦</font><font color=\"#000000\">·</font><font color=\"#000000\">阿罗诺夫斯基卸任；</font><font color=\"#000000\">2011</font><font color=\"#000000\">年，詹姆斯</font><font color=\"#000000\">·</font><font color=\"#000000\">曼高德上任导演，应福斯要求重择编剧、重写剧本。</font></p><p></p><hr><p></p><h2>软重启后的“狼叔”</h2><p>在2013年《金刚狼2》顺利上映后，以“时间旅行”题材的《X战警：逆转未来》作为最后一部“旧史”电影，巧妙成为了《X战警：第一战》及《X战警：背水一战》《金刚狼2》的双续集。金刚狼穿越回了1973年过去自己的身体中，影响了1973年的世界，改写了历史，从此《X战警》“旧正史”三部曲及《金刚狼》《金刚狼2》两部电影的连续性主线剧情均被删除。</p><p img-box=\"img-box\"><img alt=\"从狼叔角度看X战警电影时间线。（注：新旧史设定不同，便于新入坑理解，故此标注）\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8p4yt8a3j30no1is17o.jpg\"><span>从狼叔角度看X战警电影时间线。（注：新旧史设定不同，便于新入坑理解，故此标注）</span></p><p>在“@<b>X战警吧 </b>”微博主页“<b>搜索我的微博</b>”搜索“<b>倒计时</b>”，大家能看到迄今为止电影版金刚狼全部时间线，对时间线、剧情、细节不清楚的请搜索。（只拿官方物料证据讲话，绝不伪科普）。</p><p img-box=\"img-box\"><img alt=\"看X战警电影时间线全貌。\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8papb7enj30su0lqn4l.jpg\"><span>看X战警电影时间线全貌。</span></p><p>2016年，《X战警：天启》为今年上映的《金刚狼3：殊死一战》 补全了更加还原漫画设定的 “X武器”逃逸的新史历史，《金刚狼3》作为一部粉丝期待已久的金刚狼电影，真正挖掘漫画的内核，碰触金刚狼角色的黑暗史，不给休·杰克曼版金刚狼的告别之作留有任何遗憾。</p><p img-box=\"img-box\"><img alt=\"新史中，“X武器”逃逸前，小琴为他找回了理性和部分记忆，也提前二十年相遇缘分。\" src=\"https://wx2.sinaimg.cn/large/006mvNlKgy1fd8pe3d0omj30xb0m6tbl.jpg\"><span>新史中，“X武器”逃逸前，小琴为他找回了理性和部分记忆，也提前二十年相遇缘分。</span></p><h2></h2><hr><h2>《金刚狼3：殊死一战》故事背景</h2><p><font color=\"#000000\">影片故事设定在《</font><font color=\"#000000\">X</font><font color=\"#000000\">战警：逆转未来》片尾未来六年后的</font><font color=\"#000000\">2029</font><font color=\"#000000\">年，变种人种族多年没有新生儿，罗根也变得疲惫不堪，能力退化，无法迅速自愈。在</font><font color=\"#000000\">X</font><font color=\"#000000\">战警荡然无存的日子里，罗根隐姓埋名沦落到墨西哥边境，边以豪华轿车司机为职业赚钱，边照顾年迈的“</font><font color=\"#000000\">X</font><font color=\"#000000\">教授”查尔斯</font>·<font color=\"#000000\">泽维尔，然而一个名叫劳拉的变种女孩闯入了罗根的生活， 他不得不与劳拉、</font><font color=\"#000000\">X</font><font color=\"#000000\">教授踏上公路旅程，逃避反派组织“掠夺者”的追杀。</font></p><p img-box=\"img-box\"><img alt=\"各个时间点的金刚狼与X教授。\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8qadiu99j30sg0sgdmb.jpg\"><span>各个时间点的金刚狼与X教授。</span></p><p></p><blockquote><font color=\"#d49225\">导演</font><font color=\"#000000\"><font color=\"#d49225\">詹姆斯</font></font><font color=\"#000000\"><font color=\"#d49225\">·</font></font><font color=\"#000000\"><font color=\"#d49225\">曼高德说</font></font><font color=\"#000000\"><font color=\"#d49225\">：“本片已经经历了《逆转未来》的尾声戏，由于独立性很强，为了影片不受前面拍过电影的约束，把时间点设置在更遥远一些的未来。”</font></font></blockquote><p></p><hr><h2>借鉴电影</h2><p><font color=\"#000000\">《金刚狼</font><font color=\"#000000\">3</font><font color=\"#000000\">：殊死一战》的导演詹姆斯·曼高德承认电影不仅从漫画《守望者》中获得灵感，还汲取了许多优秀的西部片和公路片的养分，如《不可饶恕》《原野奇侠》《阳光小美女》《少棒闯天下》《纸月亮》《铁手套》《牛仔》《摔跤王》等。</font></p><p img-box=\"img-box\"><img alt=\"《金刚狼3：殊死一战》就像是《金刚狼2》现实强化版。\" src=\"https://wx1.sinaimg.cn/large/006mvNlKgy1fd8pz1q3i6j30sg0sgdls.jpg\"><span>《金刚狼3：殊死一战》就像是《金刚狼2》现实强化版。</span></p><p></p><hr><p></p><h2>《金刚狼3：殊死一战》漫画蓝本</h2><p>正如2014年《X战警：逆转未来》宣传期及2015年SDCC上，休·杰克曼公布电影会将<font color=\"#000000\">马克</font><font color=\"#000000\">·</font><font color=\"#000000\">米勒</font><font color=\"#000000\">2008</font><font color=\"#000000\">年的</font>经典漫画《暮狼寻乡》做基础蓝本。<font color=\"#000000\">该片的确拥有许多漫画</font>《暮狼寻乡》的<font color=\"#000000\">元素，同时也能看到《金刚狼之死》、《失落的纯真》《目标</font><font color=\"#000000\">X</font><font color=\"#000000\">》的元素，以下一一列举。</font></p><p><b>拥有漫画《暮狼寻乡》的元素：</b></p><p>☑西部公路风格；</p><p>☑<font color=\"#000000\">变种人不再诞生；</font></p><p>☑<font color=\"#000000\">罗根受着反派势力的压迫；</font></p><p>☑<font color=\"#000000\">罗根自愈能力衰退成为老汉；</font></p><p>☑<font color=\"#000000\">罗根隐居且需要赚钱养家，他有家人需要照顾；</font></p><p>☑罗根与<font color=\"#000000\">年迈的老友踏上公路旅程寻找自我；</font></p><p>☑罗根与老友<font color=\"#000000\">被一大波反派追踪攻击；</font></p><p>☑<font color=\"#000000\">罗根需要直视自己不想提的过去；</font></p><p>☑有一段令人震惊的过去造成现在的未来；</p><p>☑<font color=\"#000000\">点燃罗根生命新意义的孩子。</font></p>\r\n\r\n', 0xACED00057372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E3060615282E3084A78078, NULL, '落幕，休•杰克曼最后被称为“狼叔”的日子', 1, 2);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', 0);
INSERT INTO `t_role` VALUES (2, 'user', 0);
INSERT INTO `t_role` VALUES (3, 'guest', 0);

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eng_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '动画', 'animation');
INSERT INTO `t_type` VALUES (2, '影视', 'film');
INSERT INTO `t_type` VALUES (3, '音乐', 'music');
INSERT INTO `t_type` VALUES (4, '舞蹈', 'dance');
INSERT INTO `t_type` VALUES (5, '游戏', 'game');
INSERT INTO `t_type` VALUES (6, '科技', 'tech');
INSERT INTO `t_type` VALUES (7, '数码', 'digital');
INSERT INTO `t_type` VALUES (8, '生活', 'life');
INSERT INTO `t_type` VALUES (9, '美食', 'food');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_at` tinyblob NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `education` bigint(20) NULL DEFAULT NULL,
  `gender` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_jhib4legehrm4yscx9t3lirqi`(`username`) USING BTREE,
  INDEX `FK_fugfays187dqh1x4qm8l8xxj`(`education`) USING BTREE,
  INDEX `FK_cicyfsxs4lgxsro3ciaje0vg2`(`gender`) USING BTREE,
  CONSTRAINT `FK_cicyfsxs4lgxsro3ciaje0vg2` FOREIGN KEY (`gender`) REFERENCES `t_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fugfays187dqh1x4qm8l8xxj` FOREIGN KEY (`education`) REFERENCES `t_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, NULL, 0xACED00057372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E306061022063AF2F14078, 'df655ad8d3229f3269fad2a8bab59b6c', 'admin', 8, 3);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_4uvv76e86ms8ru0kk9s01d3s2`(`role_id`) USING BTREE,
  CONSTRAINT `FK_4uvv76e86ms8ru0kk9s01d3s2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_kefwen29p9h9ilvry31mgyc94` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;
