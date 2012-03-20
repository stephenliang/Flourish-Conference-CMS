{config_load file=default.conf section=$site}
{include file="header.tpl" title="Speakers"}

			<h1 class="content-title">Speakers</h1>
			<div class="gallery-container">
				<div class="gallery">
					{section name=outer loop=$speakers}
							<div class="speaker-div">
								<a href="{#ROOT#}/speaker_details.php?id={$speakers[outer].id}"><img src="{#ROOT#}/images/speakers/{$speakers[outer].picture}" alt="{$speakers[outer].name|htmlentities}" /></a>
								<div class="speaker-name">
									{$speakers[outer].name|htmlentities}
								</div>
							</div>
					{/section}
				</div>
			</div>
					<div style="clear: both"></div>
{include file="footer.tpl"}
