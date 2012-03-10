{config_load file=default.conf section=$site}
{include file="header_admin.tpl" title="Statistics"}

		<h1>Flourish Checkin Statistics</h1>
		<div id="qstat">
		<h3>Quick Statistics:</h3>
		<table id="quickstat">
			<tr><th>Number or Registrants</th><th>Checked-in on Day 1</th><th>Checked-in on Day 2</th></tr>
			<tr><td>{$regstat.regnum}</td><td>{if $regstat.day1ct}{$regstat.day1ct}{else}0{/if}</td><td>{if $regstat.day2ct}{$regstat.day2ct}{else}0{/if}</td></tr>
		</table></div>
		<div id="truestat">
		<p>True Checkin and Checkouts are the number of times the actual buttons have been pressed and submitted successfully.</p>
		<table id="daystat">
			<tr><th></th><th>True Checkin Clicks</th><th>True Checkout Clicks</th></tr>
			<tr><td><strong>Day 1</strong></td><td>{$daystat.day1.trueincount}</td><td>{$daystat.day1.trueoutcount}</td></tr>
			<tr><td><strong>Day 2</strong></td><td>{$daystat.day2.trueincount}</td><td>{$daystat.day2.trueoutcount}</td></tr>
		</table>
		</div>
		<br />
		<h3>Checkin Staff Statistics:</h3>
		<p>This table displays the number of checkins and checkout by each staff member sorted by ID.  Note your staff ID is located at the bottom of each page when logged into this section.</p>
		<table id="staffstat">
			<tr><th>Staff ID</th><th>Day 1 Checkins</th><th>Day 1 Checkouts</th><th>Day 2 Checkins</th><th>Day 2 Checkouts</th></tr>
			{foreach from=$stafflist key=k item=i}
				<tr><td>{$i}</td><td>{if $staffstat.$i.d1in}{$staffstat.$i.d1in}{else}0{/if}</td><td>{if $staffstat.$i.d1out}{$staffstat.$i.d1out}{else}0{/if}</td><td>{if $staffstat.$i.d2in}{$staffstat.$i.d2in}{else}0{/if}</td><td>{if $staffstat.$i.d2out}{$staffstat.$i.d2out}{else}0{/if}</td></tr>
			{/foreach}
		</table>
		<div id="d1staffcheckin">
		<canvas id="staffgraphd1" width="400" height="300"></canvas>
		<script type="text/javascript">
			var g = new Bluff.Bar('staffgraphd1', '400x300');
			g.theme_keynote();
			{foreach from=$stafflist key=k item=i}
g.data('{$i}({$staffstat.$i.d1in-$staffstat.$i.d1out})', '{$staffstat.$i.d1in-$staffstat.$i.d1out}');
			{/foreach}
g.hide_legend = false;
			g.hide_line_numbers = false;
			g.y_axis_increment = 10;
			g.title = 'Staff Checkins(Actual Day 1)';
			g.legend_position = 'bottom';
			g.draw();
		</script>
		</div>
		<div id="d2staffcheckin">
		<canvas id="staffgraphd2" width="400" height="300"></canvas>
		<script type="text/javascript">
			var g = new Bluff.Bar('staffgraphd2', '400x300');
			g.theme_keynote();
			{foreach from=$stafflist key=k item=i}
g.data('{$i}({$staffstat.$i.d2in-$staffstat.$i.d2out})', '{$staffstat.$i.d2in-$staffstat.$i.d2out}');
			{/foreach}
g.hide_legend = false;
			g.hide_line_numbers = false;
			g.y_axis_increment = 10;
			g.title = 'Staff Checkins(Actual Day 2)';
			g.legend_position = 'bottom';
			g.draw();
		</script>
		</div>
		<p>These graphs display the number of staff checkins on both days.  It also takes into consideration the number of checkouts to provide an accurate count.  The graph is sorted by highest checkins first.  The graph legend shows the staff member ID with the number of checkins in parentheses.  Remember that your user ID is located at the bottom of each page of this section.</p>
		<br />
		<div id="checkinxtimes">
		<br />
		<h3>Day Statistics:</h3>
		<p>This graph shows the number of checkins as time passes.</p>
		<table id="checkinxtime1" class="">
			<tr><th>Hour</th><th>Day 1</th></tr>
			{foreach from=$daytime1 key=k item=i}
<tr><td>{$k}</td><td>{if $i}{$i}{else}0{/if}</td></tr>
			{/foreach}
</table>
		<table id="checkinxtime2" class="">
			<tr><th>Hour</th><th>Day 2</th></tr>
			{foreach from=$daytime2 key=k item=i}
<tr><td>{$k}</td><td>{if $i}{$i}{else}0{/if}</td></tr>
			{/foreach}
