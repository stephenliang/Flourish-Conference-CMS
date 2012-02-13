#
# Table structure for table 'f12_registration_table'
#

CREATE TABLE `f12_registration_table` (
`id` INT( 11 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`email` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`size` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`student` VARCHAR( 5 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`hear` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
`comments` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
`ip_address` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`where` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;



#
# Dumping data for table 'f12_registration_table'
#

INSERT INTO `f12_registration_table` ( `id` , `name` , `email` , `size` , `student` , `hear` , `comments` , `ip_address` , `where` )
VALUES (
NULL , 'Chase Lee', 'clee231@uic.edu', 'M', 'yes', 'ACM', 'THis is a test!', '127.0.0.1', 'Illinois'
);
