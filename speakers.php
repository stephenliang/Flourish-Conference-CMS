<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");
$stmt = $db->stmt_init();

$sql = "SELECT id,name,bio,picture FROM ". SPEAKER_TABLE . " WHERE hideGallery = 0 ORDER BY name ASC";

if ( $stmt->prepare($sql) )
{
	$stmt->execute();

	$result = $stmt->get_result();

	while ( $row = $result->fetch_assoc())
	{
		$speakers[] = $row;
	}

}

$stmt->close();
$smarty->assign('speakers', $speakers);

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('speakers.tpl');
//We're out of here.
?>
