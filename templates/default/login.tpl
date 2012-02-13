{config_load file=default.conf section=$site}
{include file="header_admin.tpl" title="Admin Login"}

	<form name="loginform" id="loginform" action="./index.php" method="post">
	<p>
		<label for="user_login">Username<br />
		<input type="text" name="user" id="user_login" class="input" value="{$POST.user}" size="20" tabindex="5" /></label>
	</p>
	<p>
		<label for="user_pass">Password<br />

		<input type="password" name="pwd" id="user_pass" class="input" value="" size="20" tabindex="6" /></label>
	</p>
	<p class="submit">
		<input type="submit" name="submit" id="submit" class="button-primary" value="Log In" />
	</p>

</form>

{include file="footer_admin.tpl"}
