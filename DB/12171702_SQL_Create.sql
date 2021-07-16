CREATE DATABASE `final` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
CREATE TABLE `board_table` (
  `board_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `readcount` int(11) NOT NULL,
  `timestamp` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE `computer_table` (
  `item_num` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `item_content` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `item_img` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `item_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE `mobile_table` (
  `item_num` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `item_content` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `item_img` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `item_count` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE `notice_table` (
  `notice_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `timestamp` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`notice_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE `user_table` (
  `user_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `phonenum` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_num`,`user_id`),
  UNIQUE KEY `user_num_UNIQUE` (`user_num`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
