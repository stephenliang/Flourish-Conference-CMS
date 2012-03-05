{config_load file=default.conf section=$site}
{include file="header.tpl" title="Add Speaker"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Add a Speaker</h1>
<br />
			<form action="{#ROOT#}/admin/add_speaker.php" method="POST" enctype="multipart/form-data">
				<h1 class="content-title">Speaker Details</h1>

				<strong>Name</strong>:<br />
				<input type="text" name="name" value="{$POST.name}" />
				<br /><br />
				
				<strong>Bio</strong>:<br />
				<textarea name="bio">{$POST.bio}</textarea>
				<br /><br />
							
				<strong>Upload Picture</strong>:<br />
				<input type="file" name="picture" />
				<br /><br />

				<strong>Do not show in gallery?</strong><br />
				<input type="checkbox" name="gallery" {if $POST.gallery == "on"}checked{/if} />
				<br /><br />

				<input type="submit" name="submit" value="Add new Speaker" />
			</form>
{include file="footer.tpl"}
