/*
SQLyog Community v12.5.0 (32 bit)
MySQL - 5.6.17 : Database - admin_hub
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admin_hub` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `admin_hub`;

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `ByUser` varchar(200) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL,
  `Tablename` varchar(200) DEFAULT NULL,
  `EventTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `m00_admin_login` */

DROP TABLE IF EXISTS `m00_admin_login`;

CREATE TABLE `m00_admin_login` (
  `m00_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `m00_username` varchar(200) DEFAULT NULL,
  `m00_password` varchar(200) DEFAULT NULL,
  `m00_pinpassword` varchar(200) DEFAULT NULL,
  `m00_admin_type` enum('admin') DEFAULT NULL,
  `m00_admin_status` int(2) DEFAULT NULL,
  KEY `m00_login_id` (`m00_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `m00_setconfig` */

DROP TABLE IF EXISTS `m00_setconfig`;

CREATE TABLE `m00_setconfig` (
  `m00_id` int(11) NOT NULL AUTO_INCREMENT,
  `m00_name` varchar(2000) NOT NULL,
  `m00_value` varchar(2000) NOT NULL,
  `m00_desc` varchar(200) DEFAULT NULL,
  `m00_disable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`m00_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `m01_bank` */

DROP TABLE IF EXISTS `m01_bank`;

CREATE TABLE `m01_bank` (
  `m_bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_bank_name` varchar(70) NOT NULL,
  `m_bank_status` int(2) NOT NULL,
  PRIMARY KEY (`m_bank_id`),
  UNIQUE KEY `m_bank_name` (`m_bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Table structure for table `m02_location` */

DROP TABLE IF EXISTS `m02_location`;

CREATE TABLE `m02_location` (
  `m_loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_loc_name` varchar(30) NOT NULL,
  `m_parent_id` int(11) NOT NULL,
  `m_status` varchar(30) NOT NULL,
  PRIMARY KEY (`m_loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=latin1;

/*Table structure for table `m03_user_detail` */

DROP TABLE IF EXISTS `m03_user_detail`;

CREATE TABLE `m03_user_detail` (
  `or_m_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `or_m_user_id` varchar(40) DEFAULT NULL,
  `or_m_name` varchar(200) DEFAULT NULL,
  `or_m_intr_id` bigint(11) NOT NULL DEFAULT '0',
  `or_m_intr_name` varchar(200) DEFAULT '0',
  `or_m_dob` date DEFAULT NULL,
  `or_m_gurdian_name` varchar(200) DEFAULT NULL,
  `or_member_joining_date` date DEFAULT '0000-00-00',
  `or_m_email` varchar(200) DEFAULT NULL,
  `or_m_gender` varchar(20) DEFAULT '1',
  `or_m_designation` int(2) NOT NULL DEFAULT '0',
  `or_m_landline_no` varchar(20) DEFAULT NULL,
  `or_m_mobile_no` varchar(20) DEFAULT NULL,
  `or_m_address` varchar(500) DEFAULT NULL,
  `or_m_pincode` varchar(20) DEFAULT NULL,
  `or_m_country` int(11) DEFAULT '0',
  `or_m_state` int(11) NOT NULL DEFAULT '0',
  `or_m_userimage` text,
  `or_m_userimage2` varchar(100) DEFAULT NULL,
  `or_m_city` int(11) NOT NULL DEFAULT '0',
  `or_m_status` int(2) NOT NULL DEFAULT '0',
  `or_m_aff_id` int(11) NOT NULL DEFAULT '0',
  `or_m_upliner_id` int(11) NOT NULL DEFAULT '0',
  `or_m_position` varchar(20) DEFAULT NULL,
  `m_pin_id` int(11) NOT NULL DEFAULT '0',
  `m_topup_pin_id` int(11) NOT NULL DEFAULT '0',
  `or_m_regdate` datetime DEFAULT NULL,
  `or_m_topup_date` datetime DEFAULT NULL,
  `or_reg_from` int(11) DEFAULT NULL COMMENT '1-master,2-user,3-outer',
  PRIMARY KEY (`or_m_reg_id`),
  UNIQUE KEY `or_m_user_id` (`or_m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `m04_user_bank` */

DROP TABLE IF EXISTS `m04_user_bank`;

CREATE TABLE `m04_user_bank` (
  `or_m_bid` int(11) NOT NULL AUTO_INCREMENT,
  `or_m_id` int(11) DEFAULT NULL,
  `or_m_name` varchar(30) DEFAULT NULL,
  `or_m_b_ifscode` varchar(20) DEFAULT NULL,
  `or_m_b_imps` varchar(30) DEFAULT NULL,
  `or_m_b_cbsacno` varchar(20) DEFAULT NULL,
  `or_m_b_name` varchar(20) DEFAULT NULL,
  `or_m_b_branch` varchar(70) DEFAULT NULL,
  `or_m_b_pancard` varchar(20) DEFAULT NULL,
  `or_m_b_adhar` varchar(30) DEFAULT NULL,
  `or_m_b_image` varchar(110) DEFAULT NULL,
  `or_m_b_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`or_m_bid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `m05_user_nominee` */

DROP TABLE IF EXISTS `m05_user_nominee`;

CREATE TABLE `m05_user_nominee` (
  `or_m_nid` int(11) NOT NULL AUTO_INCREMENT,
  `or_m_id` bigint(11) DEFAULT NULL,
  `or_m_n_name` varchar(200) DEFAULT NULL,
  `or_m_n_age` int(11) DEFAULT NULL,
  `or_m_n_relation` varchar(200) DEFAULT NULL,
  `or_m_n_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`or_m_nid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `m06_currency_type` */

DROP TABLE IF EXISTS `m06_currency_type`;

CREATE TABLE `m06_currency_type` (
  `m6_id` int(11) NOT NULL AUTO_INCREMENT,
  `m6_name` varchar(100) DEFAULT NULL,
  `m6_description` varchar(100) DEFAULT NULL,
  `m6_status` int(1) DEFAULT '0' COMMENT '0Pending,1active,2inactive',
  `m6_type` int(1) DEFAULT '0' COMMENT '1Buy,2Sell',
  `m6_icon` varchar(50) DEFAULT NULL,
  `m6_account_number` varchar(100) DEFAULT NULL,
  `m6_account_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`m6_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `m07_currency_rate` */

DROP TABLE IF EXISTS `m07_currency_rate`;

CREATE TABLE `m07_currency_rate` (
  `m07_id` int(11) NOT NULL AUTO_INCREMENT,
  `m07_transaction_type` int(1) DEFAULT NULL COMMENT '1Buy,2Sell,3Exchange',
  `m07_currency` int(11) DEFAULT NULL,
  `m07_charge` double(10,2) DEFAULT NULL,
  `m07_date` datetime DEFAULT NULL,
  `m07_description` varchar(100) DEFAULT NULL,
  `m07_status` int(1) DEFAULT '0' COMMENT '1active,2Inactive',
  PRIMARY KEY (`m07_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `m08_transaction_type` */

DROP TABLE IF EXISTS `m08_transaction_type`;

CREATE TABLE `m08_transaction_type` (
  `m08_id` int(11) NOT NULL AUTO_INCREMENT,
  `m08_title` varchar(50) DEFAULT NULL,
  `m08_status` int(1) DEFAULT NULL COMMENT '1Active,2Inactive',
  `m08_description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`m08_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `m24_news` */

DROP TABLE IF EXISTS `m24_news`;

CREATE TABLE `m24_news` (
  `m_news_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_news_title` varchar(30) NOT NULL,
  `m_news_des` varchar(2500) NOT NULL,
  `m_news_status` int(2) NOT NULL,
  `m_affid` int(11) NOT NULL,
  `m_entrydate` datetime NOT NULL,
  PRIMARY KEY (`m_news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m25_events` */

DROP TABLE IF EXISTS `m25_events`;

CREATE TABLE `m25_events` (
  `m_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_event_name` varchar(200) NOT NULL,
  `m_event_images` text NOT NULL,
  `m_event_description` text NOT NULL,
  `m_events_status` int(2) NOT NULL,
  `m_affid` int(11) NOT NULL,
  `m_event_date` datetime NOT NULL,
  PRIMARY KEY (`m_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m31_rewards` */

DROP TABLE IF EXISTS `m31_rewards`;

CREATE TABLE `m31_rewards` (
  `m_rd_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_rd_point` decimal(10,2) DEFAULT NULL,
  `m_reward` varchar(500) DEFAULT NULL,
  `m_rd_day` int(11) DEFAULT NULL,
  `m_rd_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`m_rd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tr01_login` */

DROP TABLE IF EXISTS `tr01_login`;

CREATE TABLE `tr01_login` (
  `or_lid` int(11) NOT NULL AUTO_INCREMENT,
  `or_user_id` int(11) NOT NULL,
  `or_login_id` varchar(110) NOT NULL,
  `or_login_pwd` varchar(100) NOT NULL,
  `or_pin_pwd` varchar(100) NOT NULL,
  `or_bitcoin_address` varchar(100) DEFAULT '0',
  `or_last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `or_last_logout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `or_login_count` int(11) NOT NULL,
  `or_login_type` int(2) NOT NULL,
  `or_user_type` int(1) DEFAULT '2',
  PRIMARY KEY (`or_lid`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=latin1;

/*Table structure for table `tr02_login_record` */

DROP TABLE IF EXISTS `tr02_login_record`;

CREATE TABLE `tr02_login_record` (
  `tr_login_in` int(11) NOT NULL AUTO_INCREMENT,
  `tr_user_id` int(11) DEFAULT NULL,
  `tr_login_time` datetime DEFAULT NULL,
  `tr_logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tr_login_in`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tr02_pair` */

DROP TABLE IF EXISTS `tr02_pair`;

CREATE TABLE `tr02_pair` (
  `tr_pair_id` int(11) NOT NULL AUTO_INCREMENT,
  `or_m_reg_id` int(11) DEFAULT NULL,
  `tot_left` int(11) NOT NULL DEFAULT '0',
  `tot_right` int(11) NOT NULL DEFAULT '0',
  `tot_direct_left` int(11) NOT NULL DEFAULT '0',
  `tot_direct_right` int(11) NOT NULL DEFAULT '0',
  `tot_lreg` int(11) NOT NULL DEFAULT '0',
  `tot_ltopup` int(11) NOT NULL DEFAULT '0',
  `tot_rreg` int(11) NOT NULL DEFAULT '0',
  `tot_rtopup` int(11) NOT NULL DEFAULT '0',
  `tot_left_carry` int(11) NOT NULL DEFAULT '0',
  `tot_right_carry` int(11) NOT NULL DEFAULT '0',
  `tot_left_pay` int(11) NOT NULL DEFAULT '0',
  `tot_right_pay` int(11) NOT NULL DEFAULT '0',
  `tot_paidpair` int(11) NOT NULL DEFAULT '0',
  `tr_user_fpc` int(1) NOT NULL DEFAULT '0',
  `tr_fpair_leg` char(2) DEFAULT NULL,
  `pair_complete_date` datetime DEFAULT NULL,
  `last_pay_date` datetime DEFAULT NULL,
  `tot_dltopup` int(11) NOT NULL DEFAULT '0',
  `tot_drtopup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tr_pair_id`),
  UNIQUE KEY `or_m_reg_id` (`or_m_reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `tr05_ticket` */

DROP TABLE IF EXISTS `tr05_ticket`;

CREATE TABLE `tr05_ticket` (
  `tr_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_ticket_userid` int(12) NOT NULL DEFAULT '0',
  `tr_ticket_title` varchar(500) NOT NULL,
  `tr_ticket_desc` text NOT NULL,
  `tr_ticket_reply` text NOT NULL,
  `tr_ticket_status` int(2) NOT NULL DEFAULT '0',
  `tr_ticket_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tr_ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tr06_currency_ledger` */

DROP TABLE IF EXISTS `tr06_currency_ledger`;

CREATE TABLE `tr06_currency_ledger` (
  `tr06_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr06_user_id` int(11) DEFAULT NULL,
  `tr06_invoice_id` varchar(50) DEFAULT NULL,
  `tr06_from_currency` int(11) DEFAULT NULL,
  `tr06_to_currency` int(11) DEFAULT NULL,
  `tr06_from_amount` double(10,2) DEFAULT NULL,
  `tr06_to_amount` double(10,2) DEFAULT NULL,
  `tr06_type` int(1) DEFAULT NULL COMMENT '1Buy,2Sell,3Exchange',
  `tr06_date` datetime DEFAULT NULL,
  `tr06_status` int(1) DEFAULT NULL COMMENT '0Pending,1Success,2Process,3Faild',
  `tr06_description` varchar(200) DEFAULT NULL,
  `tr06_email` varchar(50) DEFAULT NULL,
  `tr06_mobile` varchar(15) DEFAULT NULL,
  `tr06_pm_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tr06_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `tr07_manage_ledger` */

DROP TABLE IF EXISTS `tr07_manage_ledger`;

CREATE TABLE `tr07_manage_ledger` (
  `m_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_u_id` bigint(20) DEFAULT NULL,
  `m_trans_id` varchar(210) DEFAULT NULL,
  `m_cramount` decimal(10,3) DEFAULT NULL,
  `m_dramount` decimal(10,3) DEFAULT NULL,
  `m_description` varchar(630) DEFAULT NULL,
  `m_transdate` datetime DEFAULT NULL,
  `m_refrence_id` varchar(210) DEFAULT NULL,
  `m_ledger_type` int(11) DEFAULT NULL COMMENT '1-cr, 2-dr,3-growth,4-transfer cr,5-transfer-dr',
  `m_bal_type` int(2) DEFAULT NULL,
  `m_current_balance` decimal(10,3) DEFAULT NULL,
  `m_mode` int(11) DEFAULT NULL,
  `m_bank` int(11) DEFAULT NULL,
  `m_cheque_no` varchar(50) DEFAULT NULL,
  `m_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`m_ledger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/* Function  structure for function  `fn_get_bank_name` */

/*!50003 DROP FUNCTION IF EXISTS `fn_get_bank_name` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fn_get_bank_name`(bankid VARCHAR(10)) RETURNS varchar(200) CHARSET latin1
    DETERMINISTIC
BEGIN
 
return (select `m_bank_name` from `m01_bank` where `m01_bank`.`m_bank_id`=bankid);
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_get_location` */

/*!50003 DROP FUNCTION IF EXISTS `fn_get_location` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fn_get_location`(locid INT) RETURNS double(10,2)
BEGIN
	RETURN (select `m_loc_name` from `m02_location` where `m02_location`.`m_loc_id`=locid);
    END */$$
DELIMITER ;

/* Function  structure for function  `fn_get_userid` */

/*!50003 DROP FUNCTION IF EXISTS `fn_get_userid` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fn_get_userid`(prefix VARCHAR(10),proc INT(11)) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE res INT(11) DEFAULT 0;
	DECLARE get_id,user_id VARCHAR(100);
	IF proc = 1 THEN
		SET user_id = (SELECT SUBSTRING(CRC32(RAND()), 1, 6));
		SET user_id=(SELECT CONCAT(prefix,user_id));
		SELECT IFNULL((SELECT `m03_user_detail`.`or_m_user_id` FROM `m03_user_detail` WHERE `or_m_user_id`=user_id),0) INTO res;
		IF res != 0 THEN
			RETURN fn_regid(prefix,1);
			ELSE
			RETURN user_id;
		END IF;
	END IF;
	
	IF proc = 2 THEN
		SELECT `or_m_user_id` INTO user_id FROM `m03_user_detail` ORDER BY `or_m_reg_id` DESC LIMIT 1;
		SET user_id = (SELECT CONCAT(prefix,(user_id+1)));
		SELECT IFNULL((SELECT `m03_user_detail`.`or_m_user_id` FROM `m03_user_detail` WHERE `or_m_user_id`=user_id),0) INTO res;
		IF res != 0 THEN
			RETURN fn_regid(prefix,2);
			ELSE
			RETURN user_id;
		END IF;
	END IF;
END */$$
DELIMITER ;

/* Function  structure for function  `fx_currency_name` */

/*!50003 DROP FUNCTION IF EXISTS `fx_currency_name` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `fx_currency_name`(id int(11)) RETURNS varchar(60) CHARSET utf8
    DETERMINISTIC
BEGIN
       set @value = (select m6_name from `m06_currency_type` where m6_id = id);
	RETURN @value;
    END */$$
DELIMITER ;

/* Function  structure for function  `get_detail` */

/*!50003 DROP FUNCTION IF EXISTS `get_detail` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `get_detail`(emp_id VARCHAR(200),proc INT) RETURNS varchar(1024) CHARSET latin1
    DETERMINISTIC
BEGIN
DECLARE nm VARCHAR(1024);
IF (proc=1) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `or_m_name` AS dnm FROM `m03_user_detail` WHERE `or_m_user_id` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=2) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `or_m_name` AS dnm FROM `m03_user_detail` WHERE `or_m_reg_id` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=3) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `or_m_name` AS dnm FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_mobile_no` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=4) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `or_m_user_id` AS dnm FROM `m03_user_detail` WHERE `or_m_reg_id` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=5) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `or_m_reg_id` AS dnm FROM `m03_user_detail` WHERE `or_m_user_id` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=6) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `m03_user_detail`.`or_m_mobile_no` AS dnm FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id` = emp_id LIMIT 1) A;
RETURN nm;
END IF;
IF (proc=7) THEN
SELECT IFNULL(dnm,'0') INTO nm FROM
(SELECT `m03_user_detail`.`or_m_email` AS dnm FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id` = emp_id) A;
RETURN nm;
END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `get_transaction_id` */

/*!50003 DROP FUNCTION IF EXISTS `get_transaction_id` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `get_transaction_id`() RETURNS varchar(20) CHARSET utf8
    DETERMINISTIC
BEGIN
	SET @num=(SELECT FLOOR(RAND()*10000));
	SET @time=(SELECT DATE_FORMAT(NOW(),'%Y%m%d%h%i%s'));
	SET @value=CONCAT(@time,@num);
	RETURN @value;
    END */$$
DELIMITER ;

/* Function  structure for function  `number_to_string` */

/*!50003 DROP FUNCTION IF EXISTS `number_to_string` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `number_to_string`(n INT) RETURNS varchar(100) CHARSET latin1
BEGIN
 declare ans varchar(100);
    declare dig1, dig2, dig3 int; -- (one variable per digit)
    set ans = '';
    set dig3 = floor(n / 100);
    set dig2 = floor(n / 10) - dig3*10;
    set dig1 = n - (dig3*100 + dig2*10);
    if dig3 > 0 then
        case
            when dig3=1 then set ans=concat(ans, 'one hundred');
            when dig3=2 then set ans=concat(ans, 'two hundred');
            when dig3=3 then set ans=concat(ans, 'three hundred');
            when dig3=4 then set ans=concat(ans, 'four hundred');
            when dig3=5 then set ans=concat(ans, 'five hundred');
            when dig3=6 then set ans=concat(ans, 'six hundred');
            when dig3=7 then set ans=concat(ans, 'seven hundred');
            when dig3=8 then set ans=concat(ans, 'eight hundred');
            when dig3=9 then set ans=concat(ans, 'nine hundred');
            else set ans = ans;
        end case;
    end if;
    if dig2 = 1 then
        case
            when (dig2*10 + dig1) = 10 then set ans=concat(ans,' ten');
            when (dig2*10 + dig1) = 11 then set ans=concat(ans,' eleven');
            when (dig2*10 + dig1) = 12 then set ans=concat(ans,' twelve');
            when (dig2*10 + dig1) = 13 then set ans=concat(ans,' thirteen');
            when (dig2*10 + dig1) = 14 then set ans=concat(ans,' fourteen');
            when (dig2*10 + dig1) = 15 then set ans=concat(ans,' fifteen');
            when (dig2*10 + dig1) = 16 then set ans=concat(ans,' sixteen');
            when (dig2*10 + dig1) = 17 then set ans=concat(ans,' seventeen');
            when (dig2*10 + dig1) = 18 then set ans=concat(ans,' eighteen');
            when (dig2*10 + dig1) = 19 then set ans=concat(ans,' nineteen');
            else set ans=ans;
        end case;
    else
        if dig2 > 0 then
            case
                when dig2=2 then set ans=concat(ans, ' twenty');
                when dig2=3 then set ans=concat(ans, ' thirty');
                when dig2=4 then set ans=concat(ans, ' fourty');
                when dig2=5 then set ans=concat(ans, ' fifty');
                when dig2=6 then set ans=concat(ans, ' sixty');
                when dig2=7 then set ans=concat(ans, ' seventy');
                when dig2=8 then set ans=concat(ans, ' eighty');
                when dig2=9 then set ans=concat(ans, ' ninety');
                else set ans=ans;
            end case;
        end if;
        if dig1 > 0 then
            case
                when dig1=1 then set ans=concat(ans, ' one');
                when dig1=2 then set ans=concat(ans, ' two');
                when dig1=3 then set ans=concat(ans, ' three');
                when dig1=4 then set ans=concat(ans, ' four');
                when dig1=5 then set ans=concat(ans, ' five');
                when dig1=6 then set ans=concat(ans, ' six');
                when dig1=7 then set ans=concat(ans, ' seven');
                when dig1=8 then set ans=concat(ans, ' eight');
                when dig1=9 then set ans=concat(ans, ' nine');
                else set ans=ans;
            end case;
        end if;
    end if;
    return trim(ans);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `add_multi_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_multi_user` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `add_multi_user`(IN proc INT(11),IN no_of_id INT(11))
BEGIN
	DECLARE l_id, counts INT(11);	
	
	IF proc = 1 THEN
		WHILE no_of_id > 0 DO
		
			SET l_id = (SELECT `fetch_extreme_left`(1,"R"));
			
			CALL sp_member('','','Ram Singh','2000-01-01','Hari Prasad Singh','2017-02-10 10:14:10','1','ram@gmail.com','','3254647879','bh','208020',1,'34','','41',1,'1','Admin',1,l_id,'R',0,'2017-02-10 10:14:10','873959','770687','1','1',@msg);
			
			SET no_of_id = (no_of_id-1);
		END WHILE;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_downline` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_downline` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `get_downline`(IN id INT(11),IN leg VARCHAR(2))
BEGIN
    DECLARE cur_depth INT DEFAULT 1;
    DECLARE id1 INT(11);
    
    -- Create the structure of the final table
    DROP TEMPORARY TABLE IF EXISTS tmp_downline;
    CREATE TEMPORARY TABLE tmp_downline (
        member_id INT UNSIGNED
        -- referrer_id INT UNSIGNED
    );
    -- Create a table for the previous list of users
    DROP TEMPORARY TABLE IF EXISTS tmp_members;
    CREATE TEMPORARY TABLE tmp_members(
        member_id INT UNSIGNED
    );
    -- Make a duplicate of tmp_members so we can select on both
    DROP TEMPORARY TABLE IF EXISTS tmp_members2;
    CREATE TEMPORARY TABLE tmp_members2(
        member_id INT UNSIGNED
    );
    IF leg != '1' THEN
	SELECT `m03_user_detail`.`or_m_reg_id` INTO id1 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_upliner_id`=id AND `m03_user_detail`.`or_m_position`=leg;
	INSERT INTO tmp_downline (member_id) SELECT id1;
    ELSE
	INSERT INTO tmp_downline (member_id) SELECT id;
	SET id1 = id;
    END IF;
    
    -- Create the level 1 downline
    INSERT INTO tmp_downline (member_id) SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE `or_m_upliner_id` = id1;
    -- Add those members into the tmp table
    INSERT INTO tmp_members SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE `or_m_upliner_id` = id1;
    myLoop: WHILE ((SELECT COUNT(*) FROM tmp_members) > 0) DO
        -- Set next level of users
        SET cur_depth = cur_depth + 1;
        -- Insert next level of users into table
        INSERT INTO tmp_downline SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE `or_m_upliner_id` IN(SELECT member_id FROM tmp_members);
        -- Re-fill duplicate temporary table
        TRUNCATE TABLE tmp_members2;
        INSERT INTO tmp_members2 SELECT member_id FROM tmp_members;
        -- Reset the default temporary table
        TRUNCATE TABLE tmp_members;
        INSERT INTO tmp_members SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE `or_m_upliner_id` IN(SELECT member_id FROM tmp_members2);
    END WHILE;
    -- Get the final list of results
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_admin_dashboard` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_admin_dashboard` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_admin_dashboard`()
BEGIN
DECLARE active_id, deactive_id, tot_id, topup, nontopup INT(11) DEFAULT 0;
            
SELECT count(*) INTO tot_id FROM `m03_user_detail`;
SELECT COUNT(*) INTO active_id FROM `m03_user_detail` where `m03_user_detail`.`or_m_status` = 1;
SELECT COUNT(*) INTO deactive_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_status` = 0;
SELECT COUNT(*) INTO topup FROM `m03_user_detail` WHERE `m03_user_detail`.`m_topup_pin_id` <> 0;
SELECT COUNT(*) INTO nontopup FROM `m03_user_detail` WHERE `m03_user_detail`.`m_topup_pin_id` = 0;
SELECT tot_id, active_id, deactive_id, topup, nontopup;
   
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_admin_payout_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_admin_payout_report` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_admin_payout_report`(IN queery VARCHAR(2000))
BEGIN
SET @asd = CONCAT("SELECT
   `tr04_payout_detail`.`or_m_reg_id`			AS `User_Reg`,
   `m03_user_detail`.`or_m_user_id` 			AS `Associate_Id`,
   `m03_user_detail`.`or_m_name` 			AS `Associate_Name`,
   `tr04_payout_detail`.`tr_from_payout_date` 		AS `From_Date`,
   `tr04_payout_detail`.`tr_to_payout_date`		AS `To_Date`,
   `tr04_payout_detail`.`tr_payout_entrydate`		AS `Entry_Date`,
   get_detail(`tr04_payout_detail`.`tr_payout_level`,4)	AS `Refer_from`,
   (CASE WHEN (`tr04_payout_detail`.`tr_payout_type`=1) THEN 'Match Income' WHEN (`tr04_payout_detail`.`tr_payout_type`=2) THEN 'Refferal Income' ELSE '' END ) AS `Payout_Type1`,
   `tr04_payout_detail`.`tr_payout_type`		AS `Payout_Type`,
   `tr04_payout_detail`.`tr_payout_level` 		AS `Payout_Level`,
   `tr04_payout_detail`.`tr_payout_amount` 		AS `Payout_Amount`,
   `tr04_payout_detail`.`tr_previous_lcarry`  		AS `Payout_PreLcarry`,
   `tr04_payout_detail`.`tr_previous_rcarry`  		AS `Payout_PreRcarry`,
   `tr04_payout_detail`.`tr_payout_lcarry`  		AS `Payout_Lcarry`,
   `tr04_payout_detail`.`tr_payout_rcarry`  		AS `Payout_Rcarry`,
   `tr04_payout_detail`.`tr_payout_tot_lft`  		AS `Payout_Total_leftpayout`,
   `tr04_payout_detail`.`tr_payout_tot_rht`  		AS `Payout_Total_rightpayout`,
   `tr04_payout_detail`.`tr_payout_pair`  		AS `Payout_Pair`,
   `tr04_payout_detail`.`tr_payout_admincharges` 	AS `Admin_Charges`,
   `tr04_payout_detail`.`tr_payout_tdscharges` 		AS `TDS_Charges`,
   `tr04_payout_detail`.`tr_payout_proce_charge`	AS `Processing_charge`,
   `tr04_payout_detail`.`tr_payout_final_income` 	AS `Final_Amount`,
   `tr04_payout_detail`.`tr_payout_paidpair`		AS `paidpair`
FROM (`tr04_payout_detail`
   LEFT JOIN `m03_user_detail`
     ON (`tr04_payout_detail`.`or_m_reg_id` = `m03_user_detail`.`or_m_reg_id`))
        WHERE ",queery);
   
  PREPARE zxc FROM @asd;
  EXECUTE zxc;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_already_login_exists` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_already_login_exists` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_already_login_exists`()
BEGIN
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_bank` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_bank` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_bank`(
  IN m_bank_id INT (11),
  IN m_bank_name VARCHAR (200),
  IN m_bank_status INT (2),
  IN proc INT (2)
)
BEGIN
  IF (proc = 1) THEN 
  INSERT INTO `admin_hub`.`m01_bank` (
    `m_bank_name`,
    `m_bank_status`
  ) 
  VALUES
    (
      m_bank_name,
      m_bank_status
    ) ;
  END IF ;
  
  
  IF (proc = 2) THEN 
  SELECT 
    `m01_bank`.`m_bank_id`,
    `m01_bank`.`m_bank_name`,
    `m01_bank`.`m_bank_status` 
  FROM
    `admin_hub`.`m01_bank`;
  END IF ;
  
  
  IF (proc = 3) THEN
  UPDATE `admin_hub`.`m01_bank` SET `m01_bank`.`m_bank_name` = m_bank_name WHERE `m01_bank`.`m_bank_id` = m_bank_id ;
  END IF ;
  
  IF (proc = 4) THEN
  UPDATE `admin_hub`.`m01_bank` SET `m01_bank`.`m_bank_status` = m_bank_status WHERE `m01_bank`.`m_bank_id` = m_bank_id ;
  END IF ;
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cancel_pin` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cancel_pin` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_cancel_pin`(IN queery VARCHAR(1000))
BEGIN
SET @asd = CONCAT("SELECT
  @a:=@a+1 				    SN,
  `m09_pin_detail`.`m_pin_id`       	AS `PIN_ID`,
  `m03_user_detail`.`or_m_name`  	AS `NAME`,
  `m03_user_detail`.`or_m_user_id`  	AS `USER_ID`,
  `m09_pin_detail`.`m_pin`       	AS `PIN_NO`,
  `m06_package`.`m_pack_name`    	AS `PACKAGE`,
  `m06_package`.`m_pack_fee`    	AS `FEES`,
  (CASE WHEN(`m09_pin_detail`.`m_pin_is_reg`=1) THEN 'Registration' WHEN(`m09_pin_detail`.`m_pin_is_reg`=2) THEN 'Registration' WHEN(`m09_pin_detail`.`m_pin_is_reg`=3) THEN 'Registration' ELSE 'NO PIN' END)	AS `TYPE`
FROM (`m09_pin_detail`
   LEFT JOIN `m06_package`
     ON ((`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`))
   LEFT JOIN `admin_whlcare`.`m03_user_detail` 
        ON (`m09_pin_detail`.`or_m_reg_id` = `m03_user_detail`.`or_m_reg_id`),(SELECT @a:= 0) AS a) where ",queery);
  
   PREPARE zxc FROM @asd;
  EXECUTE zxc;
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_change_status_of_user` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_change_status_of_user` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_change_status_of_user`(
IN or_m_reg_id VARCHAR(20),
IN proc INT(2)
)
BEGIN
IF (proc = 1) THEN
UPDATE 
  `admin_hub`.`m03_user_detail` 
SET
   `m03_user_detail`.`or_m_status`=1
WHERE FIND_IN_SET(`m03_user_detail`.`or_m_reg_id` ,or_m_reg_id );
END IF;
IF (proc = 2) THEN
UPDATE 
  `admin_hub`.`m03_user_detail` 
SET
   `m03_user_detail`.`or_m_status`=0
WHERE FIND_IN_SET (`m03_user_detail`.`or_m_reg_id` ,or_m_reg_id );
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_create_roi_dates` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_create_roi_dates` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_create_roi_dates`(
	IN mem_uid INT(11),
	IN topup_id INT(11), # package id
	#IN tr10_mem_reqdate varchar(50),
	OUT msg TEXT
)
BEGIN
	DECLARE curr_bal, admin_charges, tds_charges, final_income, payout, pay_roi_amount ,mem_amount,direct_amount double(10,2);
	DECLARE roi_status,Check_refferal, into_id, check_topup,last_ins_id,introducer_id  int(2) ;
	DECLARE is_panavail,amount VARCHAR(50);
	DECLARE next_date,pay_date,mining_date,package_amount,day_names,daily_amount VARCHAR(20);
	
	SET amount = (SELECT `m_pack_fee` FROM `m06_package` WHERE `m_pack_id` = topup_id);
	
	call sp_datewise_data(mem_uid,amount,current_date,@msg);	
              
	SET  @daycount = 0;
        SET  @paydays = 0;
        SET  pay_date = (NOW() + INTERVAL 1 DAY);
        SET  mining_date = (NOW());
		
		
	SET pay_roi_amount = (SELECT  circle_growth_amount FROM `tr29_user_circle` WHERE tr_circle_id = topup_id);
	
	SET daily_amount =  pay_roi_amount;	
		
		
                  WHILE(@paydays < 90) DO
         
         SET @paydays = @paydays+1;
         
         SET msg = pay_roi_amount;
         
         SET day_names = (SELECT DAYNAME(pay_date));          
         
         
         IF (day_names = 'Sunday') THEN SET pay_roi_amount = 0; ELSE  SET pay_roi_amount =  daily_amount; END IF;
         
         IF ( @paydays = 89 OR @paydays = 90) THEN set roi_status = '2'; ELSE SET roi_status = '0'; END IF;
           
         INSERT INTO `admin_hub`.`tr27_roi_dates` 
		 (
		  `tr_topup_id`,
		  `tr_user_id`,
		  `tr_pay_date`,
		  `tr_pay_amount`,
		  `tr_status`
		) 
		VALUES
		  (
		    topup_id,
		    mem_uid,
		    pay_date,
		    pay_roi_amount,
		    roi_status 
		  ) ;
          
          
          -- SET pay_date =  next_date;
          SET pay_date = (SELECT pay_date + INTERVAL 1 DAY);
          SET mining_date = (SELECT mining_date + INTERVAL 1 DAY);
          
         END WHILE; 		
	SET direct_amount = (SELECT  (circle_amount*5)/100 FROM `tr29_user_circle` WHERE tr_circle_id = topup_id);	
	set introducer_id =  (select `or_m_intr_id` from `m03_user_detail` where `m03_user_detail`.`or_m_reg_id` = mem_uid);	
           
	INSERT INTO `admin_hub`.`tr07_manage_ledger` (
	  `m_u_id`,
	  `m_trans_id`,
	  `m_cramount`,
	  `m_dramount`,
	  `m_description`,
	  `m_transdate`,
	  `m_refrence_id`,
	  `m_ledger_type`,
	  `m_bal_type`,
	  `m_current_balance`
	) 
	VALUES
	  (
	    introducer_id,
	    date_format(now(),'%Y%m%d%H%i%s'),
	    direct_amount,
	    '0',
	    'Direct amount',
	    now(),
	    mem_uid,
	    '5',#direct amount
	    '1',
	    '0'
	  ) ;  
        	  
	  
	  
	  
	   
	 #SET msg = 'successfully done';	
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_current_pin_position` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_current_pin_position` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_current_pin_position`(IN queery VARCHAR(1000))
BEGIN
SET @asd = CONCAT("SELECT  
`m09_pin_detail`.`m_pin` AS PIN ,
`m09_pin_detail`.`m_pin_gen_date` AS GENERATION_DATE ,
`m09_pin_detail`.`m_pin_is_reg` as `m_pin_is_reg`,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`=1) THEN 'In-Active' WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN 'Active' ELSE 'Deactive' END)     AS PIN_Status,
`m06_package`.`m_pack_fee`      AS Amount,
`m03_user_detail`.`or_m_user_id` AS Issued_LOGIN_ID,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN `m03_user_detail_1`.`or_m_user_id` ELSE '' END)AS Associate_id,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN `m03_user_detail_1`.`or_m_name` ELSE '' END) AS Associate_name,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN 'Registration' ELSE 'Topup Pin' END)  AS `PIN_IS_REG`
FROM
    `admin_hub`.`m09_pin_detail`
    LEFT JOIN `admin_hub`.`m06_package` 
        ON (`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`)
    LEFT JOIN `admin_hub`.`m03_user_detail` 
        ON (`m09_pin_detail`.`m_pin_assigned_to` = `m03_user_detail`.`or_m_reg_id`)
    LEFT JOIN `admin_hub`.`m03_user_detail` AS `m03_user_detail_1`
        ON (`m09_pin_detail`.`m_pin_id` = `m03_user_detail_1`.`m_pin_id`)
        WHERE  ",queery);
  
   PREPARE zxc FROM @asd;
  EXECUTE zxc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_daily_roi_send` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_daily_roi_send` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_daily_roi_send`()
BEGIN
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_datewise_amount` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_datewise_amount` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_datewise_amount`(IN txtlogin INT(11),IN pos VARCHAR(200),IN is_direct INT(2),IN plan_amt DECIMAL(10,2),IN jd DATE,OUT msg TEXT)
BEGIN
	DECLARE id_exist,cleft,dleft,cright,dright,rc INT(11);
	DECLARE lvol,rvol,bvol DECIMAL(10,2);
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET msg=0;
		ROLLBACK;
	END;
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET msg=0;
		ROLLBACK;
	END;
	DECLARE EXIT HANDLER FOR 1318 
	BEGIN
		SET msg=0;
	END;
	DECLARE EXIT HANDLER FOR 1062 
	BEGIN
		SET msg=0;
	END;
	DECLARE EXIT HANDLER FOR 1065 
	BEGIN
		SET msg=0;
	END;
	DECLARE EXIT HANDLER FOR SQLSTATE '23000' 
	BEGIN
		SET msg=0;
	END;
	DECLARE EXIT HANDLER FOR 1048 
	BEGIN
		SET msg=0;
	END;	      
	
    START TRANSACTION;
    SET cleft=0;
    SET dleft=0;
    SET cright=0;
    SET dright=0;
    SET id_exist=0;
    SELECT COUNT(*) INTO id_exist FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(jd,'%Y-%m-%d');
    
	IF id_exist = 0 THEN 
		SET rvol=0.00;
		SET lvol=0.00;
		SET bvol=0.00;
		
		IF pos = 'L' THEN 
			SET cleft=cleft+1;
			SET bvol=plan_amt;
			SET lvol=(lvol+bvol);
			IF is_direct = 1 THEN
				SET dleft=dleft+1;
			END IF ;
		END IF;
		
		IF pos = 'R' THEN 
			SET cright = cright+1;
			SET bvol = plan_amt;
			SET rvol = (rvol+bvol);
			IF is_direct = 1 THEN
				SET dright = dright+1;
			END IF ;
		END IF;  
		
		INSERT INTO `tr03_datewise_pair` (
			`or_m_reg_id`,
			`tr_today_left`,
			`tr_today_right`,
			`tr_today_dleft`,
			`tr_today_dright`,
			`tr_today_lvol`,
			`tr_today_rvol`,
			`tr_date`
		) 
		VALUES
		(
			txtlogin,
			cleft,
			cright,
			dleft,
			dright,
			lvol,
			rvol,
			jd
		) ;   
		
		SET rc=(SELECT ROW_COUNT() AS c);
		SET msg=rc;
	END IF;
	
	IF id_exist = 1 THEN
		
		SET cleft=0;
		SET dleft=0;
		SET cright=0;
		SET dright=0;
		SET rvol=0.00;
		SET lvol=0.00;
		SET bvol=0.00;
		SELECT `tr_today_left`, `tr_today_right`, `tr_today_dleft`, `tr_today_dright`, `tr_today_rvol`, `tr_today_lvol` INTO cleft, cright, dleft, dright, rvol, lvol FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(jd,'%Y-%m-%d');
		
		IF pos = 'L' THEN 
			SET cleft=cleft+1;
			SET bvol=plan_amt;
			SET lvol=(lvol+bvol);
			IF is_direct = 1 THEN
				SET dleft=dleft+1;
			END IF ;
		END IF;
		
		IF pos = 'R' THEN 
			SET cright=cright+1;
			SET bvol=plan_amt;
			SET rvol=(rvol+bvol);
			IF is_direct = 1 THEN
				SET dright = dright+1;
			END IF ;
		END IF;   
		
		UPDATE 
		`tr03_datewise_pair`
		SET
		`tr_today_left` = cleft,
		`tr_today_right` = cright,
		`tr_today_dleft`=dleft,
		`tr_today_dright`=dright,
		`tr_today_lvol`=lvol,
		`tr_today_rvol`=rvol
		WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(jd,'%Y-%m-%d');
		
		SET rc=(SELECT ROW_COUNT() AS c);
		SET msg=rc;
		
	END IF;
	COMMIT;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_datewise_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_datewise_data` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_datewise_data`(IN txtlogin INT(11), IN plan_amt DECIMAL(10,2),IN reg_date VARCHAR(30), OUT msg TEXT)
BEGIN
	DECLARE is_active, reg_id, is_direct, ltopup, rtopup, dr_topup, dl_topup, intro_id INT (11) DEFAULT 0;
	DECLARE pos VARCHAR (25);
	    
	START TRANSACTION;
		SELECT IFNULL(`or_m_status`,0), IFNULL(`or_m_upliner_id`,0), IFNULL(`or_m_position`,0), IFNULL(`or_m_intr_id`,0) INTO is_active, reg_id, pos, intro_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=txtlogin LIMIT 1;
		SET is_direct = 1;
		
		pair_details: WHILE reg_id > 0 DO
		
		SELECT IFNULL(`tr02_pair`.`tot_ltopup`,0), IFNULL(`tr02_pair`.`tot_rtopup`,0) INTO ltopup, rtopup FROM `admin_hub`.`tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id LIMIT 1;
			
			IF pos ='L' THEN
				SET ltopup = ltopup + 1;
				
				IF intro_id=reg_id THEN
				SET dl_topup=1;
				END IF;	
					
			END IF;
			
			IF pos ='R' THEN
			
				SET rtopup = rtopup + 1;
				
				IF intro_id=reg_id THEN
				SET dr_topup=1;
				END IF;	
				
			END IF;
			IF ltopup = 2 AND rtopup = 1 THEN
				UPDATE
				  `admin_hub`.`tr02_pair`
				SET
				  `tr02_pair`.`tr_fpair_leg` = "L"
				WHERE `tr02_pair`.`or_m_reg_id` = reg_id;
			END IF;
			
			IF ltopup = 1 AND rtopup = 2 THEN
				UPDATE
				  `admin_hub`.`tr02_pair`
				SET
				  `tr02_pair`.`tr_fpair_leg` = "R"
				WHERE `tr02_pair`.`or_m_reg_id` = reg_id;
			END IF;
			
			UPDATE 
			`admin_hub`.`tr02_pair` 
			SET
			`tr02_pair`.`tot_ltopup` = ltopup,
			`tr02_pair`.`tot_rtopup` = rtopup,
			`tr02_pair`.`tot_dltopup` = `tr02_pair`.`tot_dltopup`+dl_topup,
			`tr02_pair`.`tot_drtopup` = `tr02_pair`.`tot_drtopup`+dr_topup
			WHERE `tr02_pair`.`or_m_reg_id` = reg_id ;
		
			IF is_active = 1 THEN
			    CALL sp_datewise_amount(reg_id, pos, is_direct, plan_amt, reg_date, @a);
			END IF;
			
			SELECT `or_m_position`, `or_m_upliner_id`, IFNULL(`or_m_status`,0) INTO pos, reg_id, is_active FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=reg_id LIMIT 1;
			SET is_direct = 0;
			SET dl_topup=0;
			SET dr_topup=0;
			
		END WHILE pair_details;
		SET msg=1;
	COMMIT;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_datewise_pair` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_datewise_pair` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_datewise_pair`(IN txtlogin INT(11),IN pos VARCHAR(200),IN is_direct INT(2), IN JD varchar(30))
BEGIN
    DECLARE id_exist, cleft, dleft, cright, dright INT(11);
    
    SET cleft=0;
    SET dleft=0;
    SET cright=0;
    SET dright=0;
    SET id_exist=(SELECT COUNT(*) FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d'));    
    /*select id_exist,cleft,cright,pos;*/
	IF id_exist = 0 THEN 
		IF pos = 'L' THEN 
			SET cleft=cleft+1;
			IF is_direct = 1 THEN
				SET dleft=dleft+1;
			END IF ;
		END IF;
		
		IF pos = 'R' THEN 
			SET cright=cright+1;
			IF is_direct = 1 THEN
				SET dright=dright+1;
			END IF ;
		END IF;
		
		INSERT INTO `admin_hub`.`tr03_datewise_pair` (
			`or_m_reg_id`,
			`tr_today_left`,
			`tr_today_right`,
			`tr_today_dleft`,
			`tr_today_dright`,
			`tr_date`
		) 
		VALUES
		(
			txtlogin,
			cleft,
			cright,
			dleft,
			dright,
			JD
		) ;   
	END IF;
	
	IF id_exist = 1 THEN
		SET cleft=0;
		SET dleft=0;
		SET cright=0;
		SET dright=0;
		SET cleft=(SELECT `tr_today_left`FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d'));
		SET cright=(SELECT `tr_today_right` FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d'));
		SET dleft=(SELECT `tr_today_dleft`FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d'));
		SET dright=(SELECT `tr_today_dright` FROM `tr03_datewise_pair` WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d'));
		IF pos = 'L' THEN 
			SET cleft=cleft+1;
			IF is_direct = 1 THEN
				SET dleft=dleft+1;
			END IF ;
		END IF;
		
		
		IF pos = 'R' THEN 
			SET cright=cright+1;
			IF is_direct = 1 THEN
				SET dright=dright+1;
			END IF ;
		END IF;    
		
		UPDATE 
		`admin_hub`.`tr03_datewise_pair` 
		SET
		`tr_today_left` = cleft,
		`tr_today_right` = cright,
		`tr_today_dleft`=dleft,
		`tr_today_dright`=dright
		WHERE `or_m_reg_id`=txtlogin AND DATE_FORMAT(`tr_date`,'%Y-%m-%d')=DATE_FORMAT(JD,'%Y-%m-%d');
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_direct_income` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_direct_income` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_direct_income`(
	IN to_close_date VARCHAR(20)
)
BEGIN
	
	DECLARE from_close_date VARCHAR(20);
	DECLARE transid VARCHAR(30);
	
	SELECT `get_transaction_id`() INTO transid;
	SELECT IFNULL(MAX(`tr12_direct_date`.`tr_direct_date`),'2017-01-01') INTO from_close_date FROM `tr12_direct_date` WHERE `tr_direct_status`=3;
	
	INSERT INTO `admin_hub`.`tr06_afterpublish_detail` (
		`or_m_reg_id`,
		`tr_apd_match_incm`,
		`tr_apd_direct_incm`,
		`tr_apd_growth_incm`,
		`tr_apd_admin_chrgs`,
		`tr_apd_tds_chrgs`,
		`tr_apd_final_income`,
		`tr_apd_iscapped`,
		`tr_apd_is_paid`,
		`tr_apd_is_weekly_paid`,
		`tr_apd_publish_date`
	) 
	SELECT
    or_m_reg_id,
    0,
    SUM(`tr_payout_amount`),
    0,
    SUM(`tr_payout_admincharges`),
    SUM(`tr_payout_tdscharges`),
    SUM(`tr_payout_final_income`),
    0,
    0,
    0,
    to_close_date
    FROM `tr04_payout_detail` 
    WHERE `tr04_payout_detail`.`tr_payout_type` = 2
    AND DATE_FORMAT(`tr04_payout_detail`.`tr_payout_entrydate`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d')
    AND DATE_FORMAT(`tr04_payout_detail`.`tr_payout_entrydate`,'%Y-%m-%d') <= DATE_FORMAT(to_close_date,'%Y-%m-%d')
    AND `tr04_payout_detail`.`tr_payout_ispublish`=0
    GROUP BY `or_m_reg_id` ;
	
    UPDATE 
	`admin_hub`.`tr04_payout_detail` 
	SET
	`tr_payout_ispublish` = 1
	WHERE `tr04_payout_detail`.`tr_payout_type` = 2 and 
	DATE_FORMAT(`tr04_payout_detail`.`tr_payout_entrydate`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') 
    AND DATE_FORMAT(`tr04_payout_detail`.`tr_payout_entrydate`,'%Y-%m-%d') <= DATE_FORMAT(to_close_date,'%Y-%m-%d') ;
	
    INSERT INTO `admin_hub`.`tr07_manage_ledger` (
		`m_u_id`,
		`m_trans_id`,
		`m_cramount`,
		`m_dramount`,
		`m_description`,
		`m_transdate`,
		`m_refrence_id`,
		`m_ledger_type`,
		`m_bal_type`,
		`m_current_balance`,
		`m_datetime`
	) 
	SELECT
	`or_m_reg_id`,
	transid,
	SUM(`tr_apd_final_income`),
	0,
	"Direct Income Credited",
	NOW(),
	`or_m_reg_id`,
	1,
	1,
	(`get_available_bal`(or_m_reg_id,1)+SUM(`tr_apd_final_income`)),
	NOW()
	FROM `tr06_afterpublish_detail` 
	WHERE DATE_FORMAT(`tr06_afterpublish_detail`.`tr_apd_publish_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d')
	AND DATE_FORMAT(`tr06_afterpublish_detail`.`tr_apd_publish_date`,'%Y-%m-%d') <= DATE_FORMAT(to_close_date,'%Y-%m-%d')
	AND `tr06_afterpublish_detail`.`tr_apd_is_paid`=0 AND `tr06_afterpublish_detail`.`tr_apd_is_weekly_paid`=0 
	AND `tr06_afterpublish_detail`.`tr_apd_direct_incm` <> 0 GROUP BY `or_m_reg_id`;
	
	UPDATE 
	`admin_hub`.`tr06_afterpublish_detail` 
	SET
	`tr_apd_is_paid` = 1,
	`tr_apd_is_weekly_paid` = 1,
	`tr_apd_weekly_pay_date` = NOW(),
	`tr_apd_pay_date` = NOW()
	WHERE DATE_FORMAT(`tr06_afterpublish_detail`.`tr_apd_publish_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d')
	AND DATE_FORMAT(`tr06_afterpublish_detail`.`tr_apd_publish_date`,'%Y-%m-%d') <= DATE_FORMAT(to_close_date,'%Y-%m-%d') 
	AND `tr06_afterpublish_detail`.`tr_apd_direct_incm` <> 0 ;
	
	UPDATE 
	  `admin_hub`.`tr12_direct_date` 
	SET
	  `tr_direct_status` = 3 
	WHERE `tr12_direct_date`.`tr_direct_date` = to_close_date LIMIT 1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_fill_spot_income` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_fill_spot_income` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_fill_spot_income`(IN closing_to_date VARCHAR(200))
BEGIN
	DECLARE intr_id, reg_status, is_active, topid, regid INT(11);
	DECLARE topup_date, is_panavail VARCHAR(25);
	DECLARE payout, admin_charges, tds_charges, final_income, proc_charges, topup DECIMAL(10,2) DEFAULT 0;
	
	DECLARE c CURSOR FOR SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE DATE_FORMAT(`m03_user_detail`.`or_m_topup_date`,'%Y-%m-%d')=DATE_FORMAT(closing_to_date,'%Y-%m-%d') AND `or_m_reg_id`!=1;
	DECLARE EXIT HANDLER FOR NOT FOUND    
	BEGIN     
	END; 
	OPEN c;
	payout:LOOP
		FETCH c INTO regid;
	
	SELECT IFNULL(`m03_user_detail`.`or_m_intr_id`,0), `m03_user_detail`.`or_m_status` INTO intr_id, is_active FROM `admin_hub`.`m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=regid LIMIT 1;
	
	SELECT `m_topup_pin_id` INTO topid FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=intr_id LIMIT 1;
	
	SELECT `get_package_amount`(3,topid) INTO topup;
	
	IF intr_id != 0 AND is_active = 1 AND topup = 1500 THEN
		
		SELECT IFNULL(`m04_user_bank`.`or_m_b_pancard`,'') INTO is_panavail FROM `admin_hub`.`m04_user_bank` WHERE `m04_user_bank`.`or_m_id`=intr_id;
		SET payout = 250;
		
		IF payout > 0 AND is_active = 1 THEN
			
			SET admin_charges = (payout*.05);
			SET proc_charges = (payout*.05);
			
			IF is_panavail != "" THEN
				SET tds_charges = (payout*.05);
			ELSE
				SET tds_charges = (payout*.05);
			END IF;
			
			SET final_income = (payout-(admin_charges+tds_charges+proc_charges));
			
			INSERT INTO `admin_hub`.`tr04_payout_detail` (
				`or_m_reg_id`,
				`tr_from_payout_date`,
				`tr_to_payout_date`,
				`tr_payout_entrydate`,
				`tr_payout_type`,
				`tr_payout_level`,
				`tr_payout_tot_lft`,
				`tr_payout_tot_rht`,
				`tr_payout_pair`,
				`tr_payout_paidpair`,
				`tr_payout_lcarry`,
				`tr_payout_rcarry`,
				`tr_payout_amount`,
				`tr_payout_admincharges`,
				`tr_payout_tdscharges`,
				`tr_payout_proce_charge`,
				`tr_payout_final_income`,
				`tr_payout_descrip`,
				`tr_payout_ispublish`,
				`tr_payout_is_delete`
			) 
			VALUES
			(
				intr_id,
				DATE_FORMAT(closing_to_date,'%Y-%m-%d'),
				DATE_FORMAT(closing_to_date,'%Y-%m-%d'),
				DATE_FORMAT(closing_to_date,'%Y-%m-%d'),
				2,
				regid,
				0,  
				0,  
				0,
				0,
				0,
				0,
				payout,
				admin_charges,
				tds_charges,
				proc_charges,
				final_income,
				'Direct Sponspor Income',
				0,
				0
			) ;  
		END IF;    
        
	END IF;
	
	END LOOP payout;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_fund_request` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_fund_request` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_fund_request`(
	IN tr09_req_id INT(11),
	IN tr09_req_uid INT(11),
	IN tr09_req_amount DECIMAL(10,2),
	IN tr09_req_type INT(2),
	IN tr09_req_curr_type INT(2),
	IN tr09_req_recipt TEXT,
	IN m_top_status INT(2),
	IN proc INT(2),
	OUT msg TEXT
)
BEGIN
	DECLARE userid INT(11);
	DECLARE amt DECIMAL(10,2);
	
	IF proc = 1 THEN
		
		INSERT INTO `admin_hub`.`tr09_fund_request` (
			`tr09_req_uid`,
			`tr09_req_amount`,
			`tr09_req_type`,
			`tr09_req_curr_type`,
			`tr09_req_recipt`,
			`m_top_reqdate`,
			`m_top_status`
		) 
		VALUES
		(
			tr09_req_uid,
			tr09_req_amount,
			tr09_req_type,
			tr09_req_curr_type,
			tr09_req_recipt,
			NOW(),
			m_top_status
		) ;
		
		SET msg = "Insert Successfully";
		
	END IF;
	
	IF proc = 2 THEN
		
		UPDATE 
		`admin_hub`.`tr09_fund_request`
		SET
		`tr09_fund_request`.`m_top_approvedate` = NOW(),
		`tr09_fund_request`.`m_top_status` = m_top_status
		WHERE `tr09_fund_request`.`tr09_req_id` = tr09_req_id ;
		
		IF m_top_status = 1  THEN
			SELECT `tr09_fund_request`.`tr09_req_uid` INTO userid FROM `tr09_fund_request` WHERE `tr09_fund_request`.`tr09_req_id`=tr09_req_id;
			SELECT `tr09_fund_request`.`tr09_req_amount` INTO amt FROM `tr09_fund_request` WHERE `tr09_fund_request`.`tr09_req_id`=tr09_req_id;
			
			INSERT INTO `admin_hub`.`tr07_manage_ledger` (
				`m_u_id`,
				`m_trans_id`,
				`m_cramount`,
				`m_dramount`,
				`m_description`,
				`m_transdate`,
				`m_refrence_id`,
				`m_ledger_type`,
				`m_bal_type`,
				`m_current_balance`,
				`m_datetime`
			) 
			VALUES
			(
				userid,
				`get_transaction_id`(),
				amt,
				0,
				"Amount From Admin",
				NOW(),
				0,
				1,
				1,
				(`get_available_bal`(userid,1)+amt),
				NOW()
			) ;
			
		END IF;
		
		SET msg = "Update Successfully";
		
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_payout_date` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_payout_date` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_get_payout_date`(IN proc INT(2),IN closingdate VARCHAR(200))
BEGIN
	IF proc = 1 THEN
		UPDATE 
		`admin_hub`.`tr05_closing_date` 
		SET
		`tr05_closing_date`.`tr_closing_status` =2 
		WHERE   `tr05_closing_date`.`tr_closing_date` = closingdate;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_insert_closing_date` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_insert_closing_date` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_insert_closing_date`(IN proc INT(11))
BEGIN
	DECLARE last_date, nextdate DATETIME;
	DECLARE today_top INT(11);
	
	IF proc = 1 THEN
		INSERT INTO `admin_hub`.`tr05_closing_date` (
		  `tr_closing_date`,
		  `tr_closing_status`
		)
		SELECT DISTINCT(DATE_FORMAT(`tr_date`,'%Y-%m-%d')),1 FROM `tr03_datewise_pair` WHERE DATE_FORMAT(`tr_date`,'%Y-%m-%d') <> DATE_FORMAT(NOW(),'%Y-%m-%d') AND DATE_FORMAT(`tr_date`,'%Y-%m-%d') NOT IN (SELECT `tr_closing_date` FROM `tr05_closing_date`);
	END IF;
	
	IF proc = 2 THEN
		
			INSERT INTO `admin_hub`.`tr08_payout_date` (
				`tr_payout_date`,
				`tr_payout_is_fm`,
				`tr_payout_status`
			) 
			SELECT DISTINCT(DATE_FORMAT(`tr_date`,'%Y-%m-%d')),1,1 FROM `tr03_datewise_pair` WHERE DATE_FORMAT(`tr_date`,'%Y-%m-%d') <> DATE_FORMAT(NOW(),'%Y-%m-%d') AND DATE_FORMAT(`tr_date`,'%Y-%m-%d') NOT IN (SELECT `tr_closing_date` FROM `tr05_closing_date`);
		
	END IF;
	
	IF proc = 3 THEN
		SELECT `tr12_direct_date`.`tr_direct_date` INTO last_date FROM `tr12_direct_date` ORDER BY `tr_direct_id` DESC LIMIT 1;
		SELECT DATE_ADD(last_date,INTERVAL 7 DAY) INTO nextdate;
		
		IF DATE_FORMAT(nextdate,'%Y-%m-%d') < DATE_FORMAT(NOW(),'%Y-%m-%d') THEN
			INSERT INTO `admin_hub`.`tr12_direct_date` (
				`tr_direct_date`,
				`tr_direct_status`
			) 
			VALUES
			(
				nextdate,
				1
			) ;
		END IF; 
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_login`(
IN login_id VARCHAR(200),
IN user_pwd VARCHAR(200),
IN user_type INT(1),
OUT msg VARCHAR(200),
OUT msg1 INT(11)
)
BEGIN
DECLARE is_login, user_id, login_cont, is_status INT(2) DEFAULT 0;
IF user_type = 1 THEN
	SELECT COUNT(*) INTO is_login FROM `m00_admin_login` WHERE `m00_admin_login`.`m00_username`=login_id AND `m00_admin_login`.`m00_password`=user_pwd and `m00_admin_login`.`m00_admin_type`=user_type;
	IF is_login = 1 THEN
		SELECT 
		'9999999999'	AS 	`user_id`,
		'0'		AS	`profile_id`,
		login_id	AS 	`e_email`,
		'Super Admin'	AS 	`name`,
		'-1'		AS 	`designation`,
		'9044592446' 	AS 	`mobile_no`,
		'31-01-1991' 	AS 	`doj`,
		''		AS 	`or_m_userimage`,
		'true'		AS 	`logged_in`;
		SET msg = CONCAT("Login Successfully! Welcome ",login_id);
		SET msg1 = 1;
	ELSE
		SET msg = "Please Check Your Login id or Password ";
		SET msg1 = 0;
	END IF;
ELSE
	SELECT COUNT(*) INTO is_login FROM `tr01_login` WHERE `tr01_login`.`or_login_id`=login_id AND `tr01_login`.`or_login_pwd`=user_pwd;
	SELECT COUNT(*) INTO is_status FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_user_id`=login_id AND `m03_user_detail`.`or_m_status`=1;
	IF is_login = 1 THEN
		IF is_status = 1 THEN
			SELECT `m03_user_detail`.`or_m_reg_id` INTO user_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_user_id`=login_id;
			SELECT `tr01_login`.`or_login_count` INTO login_cont FROM `tr01_login` WHERE `tr01_login`.`or_login_id`=login_id;
			
			INSERT INTO `admin_hub`.`tr02_login_record` (
			  `tr_user_id`,
			  `tr_login_time`
			) 
			VALUES
			(
			  user_id,
			  NOW()
			) ;
			  
			UPDATE 
			  `admin_hub`.`tr01_login` 
			SET
			  `or_last_login` = NOW(),
			  `or_login_count` = (login_cont+1)
			WHERE `tr01_login`.`or_login_id` = login_id ;
			
			SELECT
			  `m03_user_detail`.`or_m_user_id`           AS `user_id`,
			  `m03_user_detail`.`or_m_reg_id`            AS `profile_id`,
			  login_id			             AS `e_email`,
			  `m03_user_detail`.`or_m_name`              AS `name`,
			  `m03_user_detail`.`or_m_designation`       AS `designation`,
			  `m03_user_detail`.`or_m_mobile_no`         AS `mobile_no`,
			  `m03_user_detail`.`or_m_dob`               AS `doj`,
			  fn_get_location(`m03_user_detail`.`or_m_state`) as location,
			  `m03_user_detail`.`or_m_userimage`	     AS `or_m_userimage`,
			  'true'				     AS `logged_in`
			FROM `m03_user_detail` 
			WHERE `m03_user_detail`.`or_m_user_id`=login_id;
			  
			SET msg = CONCAT("Login Successfully! Welcome Back ",login_id);
			SET msg1 = 2;
		ELSE
			SET msg = "User Status Disable Please Contact To Administrator!";
			SET msg1 = 3;
		END IF;
	ELSE
		SET msg = "Please Check Your Login id or Password ";
		SET msg1 = 0;
	END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_matching_release` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_matching_release` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_matching_release`(IN pay_date VARCHAR(20))
BEGIN
	DECLARE icr_id,regid INT(11);
	DECLARE transid,curre_date VARCHAR(50);
	DECLARE matching, direct, growth, new_matching, new_direct, new_growth DECIMAL(10,2);
	DECLARE c CURSOR FOR (SELECT `tr_apd_id`,`or_m_reg_id`,`tr_apd_match_incm`,`tr_apd_direct_incm`,`tr_apd_growth_incm` FROM `tr06_afterpublish_detail` WHERE `tr06_afterpublish_detail`.`tr_apd_is_paid`=0 AND `tr06_afterpublish_detail`.`tr_apd_is_weekly_paid`=0 AND DATE_FORMAT(`tr06_afterpublish_detail`.`tr_apd_publish_date`,'%Y-%m-%d')=DATE_FORMAT(pay_date,'%Y-%m-%d'));
	DECLARE EXIT HANDLER FOR NOT FOUND    
	BEGIN     
	END; 
	OPEN c;
	SELECT `get_transaction_id`() INTO transid;
	SELECT NOW() INTO curre_date;
	payout:LOOP
		FETCH c INTO icr_id, regid, matching, direct, growth;
		IF matching > 0 THEN
			SET new_matching = (SELECT get_extra_charges(regid,matching,3));
			INSERT INTO `admin_hub`.`tr07_manage_ledger` (
				`m_u_id`,
				`m_trans_id`,
				`m_cramount`,
				`m_dramount`,
				`m_description`,
				`m_transdate`,
				`m_refrence_id`,
				`m_ledger_type`,
				`m_bal_type`,
				`m_current_balance`,
				`m_datetime`
			) 
			VALUES
			(
				regid,
				transid,
				new_matching,
				0,
				"Matching Income.",
				curre_date,
				0,
				1,
				1,
				(get_available_bal(regid,1)+new_matching),
				curre_date
			) ;
		END IF;
		
		IF direct > 0 THEN
			SET new_direct = (SELECT get_extra_charges(regid,direct,3));
			INSERT INTO `admin_hub`.`tr07_manage_ledger` (
				`m_u_id`,
				`m_trans_id`,
				`m_cramount`,
				`m_dramount`,
				`m_description`,
				`m_transdate`,
				`m_refrence_id`,
				`m_ledger_type`,
				`m_bal_type`,
				`m_current_balance`,
				`m_datetime`
			) 
			VALUES
			(
				regid,
				transid,
				new_direct,
				0,
				"Sponsor Income.",
				curre_date,
				0,
				1,
				1,
				(get_available_bal(regid,1)+new_direct),
				curre_date
			) ;
		END IF;
		
		IF growth > 0 THEN
			SET new_growth = (SELECT get_extra_charges(regid,growth,3));
			INSERT INTO `admin_hub`.`tr07_manage_ledger` (
				`m_u_id`,
				`m_trans_id`,
				`m_cramount`,
				`m_dramount`,
				`m_description`,
				`m_transdate`,
				`m_refrence_id`,
				`m_ledger_type`,
				`m_bal_type`,
				`m_current_balance`,
				`m_datetime`
			) 
			VALUES
			(
				regid,
				transid,
				new_growth,
				0,
				"Growth Income.",
				curre_date,
				0,
				1,
				1,
				(get_available_bal(regid,1)+new_growth),
				curre_date
			) ;
		END IF;
		
		UPDATE 
		`admin_hub`.`tr06_afterpublish_detail`
		SET
		`tr06_afterpublish_detail`.`tr_apd_is_paid` = 1,
		`tr06_afterpublish_detail`.`tr_apd_is_weekly_paid` = 1,
		`tr06_afterpublish_detail`.`tr_apd_weekly_pay_date` = curre_date
		WHERE `tr06_afterpublish_detail`.`tr_apd_id` = icr_id ;
		
	END LOOP payout;
	CLOSE c;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_match_payout_detail2` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_match_payout_detail2` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_match_payout_detail2`(IN closing_from_date VARCHAR(200),IN closing_to_date VARCHAR(200) )
BEGIN
	DECLARE make_payout, lvl, max_lvl, pin_id, reg_id, check_payout, max_pair_id, topup, topid INT(2) DEFAULT 0;
	DECLARE is_panavail,fpair_leg,pos VARCHAR (200);
	DECLARE lis_able, fpc, dleft1, dright1, ris_able, tr_pair_id, is_active INT (11);
	DECLARE cleft, dleft, lcarry, rcarry, totl, totr, totdt, capping, tpleft, tpleft1, cright, dright DECIMAL(10,2) DEFAULT 0.00;
	DECLARE pair, admin_charges, tds_charges, final_income, today_income, match_payout, processing_charges, tpright, tpright1 DECIMAL(10,2) DEFAULT 0.00;
	
	DECLARE c CURSOR FOR (SELECT id,SUM(`tl`) AS totl,SUM(tr) AS totr,MAX(`dt`) AS totdt FROM (SELECT `or_m_reg_id` AS id ,SUM(`tr_today_left`)AS tl,SUM(`tr_today_right`) AS tr,`tr_date` AS dt FROM `tr03_datewise_pair` GROUP BY `or_m_reg_id`,`tr_date`) AS tbl WHERE DATE_FORMAT(`dt`,'%Y-%m-%d') BETWEEN DATE_FORMAT(closing_from_date,'%Y-%m-%d') AND DATE_FORMAT(closing_to_date,'%Y-%m-%d') GROUP BY id);
	DECLARE EXIT HANDLER FOR NOT FOUND    
	BEGIN     
	END; 
	OPEN c;
	payout:LOOP
		FETCH c INTO reg_id,totl,totr,totdt;
		SELECT IFNULL(`tr02_pair`.`tot_dltopup`,0), IFNULL(`tr02_pair`.`tot_drtopup`,0) INTO dleft1, dright1 FROM `tr02_pair` WHERE `or_m_reg_id` = reg_id LIMIT 1;
		
		SELECT `m_topup_pin_id` INTO topid FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id` = reg_id LIMIT 1;
	
		SELECT `get_package_amount`(3,topid) INTO topup;
		
		IF reg_id > 0 AND topup = 1500 THEN 
			SET check_payout=(SELECT COUNT(*) FROM `tr04_payout_detail` WHERE `tr04_payout_detail`.`or_m_reg_id`=reg_id AND `tr04_payout_detail`.`tr_payout_type`=1);
			
			--      Statrt 2:1 Mathcing
			SET pair = 0.00;
			SET capping=(1000.00);
			SET match_payout=0;
			
			SET pos=(SELECT `tr02_pair`.`tr_fpair_leg` FROM `tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id);
			
			SELECT IFNULL(`tot_left_carry`,0.00), IFNULL(`tot_right_carry`,0.00) INTO cleft, cright FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1;
			
			IF (pos!='0' AND pos!='') THEN
				
				IF (check_payout=0) THEN
					
					SET tpleft=(cleft+totl);
					SET tpright=(cright+totr);
					
					IF ((tpright>1 AND tpleft<>0) OR (tpleft>1 AND tpright<>0)) THEN
						
							
						IF (pos='R') THEN
							
							SET pair=1;
							SET lcarry = (tpleft-1);
							SET rcarry=(tpright-2);
							SET tpright1=2;
							SET tpleft1=1;
							
						END IF;
						IF (pos='L') THEN
							
							SET pair=1;
							SET lcarry = (tpleft-2);
							SET rcarry=(tpright-1);
							SET tpright1=1;
							SET tpleft1=2;
							
						END IF;
					
						
						SET tpleft = lcarry;
						SET tpright = rcarry;
						SET match_payout=(pair*500);
						-- SET pair = 0.00;
						
						IF ((tpleft > tpright) AND tpright<>0) THEN
							SET pair = (pair+tpright);
							SET lcarry = (tpleft-pair);
							SET rcarry=0;
							SET match_payout = match_payout+(pair*500);
						END IF;
						
						IF ((tpleft < tpright) AND tpleft<>0) THEN 
							SET pair = (pair+tpleft);
							SET lcarry=0;
							SET rcarry=(tpright-pair);
							SET match_payout = match_payout+(pair*500);
						END IF;
						
						IF ((tpleft = tpright) AND tpleft<>0 AND tpright<>0) THEN
							SET pair = (pair+tpleft);
							SET lcarry=0;
							SET rcarry=0;
							SET match_payout = match_payout+(pair*500);
						END IF;
						
						IF ( dleft1>=1 AND dright1>=1) THEN
						
							SET tpleft=((SELECT IFNULL(`tot_left_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1)+pair);
							SET tpright=((SELECT IFNULL(`tot_right_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1)+pair);
							
						ELSE
							
							SET rcarry=(cright+totr);
							SET lcarry=(cleft+totl);
							SELECT IFNULL(`tot_left_pay`,0), IFNULL(`tot_right_pay`,0) INTO tpleft, tpright FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1;
							
						END IF;
						
						UPDATE `admin_hub`.`tr02_pair` SET
						`tr02_pair`.`tot_left_pay`= tpleft,
						`tr02_pair`.`tot_right_pay`= tpright,
						`tr02_pair`.`tot_left_carry`= lcarry,
						`tr02_pair`.`tot_right_carry`=rcarry
						WHERE `tr02_pair`.`or_m_reg_id` = reg_id ; 
						
					ELSE
						
						UPDATE `admin_hub`.`tr02_pair`
						SET
						`tr02_pair`.`tot_left_carry`= tpleft,
						`tr02_pair`.`tot_right_carry`=tpright
						WHERE `tr02_pair`.`or_m_reg_id` = reg_id ; 
						
					END IF;
					
					
				ELSE
					SET pair =0.00;
					SET tpleft=(cleft+totl);
					SET tpright=(cright+totr);
					
					IF (tpleft > tpright) THEN
						SET pair = (pair+tpright);
						SET lcarry = (tpleft-pair);
						SET rcarry=0;
					END IF;
					
					IF (tpleft < tpright) THEN 
						SET pair = (pair+tpleft);
						SET lcarry=0;
						SET rcarry=(tpright-pair);
					END IF;
					
					IF (tpleft = tpright) 
					THEN
						SET pair = (pair+tpleft);
						SET lcarry=0;
						SET rcarry=(tpright-pair);
					END IF;
					
					SET match_payout = match_payout+(pair*500);
					
					SET tpleft=((SELECT IFNULL(`tot_left_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1)+pair);
					SET tpright=((SELECT IFNULL(`tot_right_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1)+pair);
					
					UPDATE `admin_hub`.`tr02_pair` SET
					`tr02_pair`.`tot_left_pay`= tpleft,
					`tr02_pair`.`tot_right_pay`= tpright,
					`tr02_pair`.`tot_left_carry`= lcarry,
					`tr02_pair`.`tot_right_carry`=rcarry
					WHERE `tr02_pair`.`or_m_reg_id` = reg_id ; 
					
				END IF;
				
				IF match_payout > capping THEN 
					SET match_payout=capping;
				END IF;
				
				IF (match_payout > 0 AND dleft1>=1 AND dright1>=1) THEN
					
					SET admin_charges = (SELECT get_extra_charges('',match_payout,1));
					    
					SET processing_charges = (SELECT get_extra_charges('',match_payout,1));
					
					SET tds_charges = (SELECT get_extra_charges(reg_id,match_payout,2));
					
					SET final_income=(match_payout-(admin_charges+tds_charges+processing_charges));
					
					INSERT INTO `admin_hub`.`tr04_payout_detail` (
						`or_m_reg_id`,
						`tr_from_payout_date`,
						`tr_to_payout_date`,
						`tr_payout_entrydate`,
						`tr_previous_lcarry`,
						`tr_previous_rcarry`,
						`tr_payout_type`,
						`tr_payout_level`,
						`tr_payout_tot_lft`,
						`tr_payout_tot_rht`,
						`tr_payout_pair`,
						`tr_payout_lcarry`,
						`tr_payout_rcarry`,
						`tr_payout_amount`,
						`tr_payout_admincharges`,
						`tr_payout_tdscharges`,
						`tr_payout_proce_charge`,
						`tr_payout_final_income`,
						`tr_payout_descrip`,
						`tr_payout_ispublish`,
						`tr_payout_is_delete`
					) 
					VALUES
					(
						reg_id,
						closing_to_date,
						closing_to_date,
						NOW(),
						cleft,
						cright,
						1,
						1,
						totl,
						totr,
						pair,
						lcarry,
						rcarry,
						match_payout,
						admin_charges,
						tds_charges,
						processing_charges,
						final_income,
						'Match Income',
						0,
						0
					) ;
					-- CALL sp_fill_spot_income(reg_id,closing_to_date);
				END IF;  
				
				ELSE
				SET rcarry=(cright+totr);
				SET lcarry=(cleft+totl);
				SELECT IFNULL(`tot_left_pay`,0), IFNULL(`tot_right_pay`,0) INTO tpleft, tpright FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1;
				
				UPDATE `admin_hub`.`tr02_pair` SET
				`tr02_pair`.`tot_left_pay`= tpleft,
				`tr02_pair`.`tot_right_pay`= tpright,
				`tr02_pair`.`tot_left_carry`= lcarry,
				`tr02_pair`.`tot_right_carry`=rcarry
				WHERE `tr02_pair`.`or_m_reg_id` = reg_id ; 
				
			END IF;
		END IF;
	END LOOP payout;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_member` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_member` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_member`(
	IN or_m_user_id VARCHAR (100),
	IN or_m_designation VARCHAR (11),
	IN or_m_name VARCHAR (500),
	IN or_m_dob VARCHAR(200),
	IN or_m_gurdian_name VARCHAR (29),
	IN or_member_joining_date VARCHAR(30),
	IN or_m_gender VARCHAR (20),
	IN or_m_email VARCHAR (100),
	IN or_m_landline_no VARCHAR (20),
	IN or_m_mobile_no VARCHAR (20),
	IN or_m_address VARCHAR (500),
	IN or_m_pincode VARCHAR (20),
	IN or_m_country INT (11),
	IN or_m_state INT (11),
	IN or_m_userimage VARCHAR (100),
	IN or_m_city INT (11),
	IN or_m_status INT (2),
	IN or_m_intr_id VARCHAR (200),
	IN or_m_intr_name VARCHAR (200),
	IN or_m_aff_id INT (11),
	IN or_m_upliner_id INT (11),
	IN or_m_position VARCHAR (20),
	IN m_pin_id INT (11),
	IN or_m_regdate VARCHAR(200),
	IN or_m_n_name VARCHAR(200),
	IN or_m_n_age INT(3),
	IN or_m_n_relation VARCHAR(200),
	IN or_m_b_ifscode VARCHAR (100),
	IN or_m_b_cbsacno VARCHAR (100),
	IN or_m_b_name INT (11),
	IN or_m_b_branch VARCHAR (100),
	IN or_m_b_pancard VARCHAR (100),
	IN or_m_b_adhar VARCHAR(30),
	IN or_login_pwd VARCHAR (20),
	IN or_pin_pwd VARCHAR (20),
	IN or_reg_from VARCHAR (20),
	IN proc INT (2),
	OUT msg VARCHAR (100)
)
BEGIN
	DECLARE user_id, is_active, topup_pin INT (11) ;
	DECLARE user_reg_id, topup_date,exists_reg_id VARCHAR (200) ;
	DECLARE pack_amt DECIMAL(10,2);
	
	#START TRANSACTION ;
	
	#SET user_reg_id = (SELECT fx_rand_string(8));
	#set exists_reg_id = (select  `or_m_user_id` from `m03_user_detail` where `or_m_user_id`= user_reg_id);
	
	
        	
	
	
	IF (proc = 1) THEN 
		
		
		INSERT INTO `admin_hub`.`m03_user_detail` (
			`or_m_user_id`,
			`or_m_name`,
			`or_m_dob`,
			`or_m_gurdian_name`,
			`or_member_joining_date`,
			`or_m_gender`,
			`or_m_email`,
			`or_m_landline_no`,
			`or_m_mobile_no`,
			`or_m_address`,
			`or_m_pincode`,
			`or_m_country`,
			`or_m_userimage`,
			`or_m_status`,
			`or_m_intr_id`,
			`or_m_intr_name`,
			`or_m_aff_id`,
			`or_m_upliner_id`,
			`or_m_position`,
			`m_pin_id`,
			`m_topup_pin_id`,
			`or_m_regdate`,
			`or_m_topup_date`,
			`or_reg_from`
		) 
		VALUES
	    (
			or_m_user_id,
			or_m_name,
			or_m_dob,
			or_m_gurdian_name,
			now(),
			or_m_gender,
			or_m_email,
			or_m_landline_no,
			or_m_mobile_no,
			or_m_address,
			or_m_pincode,
			or_m_country,
			'xnsmi50n.png',
			or_m_status,
			(SELECT  tn.or_m_reg_id FROM  `m03_user_detail` as tn WHERE tn.or_m_email =  or_m_intr_id),
			(SELECT  tns.or_m_name FROM  `m03_user_detail` as  tns WHERE tns.or_m_email =  or_m_intr_id),
			0,
			0,
			0,
			0,
			0,
			now(),
			topup_date,
			or_reg_from
		) ;
	    
		SET user_id = (SELECT or_m_reg_id FROM m03_user_detail WHERE `m03_user_detail`.`or_m_user_id` = or_m_user_id) ;
		
		IF (user_id != 0) THEN 
			
		    INSERT INTO `admin_hub`.`m05_user_nominee` (
				`or_m_id`,
				`or_m_n_name`,
				`or_m_n_age`,
				`or_m_n_relation`,
				`or_m_n_status`
			)
			VALUES
			(
			    user_id,
			    or_m_n_name,
			    or_m_n_age,
			    or_m_n_relation,
			    or_m_n_status
			);
		    
			INSERT INTO `admin_hub`.`m04_user_bank` (
				`or_m_id`,
				`or_m_name`,
				`or_m_b_ifscode`,
				`or_m_b_cbsacno`,
				`or_m_b_name`,
				`or_m_b_branch`,
				`or_m_b_pancard`,
				`or_m_b_adhar`,
				`or_m_b_status`
			) 
			VALUES
			(
				user_id,
				or_m_name,
				or_m_b_ifscode,
				or_m_b_cbsacno,
				or_m_b_name,
				or_m_b_branch,
				or_m_b_pancard,
				or_m_b_adhar,
				1
			) ;
			
		    
			INSERT INTO `admin_hub`.`tr01_login` (
				`or_user_id`,
				`or_login_id`,
				`or_login_pwd`,
				`or_pin_pwd`,
				`or_login_count`,
				`or_login_type`
			) 
			VALUES
		    (
				user_id,
				or_m_user_id,
				or_login_pwd,
				or_login_pwd,
				'0',
				'1'
			) ;
		    
			INSERT INTO `admin_hub`.`tr02_pair` (
				`or_m_reg_id`,
				`tot_left`,
				`tot_right`,
				`tot_direct_left`,
				`tot_direct_right`,
				`tot_lreg`,
				`tot_ltopup`,
				`tot_rreg`,
				`tot_rtopup`,
				`tot_left_pay`,
				`tot_right_pay`,
				`tr_user_fpc`,
				`tr_fpair_leg`,
				`pair_complete_date`,
				`last_pay_date`
			) 
			VALUES
		    (
				user_id,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				DATE_FORMAT('2018-12-25', '%Y-%m-%d'),
				NOW()
			) ;
		     
			SET msg = user_reg_id ;
		END IF ;
	END IF ;
	
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_member_detail` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_member_detail` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_member_detail`(IN querey VARCHAR(10000))
BEGIN
 SET @asd = CONCAT("SELECT
  `m03_user_detail`.`or_m_user_id`         	AS `Login_Id`,
  `m03_user_detail`.`or_m_reg_id`		AS `regid`,
  `m03_user_detail`.`or_m_name`      		AS `Associate_Name`,
  `m03_user_detail`.`or_m_gurdian_name`		AS `Parent_Name`,
  `m03_user_detail`.`or_m_dob`			AS `DOB`,
  `m03_user_detail`.`or_m_gender`		AS `Gender`,
  `m03_user_detail`.`or_m_regdate`   		AS `Joining_Date`,
  DATE_FORMAT(`m03_user_detail`.`or_m_regdate`,'%d-%b-%Y')   		AS `Joining_Date_1`,
  `get_detail`(`m03_user_detail`.`or_m_upliner_id`,4)   AS Upliner_Userid,
  `get_detail`(`m03_user_detail`.`or_m_upliner_id`,2)   AS Upliner_Name,
  `m03_user_detail`.`or_m_intr_id`	     	AS `introid`,
  `get_detail`(`m03_user_detail`.`or_m_intr_id`,4) AS Intro_Userid,
  `get_detail`(`m03_user_detail`.`or_m_intr_id`,2) AS Intro_Name,
  `m02_location_1`.`m_loc_name`     		AS `City`,
  `m03_user_detail`.`or_m_mobile_no` 		AS `Mobile_No`,
  `m03_user_detail`.`or_m_email`     		AS `Email`,
  `m03_user_detail`.`or_m_address`		AS `Address`,
  `m03_user_detail`.`or_m_pincode`		AS `Pincode`,
  `m03_user_detail`.`or_m_state`		AS `STATE_ID`,
  `m03_user_detail`.`or_m_city`			AS `City_ID`,
  `m03_user_detail`.`or_m_userimage`		AS `User_image`,
  (CASE WHEN (`m03_user_detail`.`or_m_position` = 'L') THEN 'Left' WHEN (`m03_user_detail`.`or_m_position` = 'R') THEN 'Right' ELSE `m03_user_detail`.`or_m_position` END) AS `USER_POSITION_DESC`,
  `tr01_login`.`or_login_pwd`        		AS `Password`,
  `tr01_login`.`or_pin_pwd`          		AS `Pin_Password`,
  `m02_location`.`m_loc_name`        		AS `State`,
  `m04_user_bank`.`or_m_b_branch`        	AS `Branch`,
  `m04_user_bank`.`or_m_b_cbsacno`    		AS `AcNo`,
  `m04_user_bank`.`or_m_b_ifscode`    		AS `Ifsc`,
  `m04_user_bank`.`or_m_b_pancard`		AS `Pancard`,
  `m04_user_bank`.`or_m_b_adhar`		AS `Adhar`,
  fn_get_bank_name(`m04_user_bank`.`or_m_b_name`)	AS `Bankname`,
  `m04_user_bank`.`or_m_b_name`			AS `BANKID`,
  `m05_user_nominee`.`or_m_n_name`     AS `or_m_n_name`,
  `m05_user_nominee`.`or_m_n_age`      AS `or_m_n_age`,
  `m05_user_nominee`.`or_m_n_relation` AS `or_m_n_relation`,
  `get_package_amount`(3,`m03_user_detail`.`m_topup_pin_id`) as Topup_amt
  
FROM `m03_user_detail`
      LEFT JOIN `tr01_login`
          ON ((`m03_user_detail`.`or_m_reg_id` = `tr01_login`.`or_user_id`))
      LEFT JOIN `m02_location`
          ON ((`m03_user_detail`.`or_m_state` = `m02_location`.`m_loc_id`))
      LEFT JOIN `m02_location` `m02_location_1`
          ON ((`m03_user_detail`.`or_m_city` = `m02_location_1`.`m_loc_id`))
      LEFT JOIN `m04_user_bank`
          ON ((`m03_user_detail`.`or_m_reg_id` = `m04_user_bank`.`or_m_id`))
      LEFT JOIN `m05_user_nominee`
          ON ((`m03_user_detail`.`or_m_reg_id` = `m05_user_nominee`.`or_m_id`))
          where ",querey);
   
  PREPARE zxc FROM @asd;
  EXECUTE zxc;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_member_pin_bank` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_member_pin_bank` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_member_pin_bank`(IN or_m_reg_id INT(11))
BEGIN
SELECT  `m09_pin_detail`.`m_pin` 				AS PIN ,
DATE_FORMAT(`m09_pin_detail`.`m_pin_gen_date`,'%Y-%m-%d') 	AS GENERATION_DATE ,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`=1) THEN 'In-Active' WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN 'Active' ELSE 'Deactive' END)     AS PIN_Status,
`m06_package`.`m_pack_name`					AS Package_name,
`m06_package`.`m_pack_fee`      				AS Amount,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN `m03_user_detail`.`or_m_user_id` ELSE '' END)	AS Associate_id,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN `m03_user_detail`.`or_m_name` ELSE '' END) 		AS Associate_name,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN 'Registration' WHEN (`m09_pin_detail`.`m_pin_is_reg`=2) THEN 'Topup' ELSE 'NO PIN' END)	AS PIN_IS_REG,
(CASE WHEN (`m09_pin_detail`.`m_pin_gen_by`=0) THEN 'ADMIN'  ELSE '' END) 								AS GENERATED_BY
FROM
    `admin_hub`.`m09_pin_detail`
    LEFT JOIN `admin_hub`.`m03_user_detail` 
        ON (`m09_pin_detail`.`m_pin_assigned_to` = `m03_user_detail`.`or_m_reg_id`)
        
    LEFT JOIN `admin_hub`.`m03_user_detail` AS `m03_user_detail_1`
        ON (`m09_pin_detail`.`or_m_reg_id` = `m03_user_detail_1`.`or_m_reg_id`)
        
    LEFT JOIN `admin_hub`.`m06_package` 
        ON (`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`)
        
WHERE (CASE WHEN(`m_pin_status` = 1) THEN (`m09_pin_detail`.`m_pin_assigned_to` = or_m_reg_id) ELSE (`m09_pin_detail`.`or_m_reg_id` = or_m_reg_id) END) 
ORDER BY `m06_package`.`m_pack_fee` ;
      
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_member_pin_detail` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_member_pin_detail` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_member_pin_detail`(IN queery VARCHAR(1000))
BEGIN
  SET @asd = CONCAT("SELECT 
	`m03_user_detail`.`or_m_user_id` 	AS LoginId,
	`m03_user_detail`.`or_m_name` 		AS `Associate_Name`,
	`m06_package`.`m_pack_name` 		AS Plan_Name,
	DATE_FORMAT(m_pin_gen_date,'%d-%m-%Y') 	AS Generation_date,
	COUNT(`m_pin_gen_date`) 		AS Total_Count,
	(COUNT(`m_pin_gen_date`)*(`m06_package`.`m_pack_fee`)) AS Total_Amount 
  FROM
    `m09_pin_detail` 
    RIGHT JOIN `admin_hub`.`m03_user_detail` 
      ON (`m09_pin_detail`.`m_pin_assigned_to` = `m03_user_detail`.`or_m_reg_id`) 
    LEFT JOIN `admin_hub`.`m06_package` 
      ON (`m06_package`.`m_pack_id` = `m09_pin_detail`.`m_pack_id`)
      WHERE  ",queery);
  
   PREPARE zxc FROM @asd;
  EXECUTE zxc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_member_topup` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_member_topup` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_member_topup`(
	IN tr10_mem_uid INT(11),
	IN tr10_mem_pack INT(11),
	IN tr10_mem_amount INT(11),
	IN tr10_mem_status INT(2),
	OUT msg TEXT
)
BEGIN
	DECLARE curr_bal, admin_charges, tds_charges, final_income, payout, mem_amount DECIMAL(10,2);
	DECLARE Check_refferal, into_id, check_topup INT (2) ;
	DECLARE is_panavail VARCHAR(50);
	
	SELECT COUNT(*) INTO check_topup FROM `tr10_mem_topup` WHERE `tr10_mem_topup`.`tr10_mem_uid` = tr10_mem_uid LIMIT 1;
	IF check_topup = 0 THEN
	SELECT get_package_amount(3,tr10_mem_amount) INTO mem_amount;
	
	IF tr10_mem_uid <> '' AND tr10_mem_pack <> '' AND tr10_mem_amount <> '' THEN
		
		UPDATE 
		`admin_hub`.`m09_pin_detail`
		SET
		`m09_pin_detail`.`m_pin_assigned_to` = tr10_mem_uid,
		`m09_pin_detail`.`m_pin_status` = 2
		WHERE `m09_pin_detail`.`m_pin_id` = tr10_mem_amount ;
		
		INSERT INTO `admin_hub`.`tr10_mem_topup` (
			`tr10_mem_uid`,
			`tr10_mem_pack`,
			`tr10_mem_amount`,
			`tr10_mem_status`
		) 
		VALUES
		(
			tr10_mem_uid,
			tr10_mem_pack,
			mem_amount,
			tr10_mem_status
		) ;
		
		SELECT `m00_setconfig`.`m00_value` INTO `Check_refferal` FROM `m00_setconfig` WHERE `m00_setconfig`.`m00_name`='REFERAL_INCOME' LIMIT 1;
		
		IF Check_refferal = 1 THEN
			
			SELECT get_package_amount(1,tr10_mem_pack) INTO payout;
			
			SELECT `or_m_intr_id` INTO into_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=tr10_mem_uid;
			SELECT `or_m_b_pancard` INTO is_panavail FROM `m04_user_bank` WHERE `m04_user_bank`.`or_m_id`= into_id;
			
			SET admin_charges = ((payout*10)/100);
			
			IF (is_panavail != "" || is_panavail != "0") THEN
				SET tds_charges = ((payout*5)/100);
				ELSE
				SET tds_charges = ((payout*20)/100);
			END IF;
			SET final_income = (payout-(admin_charges+tds_charges));
			
			IF into_id != 0 THEN
				
				INSERT INTO `tr04_payout_detail` (
					`or_m_reg_id`,
					`tr_from_payout_date`,
					`tr_to_payout_date`,
					`tr_payout_entrydate`,
					`tr_payout_type`,
					`tr_payout_level`,
					`tr_payout_amount`,
					`tr_payout_admincharges`,
					`tr_payout_tdscharges`,
					`tr_payout_final_income`,
					`tr_payout_descrip`,
					`tr_payout_ispublish`,
					`tr_payout_is_delete`
				) 
				VALUES
				(
					into_id,
					NOW(),
					NOW(),
					NOW(),
					2,
					tr10_mem_uid,
					payout,
					admin_charges ,
					tds_charges ,
					final_income,
					'Refferal Income',
					0,
					0
				) ;
			END IF;
		END IF;
		
		CALL `sp_datewise_data`(tr10_mem_uid,mem_amount,NOW(),@dd);
		
		SET msg = "Topup Successfully";
		ELSE
		SET msg = "Topup Reject Due to Low Balance";
	END IF;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_mlm_closing` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_mlm_closing` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_mlm_closing`(IN closing_from_date VARCHAR(20),IN closing_to_date VARCHAR(20) )
BEGIN
	DECLARE reg_id, is_active, check_topup INT(11);
	DECLARE is_panavail VARCHAR (200);
	DECLARE cleft, lcarry, rcarry, totl, totr, totdt, capping DECIMAL(10,2) DEFAULT 0.00;
	DECLARE tpleft, cright, dright, tpright, match_payout, pair, admin_charges, tds_charges, final_income DECIMAL(10,2) DEFAULT 0.00;
	DECLARE c CURSOR FOR (SELECT id, SUM(`tl`) AS totl, SUM(tr) AS totr, MAX(`dt`) AS totdt FROM (SELECT `or_m_reg_id` AS id ,SUM(`tr_today_lvol`)AS tl,SUM(`tr_today_rvol`) AS tr,`tr_date` AS dt FROM `tr03_datewise_pair` GROUP BY `or_m_reg_id`,`tr_date`) AS tbl WHERE `dt`BETWEEN DATE_FORMAT(closing_from_date,'%Y-%m-%d') AND DATE_FORMAT(closing_to_date,'%Y-%m-%d') GROUP BY id);
	DECLARE EXIT HANDLER FOR NOT FOUND
	BEGIN
	END;
	OPEN c;
	payout:LOOP
		FETCH c INTO reg_id, totl, totr, totdt;
		
		SELECT `m03_user_detail`.`or_m_status` INTO is_active FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id` = reg_id LIMIT 1;
		SELECT COUNT(*) INTO check_topup FROM `tr10_mem_topup` WHERE `tr10_mem_topup`.`tr10_mem_uid` = reg_id;
		
		IF reg_id > 0 AND is_active = 1 AND check_topup > 0 THEN
			SET pair = 0.00;
			SET rcarry = 0.00;
			SET lcarry = 0.00;
			
			SET capping = 100000;
 			
			SET match_payout=0;
			SELECT IFNULL(`tot_left_carry`,0.00), IFNULL(`tot_right_carry`,0.00) INTO cleft, cright FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id LIMIT 1; 
			
			SET tpleft=(cleft+totl);
			SET tpright=(cright+totr);
			IF tpleft > tpright THEN                                              
				SET pair = (pair+tpright);
				SET lcarry = (tpleft-pair);
				SET rcarry=0;
			END IF;
			
			IF tpleft < tpright THEN 
				SET pair = (pair+tpleft);
				SET lcarry=0;
				SET rcarry=(tpright-pair);
			END IF;
			
			IF tpleft = tpright THEN
				SET pair = (pair+tpleft);
				SET lcarry=0;
				SET rcarry=(tpright-pair);
			END IF;
			
			SET match_payout = (pair*.07);
			
			SET tpleft=((SELECT IFNULL(`tot_left_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id)+pair);
			SET tpright=((SELECT IFNULL(`tot_right_pay`,0) FROM `tr02_pair` WHERE `or_m_reg_id`=reg_id)+pair);
			
			UPDATE `admin_hub`.`tr02_pair`
			SET
			`tr02_pair`.`tot_left_pay`= tpleft,
			`tr02_pair`.`tot_right_pay`= tpright,
			`tr02_pair`.`tot_left_carry`= lcarry,
			`tr02_pair`.`tot_right_carry`=rcarry
			WHERE `tr02_pair`.`or_m_reg_id` = reg_id ; 
			
			IF match_payout > capping THEN
				SET match_payout=capping;
			END IF;
			
			SET is_panavail = (SELECT `or_m_b_pancard` FROM `admin_hub`.`m04_user_bank` WHERE `or_m_id`=reg_id LIMIT 1);
			
			IF match_payout > 0 THEN
				SET admin_charges = ((match_payout*0)/100);      
				IF is_panavail != "" THEN
					SET tds_charges = ((match_payout*0)/100);
					ELSE
					SET tds_charges = ((match_payout*0)/100);
				END IF;     
				
				SET final_income = (match_payout-(admin_charges+tds_charges));
				
				INSERT INTO `admin_hub`.`tr04_payout_detail` (
					`or_m_reg_id`,
					`tr_from_payout_date`,
					`tr_to_payout_date`,
					`tr_payout_entrydate`,
					`tr_previous_lcarry`,
					`tr_previous_rcarry`,
					`tr_payout_type`,
					`tr_payout_level`,
					`tr_payout_tot_lft`,
					`tr_payout_tot_rht`,
					`tr_payout_pair`,
					`tr_payout_lcarry`,
					`tr_payout_rcarry`,
					`tr_payout_amount`,
					`tr_payout_admincharges`,
					`tr_payout_tdscharges`,
					`tr_payout_final_income`,
					`tr_payout_descrip`,
					`tr_payout_ispublish`,
					`tr_payout_is_delete`
				) 
				VALUES
				(
					reg_id,
					closing_to_date,
					closing_to_date,
					NOW(),
					cleft,
					cright,
					1,
					1,
					totl,
					totr,
					pair,
					lcarry,
					rcarry,
					match_payout,
					admin_charges ,
					tds_charges ,
					final_income,
					'Match Income',
					0,
					0
				) ;
			END IF;  
		END IF;
	END LOOP payout;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_news` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_news` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_news`(
  IN id INT,
  IN m_news_title VARCHAR(250),
  IN m_news_des TEXT,
  IN m_news_statusint INT,
  IN m_affid INT,
  IN proc_id INT
)
BEGIN
IF (proc_id = '1') THEN
	INSERT INTO `m24_news` (`m_news_title`,`m_news_des`,`m_news_status`,`m_affid`,`m_entrydate`) VALUES (m_news_title, m_news_des, m_news_statusint, m_affid, NOW());
END IF;
IF (proc_id = '2') THEN
	UPDATE 
	  `m24_news` 
	SET
	  `m24_news`.`m_news_title` = m_news_title,
	  `m24_news`.`m_news_des` = m_news_des,
	  `m24_news`.`m_news_status` = m_news_statusint,
	  `m24_news`.`m_affid` = m_affid,
	  `m24_news`.`m_entrydate` = NOW() 
	WHERE `m24_news`.`m_news_id` = id ;
END IF;
IF (proc_id = '3') THEN
	UPDATE 
	  `m24_news` 
	SET
	  `m24_news`.`m_news_status` = m_news_statusint,
	  `m24_news`.`m_entrydate` = NOW() 
	WHERE `m24_news`.`m_news_id` = id ;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_next_month_roi` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_next_month_roi` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_next_month_roi`()
BEGIN
DECLARE reg_id, pack_id, date_diff, old_roi, invest_id, total_get_roi INT(11);
DECLARE amt,roi_amount,pay_number DECIMAL(10,2);
DECLARE topup_date, max_date, trans_id VARCHAR(30);
DECLARE c CURSOR FOR SELECT tr10_pay_number,`tr10_mem_id`, `tr10_mem_uid`, `tr10_mem_pack`, `tr10_mem_amount`, `tr10_mem_date` FROM `tr10_mem_topup` WHERE tr10_mem_txn_approve_date < current_date and    `tr10_mem_status` = '1';
	DECLARE EXIT HANDLER FOR NOT FOUND
	BEGIN
	END;
	SELECT `get_transaction_id`() INTO trans_id;
	OPEN c;
	payout:LOOP
		FETCH c INTO pay_number,invest_id, reg_id, pack_id, amt, topup_date;
		
     set roi_amount = (select  m06_package.`m_pack_roi_income` from `m06_package` where  m06_package.`m_pack_id` = pack_id);		
		
		   
		   UPDATE `tr10_mem_topup` SET  tr10_pay_number = pay_number+1;	
		
		
		
		
				INSERT INTO `admin_hub`.`tr07_manage_ledger` (
				  `m_u_id`,
				  `m_trans_id`,
				  `m_cramount`,
				  `m_dramount`,
				  `m_description`,
				  `m_transdate`,
				  `m_refrence_id`,
				  `m_ledger_type`,
				  `m_bal_type`,
				  `m_current_balance`,
				  `m_datetime`
				) 
				VALUES
				  (
				    reg_id,
				    date_format(now(),'%Y%m%d%H%i%s'),
				    roi_amount,
				    0,
				    "Roi Amount Credited",
				    NOW(),
				    invest_id,
				    3,
				    1,
				    (`get_available_bal`(reg_id,1)+150),
				    NOW()
				  ) ;
		UPDATE `tr27_roi_dates` SET  `tr_status` = 1 where `tr_topup_id` = invest_id and tr_pay_date = current_date;#done
                 
		IF(pay_number=89) THEN 
		   UPDATE `tr10_mem_topup` SET  tr10_mem_status = 3 where `tr10_mem_id` = invest_id ;#done	
		 END IF;
		 
		 
		END LOOP payout;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pair_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pair_data` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pair_data`(IN txtlogin INT (11))
BEGIN
	DECLARE tot_left ,tot_right, tot_direct_left, tot_direct_right, tot_lreg,tot_ltopup,tot_rreg,tot_rtopup,tot_left_pay,tot_right_pay,tr_user_fpc,tr_fpair_leg,upliner_id,is_active,intr_id,reg_id,pin_id INT (11);
	DECLARE reg_date,pos,topup_date,lastpay_date,first_pairleg VARCHAR (25);
	DECLARE pack_amt DECIMAL(10,2);
	DECLARE ltoup, rtopup INT(11);
	
	SELECT IFNULL(`or_m_status`,0), IFNULL(`or_m_upliner_id`,0), IFNULL(`or_m_intr_id`,0), IFNULL(`or_m_position`,0), IFNULL(`or_m_regdate`,0), IFNULL(`or_m_topup_date`,0), IFNULL(`m_pin_id`,0) INTO is_active, reg_id, intr_id, pos, reg_date, topup_date, pin_id FROM `admin_hub`.`m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=txtlogin LIMIT 1;
	
	pair_details: WHILE reg_id>0 DO
	SET ltoup = 0;
	SET rtopup = 0;
	SELECT IFNULL(`tr02_pair`.`tot_left`,0), IFNULL(`tr02_pair`.`tot_right`,0), IFNULL(`tr02_pair`.`tot_direct_left`,0), IFNULL(`tr02_pair`.`tot_direct_right`,0), IFNULL(`tr02_pair`.`tot_lreg`,0), IFNULL(`tr02_pair`.`tot_rreg`,0), IFNULL(`tr02_pair`.`tr_fpair_leg`,0), IFNULL(`tr02_pair`.`tot_ltopup`,0), IFNULL(`tr02_pair`.`tot_rtopup`,0), `tr02_pair`.`last_pay_date`
	INTO tot_left, tot_right, tot_direct_left, tot_direct_right, tot_lreg, tot_rreg, first_pairleg, ltoup, rtopup, lastpay_date FROM `admin_hub`.`tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id LIMIT 1;
	
	SELECT get_package_amount(3,pin_id) INTO pack_amt;
	
	IF pos = 'L' THEN
		SET tot_left = tot_left+1;
		SET tot_lreg = tot_lreg+1;
		
		IF pack_amt = 1500 THEN
			SET ltoup = ltoup + 1;
		END IF;
		
		IF tot_left >= 2 && tot_right = 1 && first_pairleg = 0 THEN
			SET first_pairleg = 'L';
		END IF ; 
		
		IF tot_left = 1 && tot_right >= 2 && first_pairleg = 0 THEN
			SET first_pairleg = 'R';
		END IF ; 
		
		IF reg_id = intr_id THEN
			SET tot_direct_left = tot_direct_left+1;
		END IF ;  
		
		UPDATE 
		`admin_hub`.`tr02_pair` 
		SET
		`tr02_pair`.`tot_left` = tot_left,
		`tr02_pair`.`tot_direct_left` = tot_direct_left,
		`tr02_pair`.`tot_lreg` = tot_lreg,
		`tr02_pair`.`tot_ltopup` = ltoup,
		`tr02_pair`.`tr_fpair_leg`=first_pairleg,
		`tr02_pair`.`pair_complete_date`=DATE_FORMAT(lastpay_date,'%Y-%m-%d'),
		`tr02_pair`.`last_pay_date`=DATE_FORMAT(reg_date,'%Y-%m-%d')
		WHERE `tr02_pair`.`or_m_reg_id` = reg_id ;
	END IF;
	
	IF pos = 'R' THEN
	    SET tot_right = tot_right+1;
	    SET tot_rreg = tot_rreg+1;
	    
		IF pack_amt = 1500 THEN
			SET rtopup = rtopup + 1;
		END IF;
	    
		IF reg_id = intr_id THEN
			SET tot_direct_right = tot_direct_right+1;
		END IF ;
		
		IF tot_left >= 2 && tot_right = 1 && first_pairleg = 0 THEN
			SET first_pairleg = 'L';
		END IF ;
		
		IF tot_left = 1 && tot_right >= 2 && first_pairleg = 0 THEN
			SET first_pairleg = 'R';
		END IF ;
		
		UPDATE 
		`admin_hub`.`tr02_pair` 
		SET
		`tr02_pair`.`tot_right` = tot_right,
		`tr02_pair`.`tot_direct_right` = tot_direct_right,
		`tr02_pair`.`tot_rreg` = tot_rreg,
		`tr02_pair`.`tot_rtopup` = rtopup,
		`tr02_pair`.`tr_fpair_leg`=first_pairleg,
		`tr02_pair`.`pair_complete_date`=DATE_FORMAT(lastpay_date,'%Y-%m-%d'),
		`tr02_pair`.`last_pay_date`=DATE_FORMAT(reg_date,'%Y-%m-%d')
		WHERE `tr02_pair`.`or_m_reg_id` = reg_id ;
	END IF;
	
	SELECT get_package_amount(3,pin_id) INTO pack_amt;
	
	IF pack_amt = 1500 THEN
		CALL sp_datewise_pair(reg_id,pos,0,DATE_FORMAT(topup_date,'%Y-%m-%d'));
	END IF;
	
	SELECT `or_m_position`, `or_m_upliner_id` INTO pos, reg_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=reg_id LIMIT 1;
END WHILE pair_details;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_payment_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_payment_report` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_payment_report`()
BEGIN
SELECT
  `tr07_manage_ledger`.`m_ledger_id` AS `m_ledger_id`,
  `tr07_manage_ledger`.`m_u_id`      AS `m_u_id`,
  ROUND((SUM(`tr07_manage_ledger`.`m_cramount`)-SUM(`tr07_manage_ledger`.`m_dramount`)),2)  AS `curr_bal`,
  `tr07_manage_ledger`.`m_transdate` AS `m_transdate`,
  `m03_user_detail`.`or_m_user_id`   AS `or_m_user_id`,
  `m03_user_detail`.`or_m_name`      AS `Username`,
  `m04_user_bank`.`or_m_b_ifscode`   AS `or_m_b_ifscode`,
  `m04_user_bank`.`or_m_b_cbsacno`   AS `or_m_b_cbsacno`,
  fn_get_bank_name(`m04_user_bank`.`or_m_b_name`)      AS `or_m_b_name`,
  `m04_user_bank`.`or_m_b_branch`    AS `or_m_b_branch`,
  `m04_user_bank`.`or_m_b_pancard`   AS `or_m_b_pancard`,
  `m04_user_bank`.`or_m_b_adhar`     AS `or_m_b_adhar`
FROM `tr07_manage_ledger`
    LEFT JOIN `m03_user_detail`
      ON ((`tr07_manage_ledger`.`m_u_id` = `m03_user_detail`.`or_m_reg_id`))
   LEFT JOIN `m04_user_bank`
     ON ((`tr07_manage_ledger`.`m_u_id` = `m04_user_bank`.`or_m_id`)) GROUP BY `tr07_manage_ledger`.`m_u_id` HAVING curr_bal > 0;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_payout_publish_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_payout_publish_data` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_payout_publish_data`()
BEGIN
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pay_roi_amount` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pay_roi_amount` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pay_roi_amount`()
BEGIN
DECLARE reg_id, pack_id, date_diff, old_roi, invest_id, total_get_roi,pay_number,max_pay_time INT(11);
DECLARE amt,pay_amount DECIMAL(10,2);
DECLARE topup_date, max_date, trans_id VARCHAR(30);
DECLARE c CURSOR FOR SELECT `tr10_mem_id`, `tr10_mem_uid`, `tr10_mem_pack`, `tr10_mem_amount`, `tr10_mem_reqdate`,`tr10_mem_pay_num` FROM `tr10_mem_topup` WHERE  `tr10_mem_status` = 1;
	DECLARE EXIT HANDLER FOR NOT FOUND
	BEGIN
	END;
	SELECT `get_transaction_id`() INTO trans_id;
	OPEN c;
	payout:LOOP
		FETCH c INTO invest_id, reg_id, pack_id, amt, topup_date,pay_number;
		
		SELECT DATEDIFF(NOW(),DATE_FORMAT(topup_date,'%Y-%m-%d')) INTO date_diff;
		  
		IF (date_diff > 21) THEN
		
			SET max_date = IFNULL((SELECT (DATEDIFF((CURRENT_DATE),(DATE_FORMAT(MAX(m_transdate),'%Y-%m-%d')))) AS diff   FROM `tr07_manage_ledger` WHERE `tr07_manage_ledger`.`m_ledger_type`= 3 AND `tr07_manage_ledger`.`m_refrence_id`=invest_id AND `tr07_manage_ledger`.`m_u_id`=reg_id),0);
			SET pay_amount = (SELECT m_pack_roi_income FROM `m06_package` WHERE m_pack_id = pack_id);
			SET max_pay_time = (SELECT m_pack_roi_days FROM `m06_package` WHERE m_pack_id = pack_id );
			
			IF ((max_date >= 6 OR max_date = 0) AND (max_pay_time != (IFNULL(pay_number,1)))) THEN
				
				INSERT INTO `admin_bitear`.`tr07_manage_ledger` (
				  `m_u_id`,
				  `m_trans_id`,
				  `m_cramount`,
				  `m_dramount`,
				  `m_description`,
				  `m_transdate`,
				  `m_refrence_id`,
				  `m_ledger_type`,
				  `m_bal_type`,
				  `m_current_balance`,
				  `m_datetime`
				) 
				VALUES
				  (
				    reg_id,
				    trans_id,
				    pay_amount,
				    0,
				    "Roi Amount Credited",
				    NOW(),
				    invest_id,
				    3,
				    1,
				    (`get_available_bal`(reg_id,1)+ pay_amount),
				    NOW()
				  ) ;
				  
		       UPDATE `tr10_mem_topup` SET `tr10_mem_pay_num` =   pay_number+1 WHERE tr10_mem_id = invest_id;
		       
		       UPDATE `tr28_mining_bonus` SET `tr_status` =   1 WHERE `tr_topup_id` = invest_id AND `tr_pay_date`= CURRENT_DATE;		  
			
			END IF;
		END IF;
		
		END LOOP payout;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pin_genrate` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pin_genrate` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pin_genrate`(
    IN m_pin_id INT(11),
    IN m_pack_id INT(11),
    IN no_pin INT(11),
    IN m_pin_assigned_to INT(11),
    IN login_id VARCHAR(50),
    IN m_pin_status INT(11),
    IN m_pin_gen_date DATETIME,
    IN m_pin_gen_by INT(11),
    IN m_pin_is_reg INT(11),
    IN proc INT(11)
    )
BEGIN
	 DECLARE reg_id INT(11);
	 IF (proc = 1) THEN
		 SET reg_id=(SELECT `m03_user_detail`.`or_m_reg_id` FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_user_id`=login_id);
		 IF (reg_id!=0) THEN
			 pin_insert: WHILE no_pin > 0 DO
				 INSERT INTO `m09_pin_detail` (`m_pin`,`m_pack_id`,`m_pin_assigned_to`,`or_m_reg_id`,`m_pin_status`,`m_pin_gen_date`,`m_pin_gen_by`,`m_pin_is_reg`) VALUES (`fn_pin_id`(), m_pack_id, reg_id, reg_id, m_pin_status, m_pin_gen_date, m_pin_gen_by, 1);
				 SET no_pin = no_pin - 1;
			 END WHILE pin_insert;
		  END IF;
	 END IF;
	 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pin_member_topup` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pin_member_topup` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pin_member_topup`(
	IN tr10_mem_uid INT(11),
	IN tr10_mem_pin INT(11),
	OUT msg VARCHAR(200)
)
BEGIN
	
	DECLARE check_top INT(11);
	START TRANSACTION;
	SELECT `m03_user_detail`.`m_topup_pin_id` INTO check_top FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id` = tr10_mem_uid;
	
	IF check_top = 0 THEN
		
		UPDATE
		`admin_hub`.`m03_user_detail`
		SET
		`m03_user_detail`.`m_topup_pin_id` = tr10_mem_pin,
		`m03_user_detail`.`or_m_topup_date` = NOW()
		WHERE `m03_user_detail`.`or_m_reg_id` = tr10_mem_uid;
		
		UPDATE
		  `admin_hub`.`m09_pin_detail`
		SET
		  `m09_pin_detail`.`m_pin_status` = 2
		WHERE `m09_pin_detail`.`m_pin_id` = tr10_mem_pin;
		
		CALL sp_toup_data(tr10_mem_uid);
		
		SET msg = "User topup sucessfully.";
		
		ELSE
		
		SET msg = "User Is already topuped.";
		
	END IF;
	COMMIT;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pin_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pin_report` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pin_report`(IN queery VARCHAR (1000))
BEGIN
  SET @asd = CONCAT("SELECT
  @a:=@a+1 				    SN,
  (CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN `m03_user_detail`.`or_m_user_id` END) AS Associate_id,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN `m03_user_detail`.`or_m_name` END)  AS Associate_name,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN (CASE WHEN(`m03_user_detail_1`.`or_m_position`='L') THEN 'Left'  WHEN(`m03_user_detail_1`.`or_m_position`='R') THEN 'Right' ELSE '' END)  ELSE '' END) AS PIN_Position,
`m09_pin_detail`.`m_pin` AS PIN ,
`m09_pin_detail`.`m_pin_gen_date` AS GENERATION_DATE ,
(CASE WHEN(`m09_pin_detail`.`m_pin_gen_by`='0') THEN 'Superadmin' ELSE '' END) AS PIN_issued_by,
`m06_package`.`m_pack_fee`      AS Amount,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`=1) THEN 'In-Active' WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN 'Active' ELSE 'Deactive' END)     AS PIN_Status,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN 'REGISTRATION' ELSE 'TOPUP' END)  AS `PIN_IS_REG`
FROM
`m09_pin_detail`
LEFT JOIN `m06_package` 
ON (`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`)
LEFT JOIN `m03_user_detail` 
ON (`m09_pin_detail`.`m_pin_assigned_to` = `m03_user_detail`.`or_m_reg_id`)
LEFT JOIN `m03_user_detail` AS `m03_user_detail_1`
ON (`m09_pin_detail`.`m_pin_id` = `m03_user_detail_1`.`m_pin_id`),(SELECT @a:= 0) AS a where ", queery) ;
  PREPARE zxc FROM @asd ;
  EXECUTE zxc ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_pin_transfer_full_report` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_pin_transfer_full_report` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_pin_transfer_full_report`(IN queery VARCHAR(1000))
BEGIN
SET @asd = CONCAT("SELECT
`m09_pin_detail`.`m_pin_assigned_to` 		AS `TO_REG`,
`m03_user_detail`.`or_m_user_id`           	AS `TO_ID`,
`m03_user_detail`.`or_m_name`             	AS `TO_NAME`,
`m10_pin_history`.`m_pin_transfer_byid`       	AS `FROM_ID`,
IFNULL(`m03_user_detail_1`.`or_m_user_id`,'Superadmin')           	AS `FROM_USER_ID`,
IFNULL(`m03_user_detail_1`.`or_m_name`,'Superadmin')              	AS `FROM_USER_NAME`,
`m09_pin_detail`.`m_pin`             		AS `PIN_NO`,
`m06_package`.`m_pack_name`			AS `PACKAGE_NAME`,
`m06_package`.`m_pack_fee`			AS `PACKAGE_FEE`,
(CASE WHEN (`m09_pin_detail`.`m_pin_gen_by`='0') THEN 'SUPER ADMIN' ELSE `m09_pin_detail`.`m_pin_gen_by` END)					        AS `GENRATE_BY`,
(CASE WHEN (`m09_pin_detail`.`m_pin_status`='1') THEN 'In-Active' WHEN (`m09_pin_detail`.`m_pin_status`=2) THEN 'Active' ELSE 'Deactive' END)     	AS PIN_STATUS,
(CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=8) THEN 'Registration' ELSE 'Topup Pin' END)  AS `PIN_IS_REG`,
DATE_FORMAT(`m10_pin_history`.`m_pin_date`,'%Y-%b-%d') 		AS GENERATION_DATE
FROM
    `admin_hub`.`m10_pin_history`
    LEFT JOIN `admin_hub`.`m09_pin_detail` 
        ON (`m10_pin_history`.`m_pin_id` = `m09_pin_detail`.`m_pin_id`)
    LEFT JOIN `admin_hub`.`m06_package` 
        ON (`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`)
    LEFT JOIN `admin_hub`.`m03_user_detail` 
        ON (`m10_pin_history`.`or_m_user_id` = `m03_user_detail`.`or_m_reg_id`)
    LEFT JOIN `admin_hub`.`m03_user_detail` AS `m03_user_detail_1`
        ON (`m10_pin_history`.`m_pin_transfer_byid` = `m03_user_detail_1`.`or_m_reg_id`) where ",queery);
  
   PREPARE zxc FROM @asd;
  EXECUTE zxc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_publish_payout` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_publish_payout` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_publish_payout`(IN closing_to_date VARCHAR(200))
BEGIN
	START TRANSACTION;
		SELECT MAX(`tr_closing_date`) INTO @from_close_date1 FROM `tr05_closing_date` WHERE DATE_FORMAT(`tr_closing_date`,'%Y-%m-%d')<DATE_FORMAT(closing_to_date,'%Y-%m-%d');
		SELECT DATE_ADD(@from_close_date1, INTERVAL 1 SECOND) INTO @from_close_date;
		
		UPDATE 
		  `admin_hub`.`tr04_payout_detail` 
		SET
		  `tr_payout_ispublish` = 1
		WHERE  DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(@from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d') AND tr_payout_is_delete=0;
		
		UPDATE 
		  `admin_hub`.`tr05_closing_date` 
		SET
		  `tr_closing_status`=3
		WHERE DATE_FORMAT(`tr_closing_date`,'%Y-%m-%d') = DATE_FORMAT(closing_to_date,'%Y-%m-%d');
		CALL sp_user_income_datewise(@from_close_date,closing_to_date);
	COMMIT;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_reward` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_reward` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_reward`()
BEGIN
	DECLARE reg_id, totdirect1, totdirect2, totdirect3, totdirect4, totdirect5 INT(11);
	DECLARE topdate, new_date, eight_date, twel_date, five_date, five_new_date VARCHAR(30);
	
	DECLARE c CURSOR FOR SELECT `or_m_reg_id`, `or_m_topup_date` FROM `m03_user_detail` WHERE `m_topup_pin_id` <> 0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d') <= DATE_FORMAT('2017-05-31','%Y-%m-%d') ORDER BY `or_m_topup_date` ASC;
	DECLARE EXIT HANDLER FOR NOT FOUND    
	BEGIN     
	END; 
	OPEN c;
	reward:LOOP
	FETCH c INTO reg_id, topdate;
	
	SELECT DATE_ADD(topdate,INTERVAL 7 DAY) INTO new_date;
	SELECT COUNT(*) INTO totdirect1 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id`=reg_id AND `m_topup_pin_id`<>0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') >= DATE_FORMAT(topdate,'%Y-%m-%d %H:%i:%s') AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') <= DATE_FORMAT(new_date,'%Y-%m-%d %H:%i:%s');
	
	
	SELECT DATE_ADD(topdate,INTERVAL 8 DAY) INTO eight_date;
	SELECT COUNT(*) INTO totdirect2 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id`=reg_id AND `m_topup_pin_id`<>0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') >= DATE_FORMAT(new_date,'%Y-%m-%d %H:%i:%s') AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') <= DATE_FORMAT(eight_date,'%Y-%m-%d %H:%i:%s');
	
	
	SELECT DATE_ADD(topdate,INTERVAL 12 DAY) INTO twel_date;
	SELECT COUNT(*) INTO totdirect3 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id`=reg_id AND `m_topup_pin_id`<>0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') >= DATE_FORMAT(eight_date,'%Y-%m-%d %H:%i:%s') AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') <= DATE_FORMAT(twel_date,'%Y-%m-%d %H:%i:%s');
	
	
	SELECT DATE_ADD(topdate,INTERVAL 5 DAY) INTO five_date;
	SELECT COUNT(*) INTO totdirect4 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id`=reg_id AND `m_topup_pin_id`<>0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') >= DATE_FORMAT(twel_date,'%Y-%m-%d %H:%i:%s') AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') <= DATE_FORMAT(five_date,'%Y-%m-%d %H:%i:%s');
	
	SELECT DATE_ADD(topdate,INTERVAL 5 DAY) INTO five_new_date;
	SELECT COUNT(*) INTO totdirect5 FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id`=reg_id AND `m_topup_pin_id`<>0 AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') >= DATE_FORMAT(five_date,'%Y-%m-%d %H:%i:%s') AND DATE_FORMAT(`or_m_topup_date`,'%Y-%m-%d %H:%i:%s') <= DATE_FORMAT(five_new_date,'%Y-%m-%d %H:%i:%s');
	
	IF totdirect1 > 0 THEN
	
	INSERT INTO `admin_hub`.`tr14_reward` (
	  `tr_user_id`,
	  `tr_seven_day`,
	  `tr_fif_day`,
	  `tr_twen_day`,
	  `tr_twofive_day`,
	  `tr_tirthy`
	) 
	VALUES
	  (
	    reg_id,
	    totdirect1,
	    totdirect2,
	    totdirect3,
	    totdirect4,
	    totdirect5
	  ) ;
	
	END IF;
	
	END LOOP reward;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_select_pin_trans` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_select_pin_trans` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_select_pin_trans`(IN user_id INT (50), IN quantitiy INT(11),IN pin_type INT (50), IN pack_id INT(11))
BEGIN
    
    DECLARE reg_id INT(11);
    DECLARE total_pin_id INT(11);
    DECLARE pin_limit INT(11);
    
    --       `or_m_reg_id`=",reg_id," and        remove for assign pin id
    --		AND `m09_pin_detail`.`m_pin_id` NOT IN (SELECT `m10_pin_history`.`m_pin_id` FROM `m10_pin_history`)   transfer report
	SET reg_id=user_id;
	SET total_pin_id=(SELECT COUNT(*) FROM `m09_pin_detail` WHERE `m09_pin_detail`.`m_pin_assigned_to`=reg_id );
	IF (quantitiy >= total_pin_id) THEN
		SET pin_limit=total_pin_id;
	ELSE
		SET pin_limit=quantitiy;
	END IF;
	SET @asd = CONCAT("SELECT 
	  `m06_package`.`m_pack_id`            AS `m_pack_id`,
	  `m06_package`.`m_pack_name`          AS `m_pack_name`,
	  `m06_package`.`m_pack_fee`           AS `m_pack_fee`,
	  `m09_pin_detail`.`m_pin_id`          AS `m_pin_id`,
	  `m09_pin_detail`.`m_pin`             AS `m_pin`,
	  `m09_pin_detail`.`m_pack_id`         AS `m_pack_id_1`,
	  `m09_pin_detail`.`m_pin_assigned_to` AS `m_pin_assigned_to`,
	  `m09_pin_detail`.`or_m_reg_id`       AS `or_m_reg_id`,
	  `m09_pin_detail`.`m_pin_status`      AS `m_pin_status`,
	  `m09_pin_detail`.`m_pin_gen_date`    AS `m_pin_gen_date`,
	  `m09_pin_detail`.`m_pin_gen_by`      AS `m_pin_gen_by`,
	  (CASE WHEN (`m09_pin_detail`.`m_pin_is_reg`=1) THEN 'TOPUP' WHEN (`m09_pin_detail`.`m_pin_is_reg`=2) THEN 'TOPUP' WHEN (`m09_pin_detail`.`m_pin_is_reg`=3) THEN 'CROWD TOPUP' ELSE 'NO PIN' END)      AS `m_pin_is_reg` 
        FROM `admin_hub`.`m09_pin_detail`
        LEFT JOIN `admin_hub`.`m06_package` 
        ON (`m09_pin_detail`.`m_pack_id` = `m06_package`.`m_pack_id`)
	WHERE m_pin_status=1 and m_pin_assigned_to=",reg_id," and `m09_pin_detail`.`m_pack_id`=",pack_id," LIMIT 0,",pin_limit);
  PREPARE zxc FROM @asd;
  EXECUTE zxc;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_send_user_circle_request` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_send_user_circle_request` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_send_user_circle_request`(IN pack_id INT(11),IN topup_id INT(11),IN growth_percent DOUBLE(10,2))
BEGIN
DECLARE j,amount,admin_charge,roi_amount,days,tot_income,tot_user_income,retopup_amount DOUBLE(10,2);
DECLARE i,capping INT(11);
  
   
   SELECT m_pack_capp ,m_pack_fee INTO capping,amount  FROM  `m06_package` WHERE  m_pack_id =  pack_id;
   
   SET roi_amount =   (amount*growth_percent)/100;
   
    
   
 
   SET tot_income =  (roi_amount*90);
   SET admin_charge = (tot_income*10)/100;  
   SET tot_user_income = (tot_income - admin_charge);
	
  	
	
	
	
	  
	  INSERT INTO `admin_hub`.`tr29_user_circle` (
	  `circle_topup_id`,
	  `circle_amount`,
	  `circle_days`,
	  `circle_growth_rate`,
	  `circle_tot_roi`,
	  `circle_curr_roi`,
	  `circle_admin_charge`,
	  `circle_rejection`,
	  `circle_bal_amount`,
	  `circle_date`,
	  `circle_status`,
	  circle_tot_income,
	  circle_growth_amount
	) 
	VALUES
	  (
	    topup_id,
	    (amount),
	    '90',
	    growth_percent,
	    (roi_amount*90),
	    (roi_amount*90),
	    admin_charge,
	    0,
	    '0',
	    CURRENT_DATE,
	    '0',
	    tot_user_income,
	    ((amount*growth_percent)/100)
	    
	  ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_setconfig` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_setconfig` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_setconfig`(
IN m00_login_id INT(11),
IN m00_username VARCHAR(100),
IN m00_password VARCHAR(100),
IN m00_pinpassword VARCHAR(100),
IN m00_admin_type VARCHAR(100),
IN m00_admin_status VARCHAR(100)
)
BEGIN
	UPDATE 
	  `admin_hub`.`m00_admin_login` 
	SET
	  `m00_username` = m00_username,
	  `m00_password` = m00_password,
	  `m00_pinpassword` = m00_pinpassword,
	  `m00_admin_type` = m00_admin_type,
	  `m00_admin_status` = m00_admin_status 
	WHERE `m00_login_id` = m00_login_id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_test` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_test` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_test`()
BEGIN
declare j,amount,txn_charge,roi_amount,days,tot_income,tot_user_income,retopup_amount double(10,2);
declare i,capping int(11);
  
   set i = 1;
   set amount = 25;
   
   
  
  while( i< 49) do 
  
  set roi_amount =   (amount*2.4)/100;
  
  if (amount>=25 and amount<=200 ) then set capping = 100; set retopup_amount = 2.40;end if;
  IF (amount>=225 and amount <=400) THEN SET capping = 150; SET retopup_amount = 2.50;END IF;
  IF (amount>=425 AND amount <=600)  THEN SET capping = 200; SET retopup_amount = 2.60;END IF;
  IF (amount>=625 AND amount <=800)  THEN SET capping = 250; SET retopup_amount = 2.70;END IF;
  IF (amount>=825 AND amount <=1000) THEN SET capping = 300; SET retopup_amount = 2.80;END IF;
  IF (amount>=1025 AND amount <=1200)  THEN SET capping = 350;SET retopup_amount = 2.90;END IF;
  set tot_income =  (roi_amount*90);
  set txn_charge = (tot_income*10)/100;  
  set tot_user_income = tot_income - txn_charge;
  
	   INSERT INTO `admin_hub`.`m06_package` (
		  `m_pack_name`,
		  `m_pack_fee`,
		  `m_pack_direct_amt`,
		  `m_pack_point`,
		  `m_pack_growth_amt`,
		  `m_pack_capp`,
		  `m_pack_roi_income`,
		  `m_pack_roi_days`,
		  `m_pack_description`,
		  `m_pack_status`,
		   m_pack_txn_charge,
		   m_pack_tot_days_income,
		   m_pack_tot_user_income,
		   m_pack_retopup_benefits
	) 
	VALUES
	  (
		    concat('Package',i),
		    amount,
		    (amount*10/100),
		    '0',
		    roi_amount,
		    capping,
		    roi_amount,
		    '90',
		    '',
		    '1',
		    txn_charge,
		    tot_income,
		    tot_user_income,
		    retopup_amount
		    
	  ) ;
  
   set i = i+1;  
   set amount = amount+25;   
  
  end while;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ticket` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ticket` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ticket`(
IN tr_ticket_id INT(11),
IN tr_ticket_userid INT(11),
IN tr_ticket_title VARCHAR(500),
IN tr_ticket_desc TEXT,
IN tr_ticket_reply TEXT,
IN tr_ticket_status INT(2),
IN tr_ticket_date VARCHAR(20),
IN proc INT(2),
OUT msg VARCHAR(100)
)
BEGIN
IF (proc = 1) THEN
INSERT INTO `admin_hub`.`tr05_ticket` (
  `tr_ticket_userid`,
  `tr_ticket_title`,
  `tr_ticket_desc`,
  `tr_ticket_status`,
  `tr_ticket_date`
) 
VALUES
  (
    tr_ticket_userid,
    tr_ticket_title,
    tr_ticket_desc,
    tr_ticket_status,
    tr_ticket_date
  ) ;
  
 SET msg="Ticket Generated Successfully";
END IF;
IF (proc = 2) THEN
UPDATE 
  `admin_hub`.`tr05_ticket`
SET
  `tr05_ticket`.`tr_ticket_reply` = tr_ticket_reply
WHERE `tr05_ticket`.`tr_ticket_id` = tr_ticket_id ;
 SET msg="Ticket Reply Sucessfully";
END IF;
IF (proc = 3) THEN
UPDATE 
  `admin_hub`.`tr05_ticket`
SET
  `tr05_ticket`.`tr_ticket_status` = tr_ticket_status
WHERE `tr05_ticket`.`tr_ticket_id` = tr_ticket_id ;
SET msg="Ticket Status Change Successfully";
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_toup_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_toup_data` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_toup_data`(IN txtlogin INT (11))
BEGIN
	DECLARE upliner_id, reg_id, pin_id, ltopup, rtopup, intr_id, is_direct, dl_topup, dr_topup INT (11) DEFAULT 0;
	DECLARE reg_date,pos,topup_date,lastpay_date,first_pairleg VARCHAR (25);
	DECLARE pack_amt DECIMAL(10,2);
	
	SELECT IFNULL(`or_m_upliner_id`,0), IFNULL(`or_m_position`,0), IFNULL(`or_m_topup_date`,0), IFNULL(`m_topup_pin_id`,0), `or_m_intr_id` INTO reg_id, pos, reg_date, pin_id, intr_id FROM `admin_hub`.`m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=txtlogin LIMIT 1;
	
	pair_details: WHILE reg_id>0 DO
	
	SELECT IFNULL(`tot_ltopup`,0), IFNULL(`tot_rtopup`,0)
	INTO ltopup, rtopup FROM `admin_hub`.`tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id LIMIT 1;
	
	SELECT get_package_amount(3,pin_id) INTO pack_amt;
	
	IF pack_amt = 1500 AND pos ='L' THEN
		SET ltopup = ltopup + 1;
		IF intr_id = reg_id THEN
		SET dl_topup=1;
		END IF;	
	END IF;
	
	IF pack_amt = 1500 AND pos ='R' THEN
		SET rtopup = rtopup + 1;
		IF intr_id = reg_id THEN
		SET dr_topup=1;
		END IF;	
	END IF;
	
	UPDATE 
	`admin_hub`.`tr02_pair` 
	SET
	`tr02_pair`.`tot_ltopup` = ltopup,
	`tr02_pair`.`tot_rtopup` = rtopup,
	`tr02_pair`.`tot_dltopup` = `tr02_pair`.`tot_dltopup`+dl_topup,
	`tr02_pair`.`tot_drtopup` = `tr02_pair`.`tot_drtopup`+dr_topup
	WHERE `tr02_pair`.`or_m_reg_id` = reg_id ;
	
	CALL sp_datewise_pair(reg_id,pos,is_direct,DATE_FORMAT(reg_date,'%Y-%m-%d'));
	
	SELECT `or_m_position`, `or_m_upliner_id` INTO pos, reg_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_reg_id`=reg_id LIMIT 1;
	SET is_direct = 0;
	SET dl_topup=0;
	SET dr_topup=0;
	
	IF reg_id = intr_id THEN
	    SET is_direct = 1;
	END IF ; 
	
END WHILE pair_details;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_transfer_balance` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_transfer_balance` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_transfer_balance`(
IN tr_trans_userid INT(11),
IN tr_trans_transid VARCHAR(50),
IN tr_trans_amt DECIMAL(10,2),
IN tr_trans_pass VARCHAR(20),
OUT msg VARCHAR(200)
)
BEGIN
DECLARE transferid,id,trans_userid,regid INT(11) DEFAULT 0;
DECLARE transid,pinpwd VARCHAR(200);
DECLARE avial_amt,withdrwan_amt DECIMAL(10,2);
START TRANSACTION;
SET avial_amt=(SELECT get_available_bal(tr_trans_userid,1));
  
  SELECT `or_pin_pwd` INTO pinpwd FROM `admin_hub`.`tr01_login` WHERE `tr01_login`.`or_user_id` = tr_trans_userid;
  SELECT `get_transaction_id`() INTO transid;
  SELECT `m03_user_detail`.`or_m_reg_id` INTO transferid FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_user_id` = tr_trans_transid;
  IF avial_amt >= tr_trans_amt THEN
	IF pinpwd = tr_trans_pass THEN
		  INSERT INTO `admin_hub`.`tr11_fund_transfer` (
		  `tr11_fund_uid`,
		  `tr11_fund_transfer_id`,
		  `tr11_fund_transaid`,
		  `tr11_fund_amt`
		) 
		VALUES
		  (
		    tr_trans_userid,
		    transferid,
		    transid,
		    tr_trans_amt
		  ) ;
		  
		  INSERT INTO `admin_hub`.`tr07_manage_ledger` (
		  `m_u_id`,
		  `m_trans_id`,
		  `m_cramount`,
		  `m_dramount`,
		  `m_description`,
		  `m_transdate`,
		  `m_refrence_id`,
		  `m_ledger_type`,
		  `m_bal_type`,
		  `m_current_balance`,
		  `m_datetime`
		) 
		VALUES
		  (
		    tr_trans_userid,
		    transid,
		    0.00,
		    tr_trans_amt,
		    CONCAT('Fund Transfer to ',`get_detail`(transferid,4)),
		    NOW(),
		    123456,
		    5,
		    1,
		    (`get_available_bal`(tr_trans_userid,1)-tr_trans_amt),
		    NOW()
		  ) ;
		  
		  INSERT INTO `admin_hub`.`tr07_manage_ledger` (
		  `m_u_id`,
		  `m_trans_id`,
		  `m_cramount`,
		  `m_dramount`,
		  `m_description`,
		  `m_transdate`,
		  `m_refrence_id`,
		  `m_ledger_type`,
		  `m_bal_type`,
		  `m_current_balance`,
		  `m_datetime`
		) 
		VALUES
		  (
		    transferid,
		    transid,
		    tr_trans_amt,    
		    0.00,
		    CONCAT('Fund Transfer from ',`get_detail`(tr_trans_userid,4)),
		    NOW(),
		    123456,
		    4,
		    1,
		    (`get_available_bal`(transferid,1)+tr_trans_amt),
		    NOW()
		  ) ; 
		SET msg="Transfer Successfully Completed";
	ELSE
		SET msg="Transation Password Does Not Match";
	END IF;
  ELSE
	SET msg="You Have Not Sufficient Amount";
  END IF;
 COMMIT;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_tree_tooltip` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_tree_tooltip` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_tree_tooltip`(
IN regid INT(11)
)
BEGIN
SELECT
	`m03_user_detail`.`or_m_dob`        AS `DOB`,
	DATE_FORMAT(`m03_user_detail`.`or_m_regdate`,'%d-%b-%Y') AS `DOJ`,
	`m03_user_detail`.`or_m_intr_id`    AS `INTOID`,
	`get_detail`(`m03_user_detail`.`or_m_intr_id`,4)  `Intro_userid`,
	`m03_user_detail`.`or_m_intr_name`  AS `INTRONAME`,
	`m03_user_detail`.`m_pin_id`        AS `PINID`,
	`m03_user_detail`.`or_m_name`       AS `USERNAME`,
	ifnull(DATE_FORMAT(`m03_user_detail`.`or_m_topup_date`,'%d-%b-%Y'),'') AS `TOPUP_DATE`,
	`m03_user_detail`.`or_m_reg_id`     AS `REGID`,
	`m03_user_detail`.`or_m_user_id`    AS `USERID`,
	`tr02_pair`.`tot_left`              AS `TOTLEFT`,
	`tr02_pair`.`tot_right`             AS `TOTRIGHT`,
	`tr02_pair`.`tot_ltopup`            AS `TOPUPLEFT`,
	`tr02_pair`.`tot_rtopup`            AS `TOPUPRIGHT`
FROM `m03_user_detail`
   LEFT JOIN `tr02_pair`
     ON ((`m03_user_detail`.`or_m_reg_id` = `tr02_pair`.`or_m_reg_id`))
   WHERE `m03_user_detail`.`or_m_reg_id` = regid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_user_at_level` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_user_at_level` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_user_at_level`(
IN user_reg INT(11),
IN getlevel INT(11)
)
BEGIN
	DROP TABLE IF EXISTS cur_level;
	DROP TABLE IF EXISTS user_level;
	DROP TABLE IF EXISTS total_user;
	CREATE TEMPORARY TABLE IF NOT EXISTS cur_level (`curid` INT(11) NOT NULL);
	CREATE TEMPORARY TABLE IF NOT EXISTS user_level (`userid` INT(11) NOT NULL);
	CREATE TEMPORARY TABLE IF NOT EXISTS total_user (`totu` INT(11) NOT NULL);
	
	INSERT INTO cur_level(	`curid` ) VALUES ( user_reg );
	INSERT INTO total_user(	`totu` ) VALUES ( user_reg );
	
	user_at_level : LOOP
	
		IF getlevel > 0 THEN
			DELETE FROM user_level;
			INSERT INTO `user_level`(
			`userid`
			)
			SELECT `or_m_reg_id` FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_upliner_id` IN (SELECT `curid` FROM `cur_level`);
			DELETE FROM cur_level;
			INSERT INTO `cur_level`(
			`curid`
			)
			SELECT `userid` FROM `user_level`;
			INSERT INTO `total_user`(
			`totu`
			)
			SELECT `userid` FROM `user_level`;
			SET getlevel = (getlevel - 1);	
		ELSE
			LEAVE user_at_level;	
		END IF;
		
	END LOOP user_at_level;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_user_dashboard` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_user_dashboard` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_user_dashboard`(IN reg_id INT(11))
BEGIN
DECLARE direct_id, left_id, right_id, tot_id, ltopup, rtopup INT(11) DEFAULT 0;
DECLARE matching, direct, tds DECIMAL(10,2);
            
SELECT IFNULL(`tr02_pair`.`tot_left`,0), IFNULL(`tr02_pair`.`tot_right`,0), IFNULL(`tot_ltopup`,0), IFNULL(`tot_rtopup`,0) INTO left_id, right_id, ltopup, rtopup FROM `tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id LIMIT 1;
SELECT IFNULL((`tr02_pair`.`tot_left`+`tr02_pair`.`tot_right`),0) INTO tot_id FROM `tr02_pair` WHERE `tr02_pair`.`or_m_reg_id`=reg_id LIMIT 1;
SELECT COUNT(*) INTO direct_id FROM `m03_user_detail` WHERE `m03_user_detail`.`or_m_intr_id` = reg_id LIMIT 1;
SELECT SUM(`tr_payout_final_income`) INTO matching FROM `tr04_payout_detail` WHERE `tr04_payout_detail`.`or_m_reg_id`=reg_id AND `tr04_payout_detail`.`tr_payout_type`=1;
SELECT SUM(`tr_payout_tdscharges`) INTO tds FROM `tr04_payout_detail` WHERE `tr04_payout_detail`.`or_m_reg_id`=reg_id;
SELECT SUM(`tr_payout_final_income`) INTO direct FROM `tr04_payout_detail` WHERE `tr04_payout_detail`.`or_m_reg_id`=reg_id AND `tr04_payout_detail`.`tr_payout_type`=2;
  
SELECT direct_id, left_id, right_id, tot_id, matching, direct, tds, rtopup, ltopup;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_user_income_datewise` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_user_income_datewise` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_user_income_datewise`(IN from_close_date VARCHAR(200),IN closing_to_date VARCHAR(200))
BEGIN
	DECLARE reg_id INT(11);
	DECLARE match_income, direct_income, growth_income, admin_charges,tds_charges, proc_charges, final_income DECIMAL(10,2) DEFAULT 0.00;
	DECLARE c CURSOR FOR (SELECT or_m_reg_id FROM `admin_hub`.`tr04_payout_detail` WHERE DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d') AND `tr04_payout_detail`.`tr_payout_type` AND tr_payout_ispublish=1 AND `tr_payout_is_delete` = 0 GROUP BY `or_m_reg_id`);
	DECLARE EXIT HANDLER FOR NOT FOUND    
	BEGIN     
	END; 
	OPEN c;
	payout:LOOP
		FETCH c INTO reg_id;
		SET match_income = (SELECT SUM(`tr_payout_amount`) AS 'Match_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE `tr_payout_type`=1 AND tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		SET admin_charges = (SELECT SUM(`tr_payout_admincharges`) AS 'ADMIN_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		SET direct_income = (SELECT SUM(`tr_payout_amount`) AS 'ADMIN_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE `tr_payout_type`=2 AND tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		SET tds_charges = (SELECT SUM(`tr_payout_tdscharges`) AS 'TDS_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		SET proc_charges = (SELECT SUM(`tr_payout_proce_charge`) AS 'TDS_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		SET final_income = (SELECT SUM(`tr_payout_final_income`) AS 'FINAL_Income' FROM `admin_hub`.`tr04_payout_detail` WHERE tr_payout_ispublish=1 AND  `tr_payout_is_delete` = 0 AND `or_m_reg_id`=reg_id AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') > DATE_FORMAT(from_close_date,'%Y-%m-%d') AND DATE_FORMAT(`tr_to_payout_date`,'%Y-%m-%d') <= DATE_FORMAT(closing_to_date,'%Y-%m-%d'));
		
		IF match_income IS NULL THEN 
			SET match_income=0.00;
		END IF;
		IF direct_income IS NULL THEN 
			SET direct_income=0.00;
		END IF;
		IF growth_income IS NULL THEN 
			SET growth_income=0.00;
		END IF;
		IF admin_charges IS NULL THEN 
			SET admin_charges=0.00;
		END IF;
		IF tds_charges IS NULL THEN 
			SET tds_charges=0.00;
		END IF;
		IF proc_charges IS NULL THEN 
			SET proc_charges=0.00;
		END IF;
		IF final_income IS NULL THEN 
			SET final_income=0.00;
		END IF;
		
		INSERT INTO `admin_hub`.`tr06_afterpublish_detail` (
			`or_m_reg_id`,
			`tr_apd_match_incm`,
			`tr_apd_direct_incm`,
			`tr_apd_growth_incm`,
			`tr_apd_admin_chrgs`,
			`tr_apd_tds_chrgs`,
			`tr_apd_proc_charges`,
			`tr_apd_final_income`,
			`tr_apd_iscapped`,
			`tr_apd_is_paid`,
			`tr_apd_is_weekly_paid`,
			`tr_apd_publish_date`,
			`tr_apd_weekly_pay_date`,
			`tr_apd_pay_date`
		) 
		VALUES 
		(
			reg_id,
			match_income,
			direct_income,
			growth_income,
			admin_charges,
			tds_charges,
			proc_charges,
			final_income,
			0,
			0,
			0,
			closing_to_date,
			'',
			''
		); 
	END LOOP payout;
	CLOSE c;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_user_leg` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_user_leg` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_user_leg`(in USER_ID INT(11))
BEGIN
       declare intro_id int(11);
       declare users_ids varchar(200);
        set intro_id = (select `or_m_intr_id`  from `m03_user_detail` where  `or_m_reg_id` = USER_ID);
 
       while intro_id >0 do
         
        set intro_id   = (select  or_m_intr_id from  m03_user_detail where or_m_reg_id = intro_id);
        
        set users_ids = concat( users_ids,intro_id);
              
       end while;        
        
        select users_ids; 
 
 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `test` */

/*!50003 DROP PROCEDURE IF EXISTS  `test` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `test`(out msg text)
BEGIN
  declare i,j int(100);
   
   set i=1;
   set j=100;
   
   while (i<=j) do
   
   set msg = i;
   INSERT INTO `admin_hub`.`tr28_cycle` (
  `tr_circle_name`,
  `tr_circle_counter`
) 
VALUES
  (
    (SELECT  number_to_string(i)),
    '0'
  ) ;
  
  set i = i+1;
   
   end while;
  
    END */$$
DELIMITER ;

/*Table structure for table `view_all_users` */

DROP TABLE IF EXISTS `view_all_users`;

/*!50001 DROP VIEW IF EXISTS `view_all_users` */;
/*!50001 DROP TABLE IF EXISTS `view_all_users` */;

/*!50001 CREATE TABLE  `view_all_users`(
 `or_m_reg_id` int(11) ,
 `or_m_user_id` varchar(40) ,
 `or_m_designation` int(2) ,
 `or_m_name` varchar(200) ,
 `or_m_dob` date ,
 `or_m_gurdian_name` varchar(200) ,
 `or_member_joining_date` date ,
 `or_m_gender` varchar(20) ,
 `or_m_email` varchar(200) ,
 `or_m_landline_no` varchar(20) ,
 `or_m_mobile_no` varchar(20) ,
 `or_m_address` varchar(500) ,
 `or_m_pincode` varchar(20) ,
 `or_m_country` int(11) ,
 `or_m_state` int(11) ,
 `or_m_userimage` text ,
 `or_m_userimage2` varchar(100) ,
 `or_m_city` int(11) ,
 `or_m_status` int(2) ,
 `or_m_intr_id` bigint(11) ,
 `or_m_intr_name` varchar(200) ,
 `or_m_aff_id` int(11) ,
 `or_m_upliner_id` int(11) ,
 `or_m_position` varchar(20) ,
 `m_pin_id` int(11) ,
 `m_topup_pin_id` int(11) ,
 `or_m_regdate` datetime ,
 `or_m_topup_date` datetime ,
 `or_reg_from` int(11) ,
 `or_lid` int(11) ,
 `or_user_id` int(11) ,
 `or_login_id` varchar(110) ,
 `or_login_pwd` varchar(100) ,
 `or_pin_pwd` varchar(100) ,
 `or_bitcoin_address` varchar(100) ,
 `or_last_login` datetime ,
 `or_last_logout` datetime ,
 `or_login_count` int(11) ,
 `or_login_type` int(2) ,
 `or_user_type` int(1) 
)*/;

/*Table structure for table `view_currency_ledger` */

DROP TABLE IF EXISTS `view_currency_ledger`;

/*!50001 DROP VIEW IF EXISTS `view_currency_ledger` */;
/*!50001 DROP TABLE IF EXISTS `view_currency_ledger` */;

/*!50001 CREATE TABLE  `view_currency_ledger`(
 `tr06_id` int(11) ,
 `or_m_user_id` varchar(40) ,
 `or_m_name` varchar(200) ,
 `tr06_user_id` int(11) ,
 `tr06_invoice_id` varchar(50) ,
 `tr06_from_currency` varchar(60) ,
 `tr06_to_currency` varchar(60) ,
 `tr06_from_amount` double(10,2) ,
 `tr06_to_amount` double(10,2) ,
 `tr06_type` int(1) ,
 `tr06_date` datetime ,
 `tr06_status` int(1) ,
 `tr06_description` varchar(200) ,
 `tr06_email` varchar(50) ,
 `tr06_mobile` varchar(15) ,
 `tr06_pm_id` varchar(50) 
)*/;

/*Table structure for table `view_currency_rate` */

DROP TABLE IF EXISTS `view_currency_rate`;

/*!50001 DROP VIEW IF EXISTS `view_currency_rate` */;
/*!50001 DROP TABLE IF EXISTS `view_currency_rate` */;

/*!50001 CREATE TABLE  `view_currency_rate`(
 `m07_id` int(11) ,
 `m07_transaction_type` int(1) ,
 `m07_transaction_name` varchar(50) ,
 `m07_currency` int(11) ,
 `m07_currency_name` varchar(100) ,
 `m07_charge` double(10,2) ,
 `m07_date` datetime ,
 `m07_description` varchar(100) ,
 `m07_status` int(1) ,
 `m6_type` int(1) ,
 `m6_account_number` varchar(100) ,
 `m6_account_name` varchar(100) 
)*/;

/*Table structure for table `view_currencys` */

DROP TABLE IF EXISTS `view_currencys`;

/*!50001 DROP VIEW IF EXISTS `view_currencys` */;
/*!50001 DROP TABLE IF EXISTS `view_currencys` */;

/*!50001 CREATE TABLE  `view_currencys`(
 `m6_id` int(11) ,
 `m6_name` varchar(100) ,
 `m6_description` varchar(100) ,
 `m6_status` int(1) ,
 `m6_type` int(1) ,
 `m6_icon` varchar(50) 
)*/;

/*Table structure for table `view_transaction_type` */

DROP TABLE IF EXISTS `view_transaction_type`;

/*!50001 DROP VIEW IF EXISTS `view_transaction_type` */;
/*!50001 DROP TABLE IF EXISTS `view_transaction_type` */;

/*!50001 CREATE TABLE  `view_transaction_type`(
 `m6_id` int(11) ,
 `m6_name` varchar(100) ,
 `m6_description` varchar(100) ,
 `m6_status` int(1) ,
 `m6_type` int(1) ,
 `m6_icon` varchar(50) 
)*/;

/*View structure for view view_all_users */

/*!50001 DROP TABLE IF EXISTS `view_all_users` */;
/*!50001 DROP VIEW IF EXISTS `view_all_users` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_all_users` AS (select `m03_user_detail`.`or_m_reg_id` AS `or_m_reg_id`,`m03_user_detail`.`or_m_user_id` AS `or_m_user_id`,`m03_user_detail`.`or_m_designation` AS `or_m_designation`,`m03_user_detail`.`or_m_name` AS `or_m_name`,`m03_user_detail`.`or_m_dob` AS `or_m_dob`,`m03_user_detail`.`or_m_gurdian_name` AS `or_m_gurdian_name`,`m03_user_detail`.`or_member_joining_date` AS `or_member_joining_date`,`m03_user_detail`.`or_m_gender` AS `or_m_gender`,`m03_user_detail`.`or_m_email` AS `or_m_email`,`m03_user_detail`.`or_m_landline_no` AS `or_m_landline_no`,`m03_user_detail`.`or_m_mobile_no` AS `or_m_mobile_no`,`m03_user_detail`.`or_m_address` AS `or_m_address`,`m03_user_detail`.`or_m_pincode` AS `or_m_pincode`,`m03_user_detail`.`or_m_country` AS `or_m_country`,`m03_user_detail`.`or_m_state` AS `or_m_state`,`m03_user_detail`.`or_m_userimage` AS `or_m_userimage`,`m03_user_detail`.`or_m_userimage2` AS `or_m_userimage2`,`m03_user_detail`.`or_m_city` AS `or_m_city`,`m03_user_detail`.`or_m_status` AS `or_m_status`,`m03_user_detail`.`or_m_intr_id` AS `or_m_intr_id`,`m03_user_detail`.`or_m_intr_name` AS `or_m_intr_name`,`m03_user_detail`.`or_m_aff_id` AS `or_m_aff_id`,`m03_user_detail`.`or_m_upliner_id` AS `or_m_upliner_id`,`m03_user_detail`.`or_m_position` AS `or_m_position`,`m03_user_detail`.`m_pin_id` AS `m_pin_id`,`m03_user_detail`.`m_topup_pin_id` AS `m_topup_pin_id`,`m03_user_detail`.`or_m_regdate` AS `or_m_regdate`,`m03_user_detail`.`or_m_topup_date` AS `or_m_topup_date`,`m03_user_detail`.`or_reg_from` AS `or_reg_from`,`tr01_login`.`or_lid` AS `or_lid`,`tr01_login`.`or_user_id` AS `or_user_id`,`tr01_login`.`or_login_id` AS `or_login_id`,`tr01_login`.`or_login_pwd` AS `or_login_pwd`,`tr01_login`.`or_pin_pwd` AS `or_pin_pwd`,`tr01_login`.`or_bitcoin_address` AS `or_bitcoin_address`,`tr01_login`.`or_last_login` AS `or_last_login`,`tr01_login`.`or_last_logout` AS `or_last_logout`,`tr01_login`.`or_login_count` AS `or_login_count`,`tr01_login`.`or_login_type` AS `or_login_type`,`tr01_login`.`or_user_type` AS `or_user_type` from (`m03_user_detail` left join `tr01_login` on((`m03_user_detail`.`or_m_reg_id` = `tr01_login`.`or_user_id`)))) */;

/*View structure for view view_currency_ledger */

/*!50001 DROP TABLE IF EXISTS `view_currency_ledger` */;
/*!50001 DROP VIEW IF EXISTS `view_currency_ledger` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_currency_ledger` AS (select `tr06_currency_ledger`.`tr06_id` AS `tr06_id`,`m03_user_detail`.`or_m_user_id` AS `or_m_user_id`,`m03_user_detail`.`or_m_name` AS `or_m_name`,`tr06_currency_ledger`.`tr06_user_id` AS `tr06_user_id`,`tr06_currency_ledger`.`tr06_invoice_id` AS `tr06_invoice_id`,(select `fx_currency_name`(`tr06_currency_ledger`.`tr06_from_currency`)) AS `tr06_from_currency`,(select `fx_currency_name`(`tr06_currency_ledger`.`tr06_to_currency`)) AS `tr06_to_currency`,`tr06_currency_ledger`.`tr06_from_amount` AS `tr06_from_amount`,`tr06_currency_ledger`.`tr06_to_amount` AS `tr06_to_amount`,`tr06_currency_ledger`.`tr06_type` AS `tr06_type`,`tr06_currency_ledger`.`tr06_date` AS `tr06_date`,`tr06_currency_ledger`.`tr06_status` AS `tr06_status`,`tr06_currency_ledger`.`tr06_description` AS `tr06_description`,`tr06_currency_ledger`.`tr06_email` AS `tr06_email`,`tr06_currency_ledger`.`tr06_mobile` AS `tr06_mobile`,`tr06_currency_ledger`.`tr06_pm_id` AS `tr06_pm_id` from (`tr06_currency_ledger` left join `m03_user_detail` on((`m03_user_detail`.`or_m_reg_id` = `tr06_currency_ledger`.`tr06_user_id`)))) */;

/*View structure for view view_currency_rate */

/*!50001 DROP TABLE IF EXISTS `view_currency_rate` */;
/*!50001 DROP VIEW IF EXISTS `view_currency_rate` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_currency_rate` AS (select `m07_currency_rate`.`m07_id` AS `m07_id`,`m07_currency_rate`.`m07_transaction_type` AS `m07_transaction_type`,(select `m08_transaction_type`.`m08_title` from `m08_transaction_type` where (`m08_transaction_type`.`m08_id` = `m07_currency_rate`.`m07_transaction_type`)) AS `m07_transaction_name`,`m07_currency_rate`.`m07_currency` AS `m07_currency`,(select `m06_currency_type`.`m6_name` from `m06_currency_type` where (`m06_currency_type`.`m6_id` = `m07_currency_rate`.`m07_currency`)) AS `m07_currency_name`,`m07_currency_rate`.`m07_charge` AS `m07_charge`,`m07_currency_rate`.`m07_date` AS `m07_date`,`m07_currency_rate`.`m07_description` AS `m07_description`,`m07_currency_rate`.`m07_status` AS `m07_status`,`m06_currency_type`.`m6_type` AS `m6_type`,`m06_currency_type`.`m6_account_number` AS `m6_account_number`,`m06_currency_type`.`m6_account_name` AS `m6_account_name` from (`m07_currency_rate` left join `m06_currency_type` on((`m06_currency_type`.`m6_id` = `m07_currency_rate`.`m07_currency`)))) */;

/*View structure for view view_currencys */

/*!50001 DROP TABLE IF EXISTS `view_currencys` */;
/*!50001 DROP VIEW IF EXISTS `view_currencys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_currencys` AS (select `m06_currency_type`.`m6_id` AS `m6_id`,`m06_currency_type`.`m6_name` AS `m6_name`,`m06_currency_type`.`m6_description` AS `m6_description`,`m06_currency_type`.`m6_status` AS `m6_status`,`m06_currency_type`.`m6_type` AS `m6_type`,`m06_currency_type`.`m6_icon` AS `m6_icon` from `m06_currency_type`) */;

/*View structure for view view_transaction_type */

/*!50001 DROP TABLE IF EXISTS `view_transaction_type` */;
/*!50001 DROP VIEW IF EXISTS `view_transaction_type` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_transaction_type` AS (select `m06_currency_type`.`m6_id` AS `m6_id`,`m06_currency_type`.`m6_name` AS `m6_name`,`m06_currency_type`.`m6_description` AS `m6_description`,`m06_currency_type`.`m6_status` AS `m6_status`,`m06_currency_type`.`m6_type` AS `m6_type`,`m06_currency_type`.`m6_icon` AS `m6_icon` from `m06_currency_type`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
