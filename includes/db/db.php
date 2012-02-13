<?php

$db = new mysqli($dbhost, $dbuser, $dbpasswd, $dbname);

if ( !defined('HACKFREE') )
{
	die("Hacking attempt");
}
?>
