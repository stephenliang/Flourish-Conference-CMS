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
		<div id="logo-container">
		<div id="tagline">
				<img src="{#ROOT#}/images/flourish_tagline.jpg" alt="" />
			</div>

			<div id="logo">
				<a href="{#ROOT#}"><img src="{#ROOT#}/images/flourish_logo.jpg" alt="" /></a>
			</div>
						<div style="clear: both;"></div>
		</div>
		<br />
		<div id="menu">
			<span class="menu_item"><a href="{#ROOT#}/about.php">About</a></span>
			<span class="menu_item"><a href="{#ROOT#}/speakers.php">Speakers</a></span>
			<span class="menu_item"><a href="{#ROOT#}/schedule.php">Schedule</a></span>
			<span class="menu_item"><a href="{#ROOT#}/miniexpo.php">Mini Expo</a></span>
			<span class="menu_item"><a href="{#ROOT#}/directions.php">Directions</a></span>
			<span class="menu_item"><a href="{#ROOT#}/contact.php">Contact</a></span>
			<span class="menu_item"><a href="{#ROOT#}/credits.php">Credits</a></span>
		</div>
		
		<br />

		{if $message}<div class="error-box"><img src="{#ROOT#}/images/stop.png" id="error-img" alt="" title="CC-by-sa 2.5 from http://tango.freedesktop.org/Tango_Desktop_Project" />{$message}</div>{/if}
		<div id="content-container">
		<div id="flourish-helpers">
			<ul>
				<li><a href="http://fused.com"><img src="{#ROOT#}/images/flourish-helpers/fused.png" alt="Fused" /></a></li>
			</ul>
			<ul>
				<li><a href="http://orbitz.com"><img src="{#ROOT#}/images/flourish-helpers/orbitz.png" alt="Orbitz" /></a></li>
				<li><a href="http://www.uic.edu/depts/chcc/programs/Campus/Files/SAFC.html"><img src="{#ROOT#}/images/flourish-helpers/safc-black.png" alt="SAFC" /></a></li>
				<li><a href="http://linuxjournal.com"><img src="{#ROOT#}/images/flourish-helpers/ljcolor.jpg" alt="Linux Journal" /></a></li>
			</ul>
			<ul>
				<li><a href="http://cs.uic.edu"><img src="{#ROOT#}/images/flourish-helpers/csdepartment.png" alt="Department of Computer Science at UIC" /></a></li>
				<li><a href="http://www.spantree.net"><img src="{#ROOT#}/images/flourish-helpers/spantree.png" alt="Spantree" /></a></li>
			</ul>
			<ul>
				<li><a href="http://www.dotomi.com"><img src="{#ROOT#}/images/flourish-helpers/dotomi.jpg" alt="dotomi" /></a></li>
			</ul>
			<ul>
				<li><a href="http://www.nextag.com"><img src="{#ROOT#}/images/flourish-helpers/nextag.gif" alt="nextag" /></a></li>
				<li><a href="http://www.linux-magazine.com"><img src="{#ROOT#}/images/flourish-helpers/linux-magazine.jpg" alt="Linux Magazine" /></a></li>
				<li><a href="http://www.bullcitymobile.com"><img src="{#ROOT#}/images/flourish-helpers/bcm-redblack.png" alt="Bull City Mobile" /></a></li>
				<li><a href="http://www.illinoistech.org"><img src="{#ROOT#}/images/flourish-helpers/ita.png" alt="Illinois Technology Association" /></a></li>
			</ul>

		</div>
		<div class="content">

