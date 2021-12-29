/*
MySQL Data Transfer
Source Host: localhost
Source Database: music
Target Host: localhost
Target Database: music
Date: 2016/12/7 15:59:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `pwd` varchar(32) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
CREATE TABLE `comments` (
  `id` int(5) NOT NULL auto_increment,
  `value` text,
  `name` varchar(20) default NULL,
  `music_id` int(4) default NULL,
  `time` varchar(13) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for music
-- ----------------------------
CREATE TABLE `music` (
  `id` int(6) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `singer` varchar(30) NOT NULL,
  `special` varchar(30) NOT NULL,
  `value` text NOT NULL,
  `time` varchar(13) NOT NULL,
  `click` int(5) NOT NULL,
  `url` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tip
-- ----------------------------
CREATE TABLE `tip` (
  `id` int(5) NOT NULL auto_increment,
  `value` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `pwd` varchar(32) default NULL,
  `music_box` longtext,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `admin` VALUES ('2', 'xumingkun', '5dd28178eb4a1245a0a3f404a6043062');
INSERT INTO `admin` VALUES ('3', 'zhangbin', '7bbec4976692f506de3527381e8083d5');
INSERT INTO `comments` VALUES ('2', '这首歌真的不错哦！顶一个', '游客', '12', '1338289865898');
INSERT INTO `comments` VALUES ('3', '阿斯蒂芬阿斯蒂芬啊啊啊', '11', '19', '1478359850679');
INSERT INTO `comments` VALUES ('4', '2', '2', '19', '1478360261192');
INSERT INTO `comments` VALUES ('5', '5', '5', '19', '1478360428366');
INSERT INTO `comments` VALUES ('6', '77', '77', '19', '1478360446042');
INSERT INTO `comments` VALUES ('7', '111', '11', '18', '1481096062202');
INSERT INTO `music` VALUES ('16', '红豆', '方大同', '红豆', '这是一首经典的歌曲，希望你们会喜欢！', '1338966811380', '2', 'upload\\201206069861.mp3');
INSERT INTO `music` VALUES ('18', 'Price Tag2', '无名', '未知', '听听看看啊！！！！！！！！', '1338968178161', '3', 'upload\\Jessie J - Price Tag.mp3');
INSERT INTO `music` VALUES ('19', 'Price Tag', 'Jessie J', '大英帝国', 'Price TagPrice Tag', '1478358625854', '7', 'upload\\Jessie J - Price Tag.mp3');
INSERT INTO `music` VALUES ('20', '日不落', '蔡依林', '日不落', '中国台湾省蔡依林中国台湾省蔡依林', '1478358716003', '4', 'upload\\ribuluo.mp3');
INSERT INTO `tip` VALUES ('22', '[包子] 分享了歌曲 [那些年]');
INSERT INTO `tip` VALUES ('23', '[王伟] 分享了歌曲 [至少还有你]');
INSERT INTO `tip` VALUES ('24', '[张彬] 分享了歌曲 [园丁之歌]');
INSERT INTO `tip` VALUES ('25', '[张彬] 分享了歌曲 [老师你好]');
INSERT INTO `tip` VALUES ('27', '[包子] 分享了歌曲 [告白]');
INSERT INTO `tip` VALUES ('28', '[包子] 分享了歌曲 [烟火]');
INSERT INTO `tip` VALUES ('29', '[王伟] 分享了歌曲 [红豆]');
INSERT INTO `tip` VALUES ('30', '[包子] 分享了歌曲 [红豆]');
INSERT INTO `tip` VALUES ('31', '[顾滢滢] 分享了歌曲 [不再问]');
INSERT INTO `tip` VALUES ('32', '[wangwu] 分享了歌曲 [Price Tag]');
INSERT INTO `tip` VALUES ('33', '[wangwu] 分享了歌曲 [日不落]');
INSERT INTO `user` VALUES ('18', '张彬', '7bbec4976692f506de3527381e8083d5', '12,9');
INSERT INTO `user` VALUES ('19', '顾滢滢', '5cd4227ca878ebccc75102f3fe2d2809', null);
INSERT INTO `user` VALUES ('20', 'wangwu', '9f001e4166cf26bfbdd3b4f67d9ef617', '19,20');
INSERT INTO `user` VALUES ('21', 'maliu', '4b0f02ddd51de24d6fc06587f1738b86', '19');
