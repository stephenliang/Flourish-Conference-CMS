<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{$title} - Flourish! Conference 2012 - March 30 - 31</title>
		<link href="images/favicon.gif" rel="shortcut icon">
		<link rel=StyleSheet href="{#ROOT#}/templates/styles/default.css">
		<script src="{#ROOT#}/jscript/jquery-1.7.1.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
		<script src="{#ROOT#}/jscript/tiny_mce/jquery.tinymce.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="logo"><a href="{#ROOT#}"><img src="/2012/images/flourish_logo.png" alt="" /></a></div>

		<br />
		<div id="menu">
			<span class="menu_item"><a href="{#ROOT#}/about.php">About</a></span>
			<span class="menu_item"><a href="{#ROOT#}/contact.php">Contact</a></span>
			<span class="menu_item"><a href="{#ROOT#}/speaker_proposal.php">Speaker Proposal</a></span>
		</div>
		
		<br />

		{if $message}<div class="error-box"><img src="{#ROOT#}/images/stop.png" id="error-img" alt="" title="CC-by-sa 2.5 from http://tango.freedesktop.org/Tango_Desktop_Project" />{$message}</div>{/if}
		<div class="content">

