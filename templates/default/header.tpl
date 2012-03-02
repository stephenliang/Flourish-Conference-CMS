<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{$title} - Flourish! Conference 2012 - March 30 - 31</title>
		<link href="images/favicon.gif" rel="shortcut icon">
		<link rel=StyleSheet href="{#ROOT#}/templates/styles/default.css">
		<link rel=StyleSheet href="{#ROOT#}/jscript/css/smoothness/jquery-ui-1.8.17.custom.css">
		<script src="{#ROOT#}/jscript/jquery-1.7.1.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/tiny_mce/jquery.tinymce.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/twitter.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/global.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="main-container">
		<!-- Place this tag where you want the +1 button to render -->
		<div id="logo"><a href="{#ROOT#}"><img src="{#ROOT#}/images/flourish_logo.png" alt="" /></a></div>

		<br />
		<div id="menu">
			<span class="menu_item"><a href="{#ROOT#}/about.php">About Us</a></span>
			<span class="menu_item"><a href="{#ROOT#}/registration.php">Registration</a></span>
			<span class="menu_item"><a href="{#ROOT#}/speakers.php">Speakers</a></span>
			<span class="menu_item"><a href="{#ROOT#}/schedule.php">Schedule</a></span>
			<span class="menu_item"><a href="{#ROOT#}/sponsorship_proposal.php">Sponsorship Proposals</a></span>
			<span class="menu_item"><a href="{#ROOT#}/miniexpo.php">Mini Expo</a></span>
			<span class="menu_item"><a href="{#ROOT#}/directions.php">Directions</a></span>
			<span class="menu_item"><a href="{#ROOT#}/contact.php">Contact</a></span>
		</div>
		
		<br />

		{if $message}<div class="error-box"><img src="{#ROOT#}/images/stop.png" id="error-img" alt="" title="CC-by-sa 2.5 from http://tango.freedesktop.org/Tango_Desktop_Project" />{$message}</div>{/if}
		<div class="content">

