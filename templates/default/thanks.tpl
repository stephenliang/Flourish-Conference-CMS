{config_load file=default.conf section=$site}
{include file="header.tpl" title="Thanks!"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Thanks!</h1>
			<div class="essay">{$successMessage}<br /><br /></div>
			<div id="thanks-img"><img src="http://www2.flourishconf.com/2012-test/images/sponsorship.jpg" alt="" /></div>
{include file="footer.tpl"}
