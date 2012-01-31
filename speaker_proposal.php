<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

if ( $_POST )
{
	
}

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('speaker_proposal.tpl');
//We're out of here.
?>
