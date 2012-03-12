<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
$stmt = $db->stmt_init();

$sql = "SELECT x.id,x.talkTitle,x.talkDescription,x.start_time,x.end_time,x.location,x.speaker,y.name FROM ". TALKS_TABLE ." x, ". SPEAKER_TABLE ." y WHERE x.speaker = y.id ORDER BY start_time ASC";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	//check for same time talks

	while ( $row = $result->fetch_assoc())
	{
		if ( $row['name'] != "" )
		{
			$json[] = array (
				'name'		=>	$row['talkTitle'],
				'room'		=>	$row['location'],
				'start'		=>	date("m/d/Y H:i:s", $row['start_time']),
				'end'		=>	date("m/d/Y H:i:s", $row['end_time']),
				'authors'	=>	$row['name'],
				'contact'	=>	"",
				'released'	=>	true,
				'license'	=>	"",
				'description'	=>	$row['talkDescription'],
				'conf_key'	=>	$row['id'],
				'conf_url'	=>	ROOT."/speakers_details.php?id=".$row['speaker'],
				'tags'		=>	"",
			);
		}
	}

	echo json_encode($json);
}

$stmt->close();

//We reached end, parse and end
include (SITE_PATH."footer.php");
//We're out of here.
?>
