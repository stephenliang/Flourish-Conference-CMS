<?php
define('SITE_PATH', '../');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

$stmt = $db->stmt_init();

if ( $_POST['action'] == "edit" )
{
	if ( !$_POST['name'] ) $error = "Please enter your name";
	if ( !$_POST['bio'] ) $error = "Please enter a bio";


	if ( $_FILES['picture'] ) 
		$sql = "UPDATE ". SPEAKER_TABLE ." SET `name` = ?, `bio` = ?, `picture` = ? WHERE id = ?";
	else
		$sql = "UPDATE ". SPEAKER_TABLE ." SET `name` = ?, `bio` = ? WHERE id = ?";

	if ( $stmt->prepare($sql) && !$error)
	{
		$picHash = hash("sha512", time().$_POST['name']).".jpg";

		if ( $_FILES['picture'] ) 
		{
			$stmt->bind_param("sssi", $_POST['name'], $_POST['bio'], $picHash, $_POST['id'] );
			move_uploaded_file($_FILES['picture']['tmp_name'], SITE_PATH."/images/speakers/".$picHash);
		}else{
			$stmt->bind_param("ssi", $_POST['name'], $_POST['bio'], $_POST['id']);
		}

		if( $stmt->execute() )
		{
			$success = true;
			$smarty->assign('message', "Successfully updated speaker");
		}else{
			$success = false;
		}

	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error regestering you for the conference, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to report the error.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

if ( $_POST['action'] == "delete" )
{
	$sql = "DELETE FROM ". SPEAKER_TABLE ." WHERE id = ? LIMIT 1";

	$stmt->prepare($sql);

	$stmt->bind_param("i", $_POST['id']);

	$stmt->execute();

	header('Location: '. ROOT .'/admin/speakers_index.php');
}

$sql = "SELECT id,name,bio,picture FROM ". SPEAKER_TABLE ." WHERE id = ?";

if ( $stmt->prepare($sql) )
{
	$stmt->bind_param("i", $_GET['id']);
	if ( $stmt->execute() ) { } else { echo $stmt->error; }

	$stmt->bind_result($values['id'], $values['name'], $values['bio'], $values['picture']);
	$stmt->fetch();
}

$stmt->close();
$smarty->assign('values', $values);
//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('admin/edit_speaker.tpl');
//We're out of here.
?>
