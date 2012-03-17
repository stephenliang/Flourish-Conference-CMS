#
# Table structure for table 'wireless'
#

CREATE TABLE `wireless` (
`id` INT( 11 ) UNSIGNED NOT NULL PRIMARY KEY ,
`username` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
`password` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;



#
# Dumping data for table 'wireless'
#

INSERT INTO `wireless` ( `id` , `username` , `password`) VALUES (2,'testuser','testpas!@#$%^&*()\/ndfd');