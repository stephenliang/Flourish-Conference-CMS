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
	if ( !$_POST['bio'] ) $error = "Please enter your bio";
	if ( !$_POST['titlePresentation'] ) $error = "Please enter your title of the presentation you want to present";
	if ( !$_POST['description'] ) $error = "Please enter the description of the presentation you would like to present";

	$stmt = $db->stmt_init();

	$sql = "INSERT INTO ". SPEAKER_PROPOSAL_TABLE ." (`name`, `company`, `title`, `phone`, `email`, `bio`, `titlePresentation`, `description`, `av`, `other`, `ip_address`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	if ( $stmt->prepare($sql) && !$error)
	{
		$stmt->bind_param("sssssssssss", $_POST['name'], $_POST['company'], $_POST['title'], $_POST['phone'], $_POST['email'], $_POST['bio'], $_POST['titlePresentation'], $_POST['description'], $_POST['av'], $_POST['other'], $_SERVER['REMOTE_ADDR']);

		if( $stmt->execute() )
		{
			$smarty->assign('successMessage', "Thank you for submitting a Speaker Proposal! An email has been sent confirming your proposal. We will review your proposal and we will get back to you as soon as we can!");

			$headers = 'From: event@flourishconf.com' . "\r\n" .
				   'Reply-To: event@flourishconf.com' . "\r\n" .
				   'Cc: event@flourishconf.com' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

			$message = "Thank you for submitting a Speaker Proposal for Flourish Conference 2012! Here are the details that you have entered:<br />";

			foreach ( $_POST as $key => $value )
			{
				if ( $key != "recaptcha_challenge_field" && $key != "submit" && $key != "recaptcha_response_field")
					$message .= $key .": ". strip_tags($value)."<br />";
			}

			mail($_POST['email'], "Thank you for submitting a Speaker Proposal for Flourish Conference 2012!", $message, $headers);
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
	$smarty->display('speaker_proposal.tpl');
//We're out of here.
?>
