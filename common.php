<?php

// PREVENT PEOPLE VIEWING THIS PAGE BY ITSELF
if ( !defined('HACKFREE') )
{
	die("Hacking Attempt. Logged");
}

// If website is disabled, then show message
//

error_reporting(E_ALL ^ E_NOTICE); // We want all errors but them notices
set_magic_quotes_runtime(0); // Disable magic_quotes_runtime, good programming practise
ini_set("display_errors", "On");

include (SITE_PATH."config.php");

include (SITE_PATH."includes/constants.php");
include (SITE_PATH."includes/functions.php");

require(SITE_PATH.'smarty/libs/Smarty.class.php');
include (SITE_PATH."includes/db/mysql4.php");
include (SITE_PATH."includes/db/db.php");

// We do not need this any longer, unset for safety purposes
unset($dbpasswd);
unset($forumpasswd);

$smarty = new smarty;

//Let's accelerate this website, guys!
$smarty->caching = false;
$smarty->cache_lifetime = 9999999;
$smarty ->compile_check = true;
$smarty->config_dir = SITE_PATH.'configs/';
$smarty->cache_dir = SITE_PATH.'cache/';
$smarty->template_dir = SITE_PATH.'templates/default/';
//Tidy up all html
//$smarty->load_filter('output','tidyrepairhtml');

$smarty->assign('site', "default");
?>
