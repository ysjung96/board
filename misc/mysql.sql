CREATE DATABASE `insight` DEFAULT CHARACTER SET utf8;

CREATE TABLE `t_board` (
  `board_idx` int(10) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `title` varchar(300) NOT NULL COMMENT '제목',
  `contents` text NOT NULL COMMENT '내용',
  `hit_cnt` smallint(10) NOT NULL DEFAULT '0' COMMENT '조회수',
  `created_datetime` datetime NOT NULL COMMENT '작성시간',
  `creator_id` varchar(50) NOT NULL COMMENT '작성자',
  `updated_datetime` datetime DEFAULT NULL COMMENT '수정시간',
  `updater_id` varchar(50) DEFAULT NULL COMMENT '수정자',
  `deleted_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_file` (
  `idx` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `board_idx` int(10) unsigned NOT NULL COMMENT '글번호',
  `original_file_name` varchar(255) NOT NULL COMMENT '원본파일이름',
  `stored_file_path` varchar(500) NOT NULL COMMENT '파일저장경로',
  `file_size` int(15) unsigned NOT NULL COMMENT '파일크기',
  `creator_id` varchar(50) NOT NULL COMMENT '작성자',
  `created_datetime` datetime NOT NULL COMMENT '작성시간',
  `updater_id` varchar(50) DEFAULT NULL COMMENT '수정자',
  `updated_datetime` datetime DEFAULT NULL COMMENT '수정시간',
  `deleted_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_jpa_board` (
  `board_idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(255) NOT NULL,
  `hit_cnt` int(11) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `creator_id` varchar(255) NOT NULL,  
  `updated_datetime` datetime DEFAULT NULL,
  `updater_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_jpa_file` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `board_idx` int(11) DEFAULT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `stored_file_path` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `creator_id` varchar(255) NOT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `updater_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK1` (`board_idx`),
  CONSTRAINT `FK1` FOREIGN KEY (`board_idx`) REFERENCES `t_jpa_board` (`board_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
