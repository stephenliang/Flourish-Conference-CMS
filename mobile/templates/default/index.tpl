{config_load file='default.conf' section=$site}
{include file="header.tpl" title="Main"}
<div data-role="page" id="main">

        <div data-role="header">
                <h1>Flourish! Conference 2012</h1>
        </div><!-- /header -->

        <div data-role="content">
		<div data-role="collapsible" collapsed="false">
				<h3>Introduction</h3>
				<p>Welcome to the Flourish 2012 Open Source Conference website! This is Flourish Conference's <strong>sixth</strong> annual student-led conference hosted at the <a href="http://uic.edu" ref="external">The University of Illinois at Chicago</a>. We are proud to help promote the use of open source and provide a gathering place for open source enthusiasts in the Chicagoland area.</p>
				<p>Throughout the weekend, we will bring speakers from around the country to talk about their contributions to the open source community. Topics ranging from the development of free and open source software to the issues with software patents and copyright will be discussed. Then after all the speeches are over, join us in our workshop to gain some hands-on experience.</p>
				<p>Flourish Conference is <strong>FREE</strong> to attend and there will be free T-Shirts to those who register in advance. We really appreciate everyone for coming to Flourish Conference for the past several years and we hope to bring another great and educating year!</p>
				<p>In the mean time, follow <a href="http://twitter.com/flourishconf" ref="external">@flourishconf</a> for updates and check our website regularly!</p>
				</p>
		</div>
        <ul data-role="listview" data-inset="true" data-filter="false">

                <li><a href="{#ROOT#}/registration.php">Registration</a></li>
                <li><a href="{#ROOT#}/sponsor.php">Sponsor</a></li>
                <li><a href="{#ROOT#}/mini-expo.php">Mini-Expo</a></li>
                <li><a href="{#ROOT#}/about.php">About</a></li>
                <li><a href="#pastevents">Past Events</a></li>

        </ul><!-- /listview  sitenav-->

        </div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="pastevents">
        <div data-role="header">
                <h1>Past Events</h1>
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
{include file="footer.tpl" title="Main"}
