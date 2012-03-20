{config_load file=default.conf section=$site}
{include file="header.tpl" title="Schedule"}
			<h1 class="content-title">Schedule</h1>

			<p>This schedule is still tentative, we are working on finalizing our schedule.</p>

			<h2>Friday, 03/30/2012</h2>
			<table class="schedule" cellspacing="0">
				<tbody>
					{foreach from=$talksFri key=k item=timeAry}
					<tr>
						<td class="time{if $k == 1} first{else} other{/if}" id="Friday_{$timeAry.0.hour}">{$timeAry.0.start_time}</td>
						{assign var=count value=$timeAry|@count}
						{if $count == 2}
						<td class="talk-details-a{if $k == 1} first{else} other{/if}">
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.talkTitle}</a>{/if}</div>
							<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>
							<div class="talk-location">{$timeAry.0.location}</div>
						</td>
						<td class="talk-details-b{if $k == 1} first{else} other{/if}">
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.talkTitle}</a></div>{/if}
							{if $timeAry.1.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.1.location}</div>
						</td>
						{else}
						<td class="talk-details-both{if $k == 1} first{else} other{/if}" colspan="2">
							<div class="talk-title">{if $timeAry.0.name == ""}{$timeAry.0.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.talkTitle}</a></div>{/if}
							{if $timeAry.0.name != ""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.0.location}</div>
						</td>

						{/if}
					</tr>
					{/foreach}
				</tbody>
			</table>

			<h2>Saturday, 03/31/2012</h2>
			<table class="schedule" cellspacing="0">
				<tbody>
					{foreach from=$talksSat key=k item=timeAry}
					<tr>
						<td class="time{if $k == 1} first{else} other{/if}" id="Saturday_{$timeAry.0.hour}">{$timeAry.0.start_time}</td>
						{assign var=count value=$timeAry|@count}
						{if $count == 2}
						<td class="talk-details-a{if $k == 1} first{else} other{/if}">
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.talkTitle}</a>{/if}</div>
							<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>
							<div class="talk-location">{$timeAry.0.location}</div>
						</td>
						<td class="talk-details-b{if $k == 1} first{else} other{/if}">
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.talkTitle}</a></div>{/if}
							{if $timeAry.1.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.1.location}</div>
						</td>
						{else}
						<td class="talk-details-both{if $k == 1} first{else} other{/if}" colspan="2">
							<div class="talk-title">{if $timeAry.0.name == ""}{$timeAry.0.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.talkTitle}</a></div>{/if}
							{if $timeAry.0.name != ""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.0.location}</div>
						</td>

						{/if}
					</tr>
					{/foreach}
				</tbody>
			</table>

{include file="footer.tpl"}
