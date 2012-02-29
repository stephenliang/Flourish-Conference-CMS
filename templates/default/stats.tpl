{config_load file=default.conf section=$site}
{include file="header_admin.tpl" title="Statistics"}

		<h1>Sorry, but this page isn't finished quite yet. Check back next week.</h1>
		<h3>Quick Statistics:</h3>
		<table id ="quickstat">
			<tr><th>Number or Registrants</th><th>Checked-in on Day 1</th><th>Checked-in on Day 2</th></tr>
			<tr><td>{$regstat.regnum}</td></tr>
		</table>
		
		<div id="help" class="dialog" title="Help Information">
		<p>This is the Flourish 2012 Statistics page.  Here you will find some pretty cool statistics.  Here are the planned things so far.</p>
		<ul>
			<li>Graphs showing peak checkin times</li>
			<li>Checkin competition</li>
			<li>Number of registrants checked in on day 1</li>
			<li>Number of registrants checked in on day 2</li>
			<li>Individual staff breakdown of checkins</li>
			<li>Checkin to Checkout ratio*</li>
			<li>more to come... Let me know what you think I should add.</li>
		</ul>
		<p>*Check out usually means incorrect checkin</p>
	</div>
	<div id="stats" class="dialog" title="Statistics Page">
		<p>Didn't believe me when I said this page wasn't finished? Well here you view the actual page.  Nothing special yet.  Like I said, check back next week.</p>
	</div>
		
{include file="footer_admin.tpl"}
