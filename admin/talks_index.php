<?php
define('SITE_PATH', '../');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

$stmt = $db->stmt_init();

$sql = "SELECT x.id,x.talkTitle,x.talkDescription,x.start_time,x.end_time,x.location,x.speaker,y.name FROM ". TALKS_TABLE ." x, ". SPEAKER_TABLE ." y WHERE x.speaker = y.id";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	while ( $row = $result->fetch_assoc())
	{
		$row['start_time'] = date("m/d/y H:i:s", $row['start_time']);
		$row['end_time'] = date("m/d/y H:i:s", $row['end_time']);
		$talks[] = $row;
	}
}

$stmt->close();
$smarty->assign('talks', $talks);
//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('admin/talks_index.tpl');
//We're out of here.
?>
