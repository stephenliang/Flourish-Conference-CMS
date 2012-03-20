<?php
define('SITE_PATH', '../');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

if ( $_POST )
{
	if ( !$_POST['name'] ) $error = "Please enter your name";
	if ( !$_POST['bio'] ) $error = "Please enter a bio";

	$stmt = $db->stmt_init();

	$sql = "INSERT INTO ". SPEAKER_TABLE ." (`name`, `bio`, `picture`, `hideGallery`) VALUES (?, ?, ?, ?)";

	if ( $stmt->prepare($sql) && !$error)
	{
		$picHash = hash("sha512", time().$_POST['name']).".jpg";
		if ( $_POST['gallery'] == "on" ) $gallery = 1; else $gallery = 0;
		$stmt->bind_param("sssi", $_POST['name'], $_POST['bio'], $picHash, $gallery );

		move_uploaded_file($_FILES['picture']['tmp_name'], SITE_PATH."/images/speakers/".$picHash);

		if( $stmt->execute() )
		{
			$success = true;
			$smarty->assign('successMessage', "Successfully added speaker");
		}else{
			$success = false;
		}

		$stmt->close();
	}else{
		$success = false;
	}

	if ( !$success && !$error )
	{
		$error ="There was an error, please email us at <a href=\"mailto:". CONTACT_EMAIL ."\">". CONTACT_EMAIL ."</a> to report the error.";
	}

	if ( $error ) $smarty->assign('message', $error);
}

$smarty->assign('POST', $_POST);

//We reached end, parse and end
include (SITE_PATH."footer.php");
if ( $success )
	$smarty->display('thanks.tpl');
else
	$smarty->display('admin/add_speaker.tpl');
//We're out of here.
?>
