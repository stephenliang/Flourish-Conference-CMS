{config_load file=default.conf section=$site}
{include file="header.tpl" title="Speakers"}
<div data-role="page" id="speaker" data-add-back-btn="true">
        <div data-role="header">
                <h1>Speakers</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview" data-filter="true">
			{section name=outer loop=$speakers}
				<li>
					<a href="speaker_details.php?id={$speakers[outer].id}" data-ajax="true">
					<img src="images/speakers/{$speakers[outer].picture}" alt="{$speakers[outer].name}" />	
					{$speakers[outer].name}
					</a>
				</li>
					
			{/section}
		</ul><!-- /listview -->
	</div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl"}
