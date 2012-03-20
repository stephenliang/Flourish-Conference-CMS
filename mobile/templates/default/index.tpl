{config_load file='default.conf' section=$site}
{include file="header.tpl" title="Main"}
<div data-role="page" id="main">

        <div data-role="header">
		<p style="text-align:center;">
			<img style="padding:5px;align:center;" src="images/mobile/logo-lightgrey.png" alt="Flourish! 2012" />
			<br/>
			Attend Chicago's sixth annual open source conference...
		</p>
        </div><!-- /header -->

        <div data-role="content">
		<div data-role="collapsible" data-collapsed="false">
			<h3>Introduction</h3>
			<p>Welcome to the Flourish 2012 Open Source Conference website! This is Flourish Conference's <strong>sixth</strong> annual student-led conference hosted at the <a href="http://uic.edu" ref="external">The University of Illinois at Chicago</a>. We are proud to help promote the use of open source and provide a gathering place for open source enthusiasts in the Chicagoland area.</p>
			<p>Throughout the weekend, we will bring speakers from around the country to talk about their contributions to the open source community. Topics ranging from the development of free and open source software to the issues with software patents and copyright will be discussed. Then after all the speeches are over, join us in our workshop to gain some hands-on experience.</p>
			<p>Flourish Conference is <strong>FREE</strong> to attend and there will be free T-Shirts to those who register in advance. We really appreciate everyone for coming to Flourish Conference for the past several years and we hope to bring another great and educating year!</p>
			<p>In the mean time, follow <a href="http://twitter.com/flourishconf" ref="external">@flourishconf</a> for updates and check our website regularly!</p>
			</p>
		</div><!-- /collapsible -->

        <ul data-role="listview" data-inset="true" data-filter="false">

                <li><a href="registration.php">Registration</a></li>
                <li><a href="speakers.php">Speakers</a></li>
                <li><a href="schedule.php" data-ajax="false">Schedule</a></li>
                <li><a href="miniexpo.php" data-ajax="true">Mini-Expo</a></li>
                <li><a href="about.php" data-ajax="true">About</a></li>
                <li><a href="#pastevents" data-ajax="true">Past Events</a></li>
                <li><a href="#sponsored" data-ajax="true">Sponsors</a></li>

        </ul><!-- /listview  sitenav-->
	<a href="index.php?viewFullSite=1" data-role="button" rel="external" data-theme="a">Switch to Full Site</a>

        </div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="pastevents"  data-add-back-btn="true">
        <div data-role="header">
                <h1>Past Events</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview" data-inset="true" data-theme="a" data-split-theme="a">
			<li><a href="/2011">2011</a></li>
			<li><a href="/flourish2010">2010</a></li>
			<li><a href="/flourish2009">2009</a></li>
			<li><a href="/flourish2008">2008</a></li>
			<li><a href="/index2007.php">2007</a></li>
		</ul>
	</div>
</div><!-- page -->
<div data-role="page" id="sponsored" data-add-back-btn="true">
        <div data-role="header">
                <h1>Sponsored by:</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-theme="d" data-role="listview" data-filter="true">
			<li><a href="http://fused.com/" rel="external"><img src="images/flourish-helpers/fused.png"/>Fused</a></li>
			<li><a href="http://www.orbitz.com/" rel="external"><img src="images/flourish-helpers/orbitz.png"/>Orbitz</a></li>
			<li><a href="http://www.uic.edu/depts/chcc/programs/Campus/Files/SAFC.html" rel="external"><img src="images/flourish-helpers/safc-black.png"/>SAFC</a></li>
			<li><a href="http://linuxjournal.com/" rel="external"><img src="images/flourish-helpers/ljcolor.jpg"/>Linux Journal</a></li>
			<li><a href="http://cs.uic.edu/" rel="external"><img src="images/flourish-helpers/csdepartment.png"/>UIC CS Department</a></li>
			<li><a href="http://www.spantree.net/" rel="external"><img src="images/flourish-helpers/spantree.png"/>Spantree</a></li>
			<li><a href="http://www.dotomi.com/" rel="external"><img src="images/flourish-helpers/dotomi.jpg"/>Dotomi</a></li>
			<li><a href="http://www.nextag.com/" rel="external"><img src="images/flourish-helpers/nextag.gif"/>Nextag</a></li>
			<li><a href="http://www.linux-magazine.com/" rel="external"><img src="images/flourish-helpers/linux-magazine.jpg"/>Linux Pro Magazine</a></li>
			<li><a href="http://bullcitymobile.com/" rel="external"><img src="images/flourish-helpers/bcm-redblack.png" />BullCity Mobile</a></li>
			<li><a href="http://illinoistech.org/" rel="external"><img src="images/flourish-helpers/ita.png" />ITA</a></li>
		</ul>
	</div>
</div><!-- page -->
{include file="footer.tpl" title="Main"}
