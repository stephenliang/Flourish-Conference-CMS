<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
$stmt = $db->stmt_init();

$sql = "SELECT id,name,bio,picture FROM ". SPEAKER_TABLE . " WHERE id = ?";

if ( $stmt->prepare($sql) )
{
	$stmt->bind_param("i", $_GET['id']);
	$stmt->execute();

	$result = $stmt->get_result();

	$row = $result->fetch_assoc();
	$speaker = $row;
	$sql = "SELECT * FROM ". TALKS_TABLE ." WHERE speaker = ?";
	if ( $stmt->prepare($sql) )
	{
		$stmt->bind_param("i", $speaker['id']);
		$stmt->execute();
		
		$result = $stmt->get_result();

		while ( $row = $result->fetch_assoc())
		{
			$row['hour'] = date("H", $row['start_time']);
			$row['minute'] = date("i", $row['start_time']);
			$row['dayofweek'] = date("l", $row['start_time']);
			$row['date'] = date("m/d/Y", $row['start_time']);
			$row['start_time'] = date("g:i A", $row['start_time']);
			$row['end_time'] = date("g:i A", $row['end_time']);
			$talks[] = $row;
		}
	}
}

$stmt->close();
$smarty->assign('speaker', $speaker);
$smarty->assign('talks', $talks);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('speaker_details.tpl');
//We're out of here.
?>
