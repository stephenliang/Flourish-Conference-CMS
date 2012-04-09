<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
include ("config.php");

if ( $_POST )
{
	if ( !$_POST['message'] ) $error = "Please enter your message";

	if ( !$error)
	{
		$smarty->assign('successMessage', "Your feedback is valuable to us. Feel free to email us at info@flourishconf.com if you have more matters to discuss.");
			$headers = 'From: event@flourishconf.com' . "\r\n" .
				   'Reply-To: event@flourishconf.com' . "\r\n" .
				   'CC: event@flourishconf.com' . "\r\n";
			if (isset($_POST['email'])) $headers .= "To: " . $_POST['email'] ."\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

			$message = "Thank you for submitting feedback for Flourish Conference 2012! Here are the details that you have entered:<br />";

			foreach ( $_POST as $key => $value )
			{
				if ( $key != "recaptcha_challenge_field" && $key != "submit" && $key != "recaptcha_response_field")
					$message .= $key .": ". strip_tags($value)."<br />";
			}

			mail($_POST['email'], "Thank you for submitting feedback for Flourish Conference 2012!", $message, $headers);
			$success = true;

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
