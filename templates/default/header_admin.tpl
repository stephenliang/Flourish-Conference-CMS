<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{$title} - Flourish! Conference 2012 - March 30 - 31</title>
		<link href="images/favicon.gif" rel="shortcut icon">
		<link rel=StyleSheet href="{#ROOT#}/templates/styles/admin.css">
		<link type="text/css" href="{#ROOT#}/jscript/css/flourish/jquery-ui-1.8.17.custom.css" rel="Stylesheet" />
		<script src="{#ROOT#}/jscript/jquery-1.7.1.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/tiny_mce/jquery.tinymce.js" type="text/javascript"></script>
		{if $login || $success}<script src="{#ROOT#}/jscript/admin.js" type="text/javascript"></script>{/if}
	</head>

	<body>
		<div id="main-container">
		<!-- Place this tag where you want the +1 button to render -->
		<div id="logo"><a href="{#ROOT#}"><img src="/2012/images/admin-logo.png" alt="Flourish Logo" /></a></div>

		<br />
		<div id="menu">
			{if $login}<span class="menu_item"><a href="javascript:void(0)">Help</a></span> | <span class="menu_item"><a href="./checkin.php">Checkin</a></span> | <span class="menu_item"><a href="./stats.php">Statistics</a></span> | <span class="menu_item"><a href="./logout.php">Logout</a></span>{else}<span class="menu_item"><a href="{#ROOT#}">Return to Main Site</a></span>{/if}
		</div>
		
		<br />

		{if $error}<div class="error-box"><img src="{#ROOT#}/images/stop.png" id="error-img" alt="" title="CC-by-sa 2.5 from http://tango.freedesktop.org/Tango_Desktop_Project" />{$error}</div>{/if}
		{if $success}<div class="success-box"><img src="{#ROOT#}/images/logout.png" id="logout-img" alt="" title="CC-by-sa 2.5 from http://tango.freedesktop.org/Tango_Desktop_Project" />{$success}</div>{/if}
		<div class="content">

