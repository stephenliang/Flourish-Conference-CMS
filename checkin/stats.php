<?php
// Title: stats.php
// Author: clee231
// Description: The wonderful page about statistics and cool information!
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."common.php");
//Start session
session_start();

//Check whether the session variable SESS_USER_ID is present or not
if(!isset($_SESSION['SESS_USER_ID']) || (trim($_SESSION['SESS_USER_ID']) == '') || (trim($_SESSION['SESS_USER_ID']) == 0)) {
	die("Invalid credentials.");
}
else{
	$message = "You are currently logged in as: " .$_SESSION['SESS_FIRST_NAME']." " .$_SESSION['SESS_LAST_NAME']. " with user id " .$_SESSION['SESS_USER_ID']. ".";
}



if ( $success ) $smarty->assign('success', $success);
if ( $error ) $smarty->assign('error', $error);
if ( $message ) $smarty->assign('message', $message);
$smarty->assign('login',true);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('stats.tpl');
//We're out of here.
?>