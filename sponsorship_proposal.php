<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

if ( $_POST )
{
	$recaptcha_response = recaptcha_check_answer( RECAPTCHA_PRIVATE_KEY, $_SERVER['REMOTE_ADDR'],  $_POST["recaptcha_challenge_field"], $_POST["recaptcha_response_field"]);

	if ( !$recaptcha_response->is_valid )
	{
		$error = "The recaptcha code that you entered is not valid";
	}

	if ( !$_POST['name'] ) $error = "Please enter your name";
	if ( !$_POST['title'] ) $error = "Please enter your title";
	if ( !$_POST['email'] ) $error = "Please enter your email";
	if ( !$_POST['company'] ) $error = "Please enter your company";
	if ( !$_POST['phone'] ) $error = "Please enter your phone number";
	if ( !$_POST['address'] ) $error = "Please enter your address";
	if ( !$_POST['sponsorshipAmount'] ) $error = "Please enter your sponsorship amount";
	if ( !$_POST['businessStatus'] ) $error = "Please enter your business status";
	if ( !$_POST['miniexpo'] ) $error = "Please enter whether you would like to come to the mini expo or not";

	if ( !$error )
	{
		$smarty->assign('successMessage', "Thank you for submitting a Sponsorship Proposal! An email has been sent confirming your proposal. We will review your proposal and we will get back to you as soon as we can!");

		$headers = 'From: event@flourishconf.com' . "\r\n" .
			   'Reply-To: event@flourishconf.com' . "\r\n" .
			   'Cc: event@flourishconf.com' . "\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

		$message = "Thank you for submitting a Sponsorship Proposal for Flourish Conference 2012! Here are the details that you have entered:<br /><br />";

		foreach ( $_POST as $key => $value )
		{
			if ( $key != "recaptcha_challenge_field" && $key != "submit" && $key != "recaptcha_response_field")
				$message .= $key .": ". strip_tags($value)."<br />";
		}

		$message .= "<br /><br />We will get back to as soon as we can to process your proposal. Thank you for supporting Flourish Conference!<br /><br />Thanks,<br />The Flourish Organizers";

		mail($_POST['email'], "Thank you for submitting a Sponsorship Proposal for Flourish Conference 2012!", $message, $headers);
		$success = true;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error submitting your proposal, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to submit your proposal.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

$smarty->assign('recaptcha', recaptcha_get_html(RECAPTCHA_PUBLIC_KEY));
$smarty->assign('POST', $_POST);
//We reached end, parse and end
include (SITE_PATH."footer.php");
if ( $success )
	$smarty->display('thanks.tpl');
else
	$smarty->display('sponsorship_proposal.tpl');
//We're out of here.
?>
