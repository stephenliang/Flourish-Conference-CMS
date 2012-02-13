<?php
// Title: index.php
// Author: clee231
// Description: Admin login page
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."common.php");

//Start session
session_start();
if(isset($_SESSION['SESS_USER_ID']) && $_SESSION['SESS_USER_ID'] != 0){
header("Location: checkin.php");
exit;
}
if ( $_POST )
{
	
	if ( !$_POST['user'] && !$_POST['pwd'] ) {
	$error = "Please enter your Username and Password before logging in"; 
	}
	elseif ( !$_POST['user']) {
	$error = "Please enter your Username"; 
	}
	elseif ( !$_POST['pwd']) {
	$error = "Please enter your Password"; 
	}

	$stmt = $db->stmt_init();

	//Prevent escape characters
	if(!get_magic_quotes_gpc()) {
	$username = mysql_real_escape_string($_POST['user']);
	} else {
	$username = $_POST['user'];
	}
	
	$sql = "SELECT member_id, firstname, lastname FROM ". USER_TABLE ." WHERE login='". $username ."' AND pawd='".md5($_POST['pwd'])."'";
	//I don't really understand bind_param, so this will work in the meantime.
	
	if ( $stmt->prepare($sql) && !$error)
	{

		if( $stmt->execute() )
		{
			//$result = mysql_query($sql);
			$stmt->bind_result($uid, $ufirst, $ulast);
			$stmt->fetch();
			if(isset($uid) && $uid != 0){
				//Start session
				session_start();
				//Login Successful
				session_regenerate_id();
				$_SESSION['SESS_USER_ID'] = $uid;
				$_SESSION['SESS_FIRST_NAME'] = $ufirst;
				$_SESSION['SESS_LAST_NAME'] = $ulast;
				session_write_close();
				header("Location: checkin.php");
				$success = true;
			}else {
				$error = "Invalid Credentials";
				$success = false;
			}
		}else{
			$success = false;
		}
		$stmt->close();
	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error verifying your credentials, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> if problem presists.".$sql;
	}
	if(isset($_SESSION['SESS_USER_ID'])) {
		$message = "You are currently logged in as: " .$_SESSION['SESS_FIRST_NAME']." " .$_SESSION['SESS_LAST_NAME']. " with user id " .$_SESSION['SESS_USER_ID']. ".";
	}
	
	if ( $error ) $smarty->assign('error', $error);
	if ( $message ) $smarty->assign('message', $message);
}

$smarty->assign('POST', $_POST);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('login.tpl');
//We're out of here.
?>