<?php
// Title: check.php
// Author: clee231
// Description: Check login status
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."common.php");

//Start session
session_start();
if(isset($_SESSION['SESS_USER_ID'])) {echo "User ID: " . $_SESSION['SESS_USER_ID'];}
if(isset($_SESSION['SESS_FIRST_NAME'])) {echo "<br />First Name: " . $_SESSION['SESS_FIRST_NAME'];}
if(isset($_SESSION['SESS_LAST_NAME'])) {echo "<br />Last Name: " . $_SESSION['SESS_LAST_NAME'];}
?>