{config_load file=default.conf section=$site}
{include file="header_admin.tpl" title="Statistics"}

		<h1>Sorry, but this page isn't finished quite yet. Check back next week.</h1>
		<h3>Quick Statistics:</h3>
		<table id="quickstat">
			<tr><th>Number or Registrants</th><th>Checked-in on Day 1</th><th>Checked-in on Day 2</th></tr>
			<tr><td>{$regstat.regnum}</td><td>{if $regstat.day1ct}{$regstat.day1ct}{else}0{/if}</td><td>{if $regstat.day2ct}{$regstat.day2ct}{else}0{/if}</td></tr>
		</table>
		<table id="daystat">
			<tr><th></th><th>True Checkin Clicks</th><th>True Checkout Clicks</th></tr>
			<tr><td><strong>Day 1</strong></td><td>{$daystat.day1.trueincount}</td><td>{$daystat.day1.trueoutcount}</td></tr>
			<tr><td><strong>Day 2</strong></td><td>{$daystat.day2.trueincount}</td><td>{$daystat.day2.trueoutcount}</td></tr>
		</table>
		<h3>Checkin Staff Statistics:</h3>
		<table id="staffstat">
			<tr><th>Staff ID</th><th>Day 1 Checkins</th><th>Day 1 Checkouts</th><th>Day 2 Checkins</th><th>Day 2 Checkouts</th></tr>
			{foreach from=$stafflist key=k item=i}
				<tr><td>{$i}</td><td>{$staffstat.$i.d1in}</td><td>{$staffstat.$i.d1out}</td><td>{$staffstat.$i.d2in}</td><td>{$staffstat.$i.d2out}</td></tr>
			{/foreach}
		</table>
		<canvas id="staffgraph" width="400" height="300"></canvas>
		<script type="text/javascript">
			var g = new Bluff.Bar('staffgraph', '400x300');
			g.theme_odeo();
			{foreach from=$stafflist key=k item=i}
			g.data('{$i}in', '{$staffstat.$i.d1in}');
			g.data('{$i}out', '{$staffstat.$i.d2in}');
			{/foreach}
			g.draw();
		</script>
		
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
