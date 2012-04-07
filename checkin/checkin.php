<?php
// Title: checkin.php
// Author: clee231
// Description: Checkin page
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."checkin/common.php");
//Start session
session_start();

//Check whether the session variable SESS_USER_ID is present or not
if(!isset($_SESSION['SESS_USER_ID']) || (trim($_SESSION['SESS_USER_ID']) == '') || (trim($_SESSION['SESS_USER_ID']) == 0)) {
	die("Invalid credentials. If you believe this is an error, please verify you have cookies and javascript enabled.");
}
else{
	$message = "You are currently logged in as: " .$_SESSION['SESS_FIRST_NAME']." " .$_SESSION['SESS_LAST_NAME']. " with user id " .$_SESSION['SESS_USER_ID']. ".";
}


if ($_POST['day'] && ($_POST['checkin_for'] || $_POST['checkout_for'])){
	//Prevent double checkin or checkout
	$stmt = $db->stmt_init();
	if($_POST['checkin_for']){
	$regs = $_POST['checkin_for'];
	}
	else{
	$regs = $_POST['checkout_for'];
	}
	/*
	$sql = "SELECT regid, check_out_in FROM `". CHECKIN_TABLE ."` WHERE regid='". $regs . "' ORDER BY id DESC LIMIT 1";
	if( $stmt->prepare($sql)){
		if($stmt->execute()){
		$stmt->bind_result($regid, $check_status);
		$stmt->fetch();
		if(($check_status == 1 && (isset($_POST['checkin_for']))) || ($check_status == 0 && (isset($_POST['checkout_for'])))) {
			$error = "Resubmittion error.  If you refreshed the page, do not resubmit form data.";
		}
		}
	}
	 */
}
if ($_POST['day'] && ($_POST['checkin_for'] || $_POST['checkout_for']) && (!$error)){	
	//checkin and checkout block
	$stmt = $db->stmt_init();
	$sql = "INSERT INTO `" . CHECKIN_TABLE . "` (`regid` , `day` , `check_out_in`, `checked_by`) VALUES (?,?,?,?)";
	if ($stmt->prepare($sql)){
		if(($_POST['day'] == 1) && ($_POST['checkin_for'])) {
			$checkin = 1;
			$stmt->bind_param("siii", $_POST['checkin_for'], $_POST['day'], $checkin, $_SESSION['SESS_USER_ID']);
		}elseif(($_POST['day'] == 1) && ($_POST['checkout_for'])) {
			$checkin = 0;
			$stmt->bind_param("siii", $_POST['checkout_for'], $_POST['day'], $checkin, $_SESSION['SESS_USER_ID']);
		}
		if(($_POST['day'] == 2) && ($_POST['checkin_for'])) {
			$checkin = 1;
			$stmt->bind_param("siii", $_POST['checkin_for'], $_POST['day'], $checkin, $_SESSION['SESS_USER_ID']);
		}elseif(($_POST['day'] == 2) && ($_POST['checkout_for'])) {
			$checkin = 0;
			$stmt->bind_param("siii", $_POST['checkout_for'], $_POST['day'], $checkin, $_SESSION['SESS_USER_ID']);
		}
		if( $stmt->execute() ) {
			if($_POST['checkin_for']) {
			$success = "Registrant #".$_POST['checkin_for']." has been checked-in";
			$id = $_POST['checkin_for'];}
			if($_POST['checkout_for']) {
			$success = "Registrant #".$_POST['checkout_for']." has been checked-out";
			$id = $_POST['checkin_for'];}
		}
		else{
		$error = $stmt->error();
		}
	}//checkin and checkout block end
}
//registrant listing block
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
//wireless credentials block--WIP
$stmt = $db->stmt_init();
$sql = "SELECT id, username, password FROM ". WIRELESS_TABLE;
if ($stmt->prepare($sql)){
	if( $stmt->execute()) {
		$stmt->bind_result($id, $wifiuser, $wifipass);
		while ($stmt->fetch()) {
			$reglist[$id]['wifiuser'] = $wifiuser;
			$reglist[$id]['wifipass'] = $wifipass;
		}
	}
}
//wireless credentials block end
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
	$error = "An error occurred retrieving checkin status.". $stmt->error .".";
}
//registrant listing block end
if ( $success ) $smarty->assign('success', $success);
if ( $error ) $smarty->assign('error', $error);
if ( $message ) $smarty->assign('message', $message);
if ( $reglist ) $smarty->assign('reglist', $reglist);
$smarty->assign('login',true);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('checkin.tpl');
//We're out of here.
?>
