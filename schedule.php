<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
$stmt = $db->stmt_init();

$sql = "SELECT x.id,x.talkTitle,x.talkDescription,x.start_time,x.end_time,x.location,x.speaker,y.name FROM ". TALKS_TABLE ." x, ". SPEAKER_TABLE ." y WHERE x.speaker = y.id AND start_time < 1333170000 ORDER BY start_time ASC";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	//check for same time talks
	$current_hour = 0;
	$current_minute = 0;
	$i = 0;
	$j = 0;
	$fri_max_tracks = 0;

	while ( $row = $result->fetch_assoc())
	{
		$hour = date("G", $row['start_time']);
		$minute = date("i", $row['start_time']);
		$row['start_time'] = date("g:i A", $row['start_time']);
		$row['end_time'] = date("g:i A", $row['end_time']);
		$row['hour'] = $hour;

		if ( $hour != $current_hour || $minute != $current_minute )
		{
			$i++;
			$j = 0;
		}else{
			$j++;
		}

		if ( $j > $fri_max_tracks ) $fri_max_tracks = $j;

		$talksFri[$i][$j] = $row;

		$current_hour = $hour;
		$current_minute = $minute;
	}

}

$sql = "SELECT x.id,x.talkTitle,x.talkDescription,x.start_time,x.end_time,x.location,x.speaker,y.name FROM ". TALKS_TABLE ." x, ". SPEAKER_TABLE ." y WHERE x.speaker = y.id AND start_time >= 1333170000 ORDER BY start_time ASC";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	//check for same time talks
	$current_hour = 0;
	$current_minute = 0;
	$i = 0;
	$j = 0;
	$sat_max_tracks = 0;

	while ( $row = $result->fetch_assoc())
	{
		$hour = date("G", $row['start_time']);
		$minute = date("i", $row['start_time']);
		$row['start_time'] = date("g:i A", $row['start_time']);
		$row['end_time'] = date("g:i A", $row['end_time']);
		$row['hour'] = $hour;

		if ( $hour != $current_hour || $minute != $current_minute )
		{
			$i++;
			$j = 0;
		}else{
			$j++;
		}

		if ( $j > $sat_max_tracks ) $sat_max_tracks = $j;

		$talksSat[$i][$j] = $row;

		$current_hour = $hour;
		$current_minute = $minute;
	}

}
$stmt->close();
$smarty->assign('talksFri', $talksFri);
$smarty->assign('talksSat', $talksSat);
$smarty->assign('satTracks', $sat_max_tracks+1);
$smarty->assign('friTracks', $fri_max_tracks+1);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('schedule.tpl');
//We're out of here.
?>