</table>
<div id="dayxtimegraphbox">
<canvas id="dayxtimegraph" width="950px" height="500px"></canvas>
<script type="text/javascript">

    var g = new Bluff.Line('dayxtimegraph', '950x500');
    
	{literal}g.set_theme({background_colors: ['#FBC30C', '#AADFFF']});{/literal}
    g.data('Day1', [{if $daytime1.0}{$daytime1.0}{else}0{/if}, {if $daytime1.1}{$daytime1.1}{else}0{/if}, {if $daytime1.2}{$daytime1.2}{else}0{/if}, {if $daytime1.3}{$daytime1.3}{else}0{/if}, {if $daytime1.4}{$daytime1.4}{else}0{/if}, {if $daytime1.5}{$daytime1.5}{else}0{/if}, {if $daytime1.6}{$daytime1.6}{else}0{/if}, {if $daytime1.7}{$daytime1.7}{else}0{/if}, {if $daytime1.8}{$daytime1.8}{else}0{/if}, {if $daytime1.9}{$daytime1.9}{else}0{/if}, {if $daytime1.10}{$daytime1.10}{else}0{/if}, {if $daytime1.11}{$daytime1.11}{else}0{/if}, {if $daytime1.12}{$daytime1.12}{else}0{/if}, {if $daytime1.13}{$daytime1.13}{else}0{/if}, {if $daytime1.14}{$daytime1.14}{else}0{/if}, {if $daytime1.15}{$daytime1.15}{else}0{/if}, {if $daytime1.16}{$daytime1.16}{else}0{/if}, {if $daytime1.17}{$daytime1.17}{else}0{/if}, {if $daytime1.18}{$daytime1.18}{else}0{/if}, {if $daytime1.19}{$daytime1.19}{else}0{/if}, {if $daytime1.20}{$daytime1.20}{else}0{/if}, {if $daytime1.21}{$daytime1.21}{else}0{/if}, {if $daytime1.22}{$daytime1.22}{else}0{/if}, {if $daytime1.23}{$daytime1.23}{else}0{/if}]);
    g.data('Day2', [{if $daytime2.0}{$daytime2.0}{else}0{/if}, {if $daytime2.1}{$daytime2.1}{else}0{/if}, {if $daytime2.2}{$daytime2.2}{else}0{/if}, {if $daytime2.3}{$daytime2.3}{else}0{/if}, {if $daytime2.4}{$daytime2.4}{else}0{/if}, {if $daytime2.5}{$daytime2.5}{else}0{/if}, {if $daytime2.6}{$daytime2.6}{else}0{/if}, {if $daytime2.7}{$daytime2.7}{else}0{/if}, {if $daytime2.8}{$daytime2.8}{else}0{/if}, {if $daytime2.9}{$daytime2.9}{else}0{/if}, {if $daytime2.10}{$daytime2.10}{else}0{/if}, {if $daytime2.11}{$daytime2.11}{else}0{/if}, {if $daytime2.12}{$daytime2.12}{else}0{/if}, {if $daytime2.13}{$daytime2.13}{else}0{/if}, {if $daytime2.14}{$daytime2.14}{else}0{/if}, {if $daytime2.15}{$daytime2.15}{else}0{/if}, {if $daytime2.16}{$daytime2.16}{else}0{/if}, {if $daytime2.17}{$daytime2.17}{else}0{/if}, {if $daytime2.18}{$daytime2.18}{else}0{/if}, {if $daytime2.19}{$daytime2.19}{else}0{/if}, {if $daytime2.20}{$daytime2.20}{else}0{/if}, {if $daytime2.21}{$daytime2.21}{else}0{/if}, {if $daytime2.22}{$daytime2.22}{else}0{/if}, {if $daytime2.23}{$daytime2.23}{else}0{/if}]);
    {literal}g.labels = {0: '12AM', 1: '1AM', 2: '2AM', 3: '3AM', 4: '4AM', 5: '5AM', 6: '6AM', 7: '7AM', 8: '8AM', 9: '9AM', 10: '10AM', 11: '11AM', 12: '12PM', 13: '1PM', 14: '2PM', 15: '3PM', 16: '4PM', 17: '5PM', 18: '6PM', 19: '7PM', 20: '8PM', 21: '9PM', 22: '10PM', 23: '11PM'};
	g.marker_font_size = '12px';
	g.title = 'Hour by Hour Checkin';
	g.tooltips = true;
    g.draw();
{/literal}
  </script>
  </div>
</div>
		<div id="help" class="dialog" title="Help Information">
		<p>This is the Flourish 2012 Statistics page.  Here you will find some pretty cool statistics.  Here are the available stats so far.</p>
		<ul>
			<li>Graph showing peak checkin times(Day Statistics)</li>
			<li>Checkins by each staff member(Checkin Staff Statistics Graph)</li>
			<li>Number of registrants checked in on day 1(Quick Statistics)</li>
			<li>Number of registrants checked in on day 2(Quick Statistics)</li>
			<li>Individual staff breakdown of checkins/checkouts(Checkin Staff Statistics)</li>
		</ul>
		<p>*Check-outs usually means that a registrant was checked-in by error.</p>
		<p>If you think of other stats that should be added next year, let me know!</p>
	</div>
		
{include file="footer_admin.tpl"}
