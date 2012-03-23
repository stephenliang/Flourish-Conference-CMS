{config_load file=default.conf section=$site}
{include file="header.tpl" title="Speakers"}
<div data-role="page" id="speaker-details" data-add-back-btn="true">
        <div data-role="header">
                <h1>{$speaker.name}</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
			<div data-role="collapsible" data-collapsed="false">
				<h1>Biography</h1>
				<p>{$speaker.bio}</p>	
			</div>

			{section name=outer loop=$talks}
			<div data-role="collapsible" data-collapsed="true" data-theme="e">
				<h1>Presentation Details</h1>
					<div data-role="collapsible" data-collapsed="false">
						<h3>{$talks[outer].talkTitle}</h3>
						<p>{$talks[outer].talkDescription}</p>
					</div>
					<div data-role="collapsible" data-collapsed="true">
						<h3>Presentation Time</h3>
						<p>{$talks[outer].dayofweek}, {$talks[outer].date}, at <a href="{#ROOT#}/schedule.php#{$talks[outer].dayofweek}_{$talks[outer].hour}">{$talks[outer].start_time} - {$talks[outer].end_time}</a></p>
					</div>
					<div data-role="collapsible" data-collapsed="true">
						<h3>Presentation Location</h3>
						<p>{$talks[outer].location}</p>
					</div>
			</div><!-- /presentation detail div -->
			{/section}
	</div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl"}
