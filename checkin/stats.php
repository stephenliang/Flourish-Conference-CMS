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

//Get Registrant Information
$stmt = $db->stmt_init();

$sql = "SELECT id, name, email, size, comments FROM ". REGISTRATION_TABLE;
//Please verify if 'id' exists, is an unsigned int(11), and is a PRIMARY KEY.
if( $stmt->prepare($sql)){
	if($stmt->execute()){
	$stmt->bind_result($id, $name, $email, $tsize, $comments);
		while ($stmt->fetch()) {
			$reglist[$id]['name'] = $name;
			$reglist[$id]['email'] = $email;
			$reglist[$id]['tsize'] = $tsize;
			$reglist[$id]['comments'] = $comments;
		}
	}
}
else{
	$error = "An error occurred retreiving registration list.";
}
//get checkin and checkout status for listing
$sql = "SELECT regid, day, check_out_in FROM ". CHECKIN_TABLE;
if( $stmt->prepare($sql)){
	if($stmt->execute()){
		$stmt->bind_result($regid, $day, $check_out_in);
			while ($stmt->fetch()) {
				if($check_out_in == 1) {
					if($day == 1) {
						$reglist[$regid]['day1'] = true;
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = true;
					}
				}
				if($check_out_in == 0) {
					if($day == 1) {
						$reglist[$regid]['day1'] = false;
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = false;
					}
				}
			}
	}
}
else{
	$error = "An error occurred retrieving checkin status.". $stmt->error() .".";
}
//Find Number or registered people
$regstat['regnum'] = count($reglist);

if ( $regstat ) $smarty->assign('regstat', $regstat);
if ( $success ) $smarty->assign('success', $success);
if ( $error ) $smarty->assign('error', $error);
if ( $message ) $smarty->assign('message', $message);
$smarty->assign('login',true);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('stats.tpl');
//We're out of here.
?>