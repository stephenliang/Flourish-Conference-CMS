{config_load file=default.conf section=$site}
{include file="header.tpl" title="Edit Speaker"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Edit a Speaker</h1>
<br />
			<form action="{#ROOT#}/admin/edit_speaker.php?id={$values.id}" method="POST" enctype="multipart/form-data">
				<h1 class="content-title">Speaker Details</h1>

				<strong>Name</strong>:<br />
				<input type="text" name="name" value="{$values.name}" />
				<br /><br />
				
				<strong>Bio</strong>:<br />
				<textarea name="bio">{$values.bio}</textarea>
				<br /><br />
				
				<strong>Talk Title</strong>:<br />
				<input type="text" name="talkTitle" value="{$values.talkTitle}" />
				<br /><br />

				<strong>Talk Description</strong>:<br />
				<textarea name="talkDescription">{$values.talkDescription}</textarea>
				<br /><br />
				
				<strong>Upload Picture</strong>:<br />
				<input type="file" name="picture" />
				<br /><br />

				<input type="hidden" name="id" value="{$values.id}" />
				<input type="hidden" name="action" value="edit" />

				<input type="submit" name="submit" value="Update Speaker" />
			</form>
			<br /><br />
			<form action="{#ROOT#}/admin/edit_speaker.php" method="POST">
				<input type="hidden" name="id" value="{$values.id}" />
				<input type="hidden" name="action" value="delete" />
				<input type="submit" name="submit" value="Delete Speaker" />
			</form>
{include file="footer.tpl"}
