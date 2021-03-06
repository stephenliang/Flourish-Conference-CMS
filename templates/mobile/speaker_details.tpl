{config_load file=default.conf section=$site}
{include file="header.tpl" title="Speakers"}
<div data-role="page" id="speaker-details" data-add-back-btn="true">
        <div data-role="header">
                <h1>{$speaker.name}</h1>
		<a href="./" class="ui-btn-right" data-ajax="false" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
			<div data-role="collapsible" data-collapsed="false">
				<h1>Biography</h1>
				<p>{$speaker.bio}</p>	
			</div>

			<div data-role="collapsible" data-collapsed="false" data-theme="e">
				<h1>Presentation Details</h1>
			{section name=outer loop=$talks}
				<div>
					<h3>{$talks[outer].talkTitle}</h3>
					<p>{$talks[outer].talkDescription}</p>
					<h3>Presentation Time</h3>
					<p>{$talks[outer].dayofweek}, {$talks[outer].date}, at <a href="{#ROOT#}/schedule.php#{$talks[outer].dayofweek}_{$talks[outer].hour}">{$talks[outer].start_time} - {$talks[outer].end_time}</a></p>
					<h3>Presentation Location</h3>
					<p>{$talks[outer].location}</p>
				</div>
			{/section}
		</div><!-- /presentation detail div -->
	</div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl"}
