<?php
define('SITE_PATH', './');
define('HACKFREE', 1);
//// INCLUDE INFO
include (SITE_PATH."common.php");

//We reached end, parse and end
include (SITE_PATH."footer.php");
$smarty->display('speakers.tpl');
//We're out of here.
?>
