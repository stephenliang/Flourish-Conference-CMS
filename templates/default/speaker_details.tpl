{config_load file=default.conf section=$site}
{include file="header.tpl" title="Speakers Details"}

			<h1 class="content-title">{$speaker.name}</h1>

		<div class="essay">

		<span class="left-img"><img src="{#ROOT#}/images/speakers/{$speaker.picture}" alt="{$speaker.name}" class="medium" /></span>

		<h2>Biography</h2>
		{$speaker.bio}

		<h2>Presentation Details</h2>
		{section name=outer loop=$talks}
		<h3>{$talks[outer].talkTitle}</h3>
		{$talks[outer].talkDescription}
		<p><strong>Presentation Time</strong>: {$talks[outer].dayofweek}, {$talks[outer].date}, at <a href="{#ROOT#}/schedule.php#{$talks[outer].dayofweek}_{$talks[outer].hour}">{$talks[outer].start_time} - {$talks[outer].end_time}</a></p>
		<p><strong>Presentation Location</strong>: {$talks[outer].location}</p>
		{/section}
		<div style="clear: both"></div>
		</div>

{include file="footer.tpl"}
