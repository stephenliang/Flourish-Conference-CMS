<?php
// Title: stats.php
// Author: clee231
// Description: The wonderful page about statistics and cool information!
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."checkin/common.php");
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
if(!$stafflist) {
	$stafflist = array(); // Create a list of staff member ids.
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
						preg_match('/[1-2]?[0-9]:+/', $time_stamp, $hour); //regex matching the hour number in the following format: '2012-03-10 03:47:05'
						$daytime1[substr($hour[0], 0, -1)]++; // Count the number of checkins on each day by hour. Trim colon from regex.
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = true;
						$daystat['day2']['trueincount']++;
						$staffstat[$checked_by]['d2in']++;
						preg_match('/[1-2]?[0-9]:+/', $time_stamp, $hour);
						$daytime2[substr($hour[0], 0, -1)]++;
					}
				}
				if($check_out_in == 0) { //checkout
					if($day == 1) {
						$reglist[$regid]['day1'] = false;
						$daystat['day1']['trueoutcount']++;
						$staffstat[$checked_by]['d1out']++;
						preg_match('/[1-2]?[0-9]:+/', $time_stamp, $hour);
						$daytime1[substr($hour[0], 0, -1)]--; //subtract checkout for accuracy
					}
					if($day == 2) {
						$reglist[$regid]['day2'] = false;
						$daystat['day2']['trueoutcount']++;
						$staffstat[$checked_by]['d2out']++;
						preg_match('/[1-2]?[0-9]:+/', $time_stamp, $hour);
						$daytime2[substr($hour[0], 0, -1)]--; //Only thing that this does not account for is if a user checksin one hour and checksout in a different hour.
					}
				}
				$reglist[$regid]['staffid'] = $checked_by; //Set who checked in this registrant
				if($reglist[$regid]['day1'] || $reglist[$regid]['day2']) {
					$reglist[$regid]['timein'] = $time_stamp;  //and when this person was checkedin
				}
				if(!in_array($checked_by, $stafflist)) {
				$stafflist[] = $checked_by; // Create a list of staff member IDs
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
if ( $daytime1 ) $smarty->assign('daytime1', $daytime1);
if ( $daytime2 ) $smarty->assign('daytime2', $daytime2);
if ( $success ) $smarty->assign('success', $success);
if ( $error ) $smarty->assign('error', $error);
if ( $message ) $smarty->assign('message', $message);
$smarty->assign('login',true);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('stats.tpl');
//We're out of here.
?>