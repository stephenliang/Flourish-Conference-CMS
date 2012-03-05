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
$sql = "SELECT regid, day, check_out_in, checked_by, time_stamp FROM ". CHECKIN_TABLE;
if( $stmt->prepare($sql)){
	if($stmt->execute()){
		$stmt->bind_result($regid, $day, $check_out_in, $checked_by, $time_stamp);
			while ($stmt->fetch()) {
				if($check_out_in == 1) { //checkin
					if($day == 1) {
						$reglist[$regid]['day1'] = true;
						$daystat['day1']['trueincount']++; //true count, meaning how many times the button was actually pressed.
						$staffstat[$checked_by]['d1in']++; //count how many checkin-outs by each staff
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = true;
						$daystat['day2']['trueincount']++;
						$staffstat[$checked_by]['d2in']++;
					}
				}
				if($check_out_in == 0) { //checkout
					if($day == 1) {
						$reglist[$regid]['day1'] = false;
						$daystat['day1']['trueoutcount']++;
						$staffstat[$checked_by]['d1out']++;
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = false;
						$daystat['day2']['trueoutcount']++;
						$staffstat[$checked_by]['d2out']++;
					}
				}
				$reglist[$regid]['staffid'] = $checked_by;
				if($reglist[$regid]['day1'] || $reglist[$regid]['day2']) {
					$reglist[$regid]['timein'] = $time_stamp; 
				}
				if(!$stafflist) {
					$stafflist = array();
				}
				if(!in_array($checked_by, $stafflist)) {
				$stafflist[] = $checked_by;
				}
			}
	}
}
else{
	$error = "An error occurred retrieving checkin status.". $stmt->error() .".";
}
//Count total checkins on each day
foreach ($reglist as $value) {
    if ($value['day1'] == true) {
		$regstat['day1ct']++;
	}
	if ($value['day2'] == true) {
		$regstat['day2ct']++;
	}
}
//Find Number or registered people
$regstat['regnum'] = count($reglist);


if ( $regstat ) $smarty->assign('regstat', $regstat);
if ( $stafflist ) $smarty->assign('stafflist', $stafflist);
if ( $staffstat ) $smarty->assign('staffstat', $staffstat);
if ( $daystat ) $smarty->assign('daystat', $daystat);
if ( $success ) $smarty->assign('success', $success);
if ( $error ) $smarty->assign('error', $error);
if ( $message ) $smarty->assign('message', $message);
$smarty->assign('login',true);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('stats.tpl');
//We're out of here.
?>