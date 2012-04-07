<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
include ("config.php");

if ( $_POST )
{
	if ( !$_POST['message'] ) $error = "Please enter your message";
	$stmt = $db->stmt_init();

	$sql = "INSERT INTO ". FEEDBACK_TABLE ." (`name`, `email`, `message` ) VALUES (?, ?, ?)";

	if ( $stmt->prepare($sql) && !$error)
	{
		$stmt->bind_param("ssssssss", $_POST['name'], $_POST['email'], $_POST['message']);

		if( $stmt->execute() )
		{
			$smarty->assign('successMessage', "Your feedback is valuable to us. Feel free to email us at info@flourishconf.com if you have more matters to discuss.");
		}

		$stmt->close();
	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error getting your feedback for the conference, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to report the error.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

$smarty->assign('POST', $_POST);

//We reached end, parse and end
include (SITE_PATH."footer.php");
if ( $success ) {
	$smarty->display('thanks.tpl');
} else {
	$smarty->display('feedback.tpl');
}
//We're out of here.
?>
