{config_load file=default.conf section=$site}
{include file="header.tpl" title="Thanks!"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Thanks!</h1>
			<div class="message-box">{$successMessage}<br /><br /></div>
{include file="footer.tpl"}
