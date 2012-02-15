<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
include ("config.php");

if ( $_POST )
{
	$recaptcha_response = recaptcha_check_answer( RECAPTCHA_PRIVATE_KEY, $_SERVER['REMOTE_ADDR'],  $_POST["recaptcha_challenge_field"], $_POST["recaptcha_response_field"]);

	if ( !$recaptcha_response->is_valid )
	{
		$error = "The recaptcha code that you entered is not valid";
	}

	if ( !$_POST['name'] ) $error = "Please enter your name";
	if ( !$_POST['email'] ) $error = "Please enter your email";
	if ( !$_POST['student'] ) $error = "Please enter whether you are a UIC student or not";
	if ( $_POST['size'] != "small" && $_POST['size'] != "medium" && $_POST['size'] != "large" && $_POST['size'] != "xl" && $_POST['size'] != "xxl" && $_POST['size'] != "" ) $error = "Please enter a proper T-Shirt size";
	if ( $_POST['student'] != "yes" && $_POST['student'] != "no" ) $error = "Please enter a proper student status";

	$stmt = $db->stmt_init();

	$sql = "INSERT INTO ". REGISTRATION_TABLE ." (`name`, `email`, `size`, `student`, `hear`, `comments`, `ip_address`, `where`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	if ( $stmt->prepare($sql) && !$error)
	{
		$stmt->bind_param("ssssssss", $_POST['name'], $_POST['email'], $_POST['size'], $_POST['student'], $_POST['hear'], $_POST['comments'], $_SERVER['REMOTE_ADDR'], $_POST['where']);

		if( $stmt->execute() )
		{
			$smarty->assign('successMessage', "Thank you for registering for Flourish Conference 2012! An email has been sent confirming your proposal. We will send you updates on the conference as soon as we have more information.");

			$headers = 'From: event@flourishconf.com' . "\r\n" .
				   'Reply-To: event@flourishconf.com' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

			$message = "Thank you for Registering for Flourish Conference 2012! Here are the details that you have entered:<br />";

			foreach ( $_POST as $key => $value )
			{
				if ( $key != "recaptcha_challenge_field" && $key != "submit" && $key != "recaptcha_response_field")
					$message .= $key .": ". strip_tags($value)."<br />";
			}

			mail($_POST['email'], "Thank you for registering for Flourish Conference 2012!", $message, $headers);
			$success = true;
		}else{
			$success = false;
		}

		$stmt->close();
	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error regestering you for the conference, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to report the error.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

$smarty->assign('recaptcha', recaptcha_get_html(RECAPTCHA_PUBLIC_KEY));
$smarty->assign('POST', $_POST);

//We reached end, parse and end
include (SITE_PATH."footer.php");
if ( $success ) {
	echo "loading thanks";
	$smarty->display('thanks.tpl');
} else {
	echo "Error: ".$stmt->error;
	$smarty->display('registration.tpl');
}
//We're out of here.
?>
