{config_load file=default.conf section=$site}
{include file="header.tpl" title="Thanks!"}
<div data-role="page">

        <div data-role="header">
                <h1>Thanks!</h1>
		<a href="{#ROOT#}" data-icon="home" data-iconpos="notext" data-direction="reverse" class="ui-btn-right jqm-home">Home</a>
        </div><!-- /header -->

	<div data-role="content">
	{$successMessage}
	</div>
</div>
{include file="footer.tpl"}
