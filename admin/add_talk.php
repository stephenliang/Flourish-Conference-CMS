<?php
define('SITE_PATH', '../');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

$stmt = $db->stmt_init();

$sql = "SELECT id,name,bio,picture FROM ". SPEAKER_TABLE . " ORDER BY name ASC";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	while ( $row = $result->fetch_assoc())
	{
		$speakers[] = $row;
	}
}

$smarty->assign('speakers', $speakers);

if ( $_POST )
{
	if ( !$_POST['talkTitle'] ) $error = "Please enter a talk title";
	if ( !$_POST['talkDescription'] ) $error = "Please enter a talk description";
	if ( !$_POST['location'] ) $error = "Please enter a location";
	if ( !$_POST['speaker'] ) $error = "Please enter a speaker";
	if ( !$_POST['start_time'] ) $error = "Please enter a start time";
	if ( !$_POST['end_time'] ) $error = "Please enter a end time";

	$sql = "INSERT INTO ". TALKS_TABLE ." (`talkTitle`, `talkDescription`, `location`, `speaker`, `start_time`, `end_time`) VALUES (?, ?, ?, ?, ?, ?)";

	if ( $stmt->prepare($sql) && !$error)
	{
		$stmt->bind_param("sssiii", $_POST['talkTitle'], $_POST['talkDescription'], $_POST['location'], $_POST['speaker'], strtotime($_POST['start_time']), strtotime($_POST['end_time']) );

		if( $stmt->execute() )
		{
			$success = true;
			$smarty->assign('successMessage', "Successfully added talk");
		}else{
			$success = false;
		}

	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to report the error.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

$stmt->close();
$smarty->assign('POST', $_POST);

//We reached end, parse and end
include (SITE_PATH."footer.php");
if ( $success )
	$smarty->display('thanks.tpl');
else
	$smarty->display('admin/add_talk.tpl');
//We're out of here.
?>
