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
include (SITE_PATH."includes/recaptchalib.php");

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
//$smarty->debugging = true;
$smarty->template_dir = SITE_PATH.'templates/default/';
if ( !isset($_COOKIE['show-bar'] ) ) $_COOKIE['show-bar'] = 1;
//$browser = get_browser( null, true);
if ( $browser['ismobiledevice'] == 1 ) {
	$smarty->assign('mobileDevice', 1);
  	//$smarty->assign('site', "mobile");
	//$smarty->template_dir = SITE_PATH.'mobile/templates/default/';
	//$smarty ->compile_dir = SITE_PATH."templates_c/mobile";
} else {
	$smarty->assign('site', "default");
}
$smarty->assign('showBar', $_COOKIE['show-bar']);
?>
