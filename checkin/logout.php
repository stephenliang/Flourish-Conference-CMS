<?php
// Title: logout.php
// Author: clee231
// Description: Checkin page
define('SITE_PATH', '../');
define('HACKFREE', 1);
include (SITE_PATH."checkin/common.php");
//Start session
session_start();

// Nullify everything! Muahahaha!
$_SESSION = array();
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
if(isset($_SESSION['SESS_USER_ID'])) {$message = $_SESSION['SESS_FIRST_NAME'];}
//And Finally destroy everything!
if(session_destroy()) {
	$success = "Logout successful.";
}
else {
	$error = "Something went wrong. Logout unsuccessful.";
}



if ( $error ) $smarty->assign('error', $error);
if ( $success ) $smarty->assign('success', $success);

$smarty->assign('POST', $_POST);

//Why is it always so much easier to destroy things?
//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('login.tpl');
//We're out of here.
?>