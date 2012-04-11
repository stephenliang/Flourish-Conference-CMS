{config_load file='default.conf' section=$site}
{include file="header.tpl" title="Feedback"}
<div data-role="page" data-add-back-btn="true">

        <div data-role="header">
                <h1>Feedback</h1>
		<a href="./" class="ui-btn-right" data-ajax="false" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->

        <div data-role="content">
		{if $message}
		<ul data-role="listview" data-inset="true" data-theme="e">
			<li>
			<h1>Submit Error</h1>
			<p>{$message}</p>
			</li>
		</ul>
		{/if}
		<div data-role="collapsible-set">

			<form action="{#ROOT#}/feedback.php" method="POST">
			
			<div data-role="fieldcontain">
				<label for="name">Name</label>
				<input type="text" name="name" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="email">E-Mail</label>
				<input type="email" name="email" value="" />
			</div>	

			<div data-role="fieldcontain">
				<label for="textarea-1">Message:</label>
				<textarea name="message" id="textarea-1" value=""></textarea>
			</div>	
		<input type="submit" name="submit" value="Submit" />
		</form>

        </div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl" title="Main"}
