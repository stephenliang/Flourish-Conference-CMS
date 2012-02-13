#
# Table structure for table 'checkin'
#

CREATE TABLE `checkin` (
	`id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`regid` INT( 11 ) NULL ,
	`checked_by` INT( 11 ) NOT NULL,
	`day` INT NOT NULL ,
	`check_out_in` BOOL NOT NULL ,
	`time_stamp` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;



#
# Dumping data for table 'checkin'
#

INSERT INTO `checkin` ( `id` , `regid` , `checked_by` , `day` , `check_out_in` , `time_stamp` )
VALUES (
NULL , '1', '1', '1', '1', NOW( )
);