{config_load file=default.conf section=$site}
{include file="header.tpl" title="Schedule"}
			<h1 class="content-title">Schedule</h1>

			<p>This schedule is still tentative, we are working on finalizing our schedule.</p>

			<h2>Friday, 03/30/2012</h2>
			<div class="schedule-container">
				{foreach from=$talksFri key=k item=timeAry}
				<div class="schedule-hour-container">
					<span class="time" id="Friday_{$timeAry.0.hour}{$timeAry.0.minute}"><span>{$timeAry.0.start_time}</span></span>
					{assign var=count value=$timeAry|@count}
					<div class="talk-details-a{if $k == 1} first{else} other{/if} tracks_{$count}">
						<div>
							<div class="talk-title">{if $timeAry.0.name == ""}{$timeAry.0.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}#t{$timeAry.0.id}">{$timeAry.0.talkTitle}</a>{/if}</div>
							<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>
							<div class="talk-location">{$timeAry.0.location}</div>
						</div>
					</div>
					{if $count == 2 || $count == 3}
					<div class="talk-details-b{if $k == 1} first{else} other{/if} tracks_{$count}{if $count == 3} schedule-border-right{/if}">
						<div>
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}#t{$timeAry.1.id}">{$timeAry.1.talkTitle}</a>{/if}</div>
							{if $timeAry.1.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.1.location}</div>
						</div>
					</div>
					{/if}
					{if $count == 3}
					<div class="talk-details-c{if $k == 1} first{else} other{/if} tracks_{$count}">
						<div>
							<div class="talk-title">{if $timeAry.2.name == ""}{$timeAry.2.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.2.speaker}#t{$timeAry.2.id}">{$timeAry.2.talkTitle}</a>{/if}</div>
							{if $timeAry.2.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.2.speaker}">{$timeAry.2.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.2.location}</div>
						</div>
					</div>					
					{/if}
				</div>
				{/foreach}
			</div>

			<h2>Saturday, 03/31/2012</h2>
			<div class="schedule-container">
				{foreach from=$talksSat key=k item=timeAry}
				<div class="schedule-hour-container">
					<span class="time" id="Saturday_{$timeAry.0.hour}{$timeAry.0.minute}"><span>{$timeAry.0.start_time}</span></span>
					{assign var=count value=$timeAry|@count}
					<div class="talk-details-a{if $k == 1} first{else} other{/if} tracks_{$count}">
						<div>
							<div class="talk-title">{if $timeAry.0.name == ""}{$timeAry.0.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}#t{$timeAry.0.id}">{$timeAry.0.talkTitle}</a>{/if}</div>
							<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.0.speaker}">{$timeAry.0.name}</a></div>
							<div class="talk-location">{$timeAry.0.location}</div>
						</div>
					</div>
					{if $count == 2 || $count == 3}
					<div class="talk-details-b{if $k == 1} first{else} other{/if} tracks_{$count}{if $count == 3} schedule-border-right{/if}">
						<div>
							<div class="talk-title">{if $timeAry.1.name == ""}{$timeAry.1.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}#t{$timeAry.1.id}">{$timeAry.1.talkTitle}</a>{/if}</div>
							{if $timeAry.1.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.1.speaker}">{$timeAry.1.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.1.location}</div>
						</div>
					</div>
					{/if}
					{if $count == 3}
					<div class="talk-details-c{if $k == 1} first{else} other{/if} tracks_{$count}">
						<div>
							<div class="talk-title">{if $timeAry.2.name == ""}{$timeAry.2.talkTitle}{else}<a href="{#ROOT#}/speaker_details.php?id={$timeAry.2.speaker}#t{$timeAry.2.id}">{$timeAry.2.talkTitle}</a>{/if}</div>
							{if $timeAry.2.name !=""}<div class="presenter"><a href="{#ROOT#}/speaker_details.php?id={$timeAry.2.speaker}">{$timeAry.2.name}</a></div>{/if}
							<div class="talk-location">{$timeAry.2.location}</div>
						</div>
					</div>					
					{/if}
				</div>
				{/foreach}
			</div>

{include file="footer.tpl"}
