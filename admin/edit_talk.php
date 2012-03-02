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


if ( $_POST['action'] == "edit" )
{
	if ( !$_POST['talkTitle'] ) $error = "Please enter a talk title";
	if ( !$_POST['talkDescription'] ) $error = "Please enter a talk description";
	if ( !$_POST['location'] ) $error = "Please enter a location";
	if ( !$_POST['speaker'] ) $error = "Please enter a speaker";
	if ( !$_POST['start_time'] ) $error = "Please enter a start time";
	if ( !$_POST['end_time'] ) $error = "Please enter a end time";

	$sql = "UPDATE ". TALKS_TABLE ." SET `talkTitle` = ?, `talkDescription` = ?, `location` = ?, `speaker` = ?, `start_time` = ?, `end_time` = ? WHERE id = ?";

	if ( $stmt->prepare($sql) && !$error)
	{
		$stmt->bind_param("sssiiii", $_POST['talkTitle'], $_POST['talkDescription'], $_POST['location'], $_POST['speaker'], strtotime($_POST['start_time']), strtotime($_POST['end_time']), $_POST['id']);

		if( $stmt->execute() )
		{
			$success = true;
			$smarty->assign('message', "Successfully updated talk");
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

if ( $_POST['action'] == "delete" )
{
	$sql = "DELETE FROM ". TALKS_TABLE ." WHERE id = ? LIMIT 1";

	$stmt->prepare($sql);

	$stmt->bind_param("i", $_POST['id']);

	$stmt->execute();

	header('Location: '. ROOT .'/admin/talks_index.php');
}

$sql = "SELECT x.id,x.talkTitle,x.talkDescription,x.start_time,x.end_time,x.location,x.speaker,y.name FROM ". TALKS_TABLE ." x, ". SPEAKER_TABLE ." y WHERE x.speaker = y.id AND x.id = ?";

if ( $stmt->prepare($sql) )
{
	$stmt->bind_param("i", $_GET['id']);
	if ( $stmt->execute() ) { } else { echo $stmt->error; }
		
	$result = $stmt->get_result();

	while ( $row = $result->fetch_assoc())
	{
		$row['start_time'] = date("m/d/y H:i:s", $row['start_time']);
		$row['end_time'] = date("m/d/y H:i:s", $row['end_time']);
		$values = $row;
	}
}

$stmt->close();
$smarty->assign('values', $values);
//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('admin/edit_talk.tpl');
//We're out of here.
?>
