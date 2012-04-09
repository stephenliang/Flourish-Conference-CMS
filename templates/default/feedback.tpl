{config_load file=default.conf section=$site}
{include file="header.tpl" title="Feedback"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Feedback for Flourish! Conference 2012</h1>
<br />
			<form action="{#ROOT#}/feedback.php" method="POST">
				<strong>Name (optional)</strong>:<br />
				<input type="text" name="name" value="{$POST.name}" />
				<br /><br />
				
				<strong>E-Mail (optional)</strong>:<br />
				<input type="email" name="email" value="{$POST.email}" />
				<br /><br />
				
				<strong>Message</strong>:<br />
				<textarea name="message">{$POST.message}</textarea>
				<br /><br />

				<input type="submit" name="submit" value="Submit Feedback" />
			</form>
{include file="footer.tpl"}
