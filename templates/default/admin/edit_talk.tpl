{config_load file=default.conf section=$site}
{include file="header.tpl" title="Edit Talk"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Edit a Talk</h1>
<br />
			<form action="{#ROOT#}/admin/edit_talk.php?id={$values.id}" method="POST" enctype="multipart/form-data">
				<h1 class="content-title">Talk Details</h1>

				<strong>Talk Title</strong>:<br />
				<input type="text" name="talkTitle" value="{$values.talkTitle}" />
				<br /><br />

				<strong>Talk Description</strong>:<br />
				<textarea name="talkDescription">{$values.talkDescription}</textarea>
				<br /><br />
				
				<strong>Location</strong>:<br />
				<select name="location">
					<option value="Illinois A" {if $values.location == "Illinois A"}selected{/if}>Illinois A</option>
					<option value="Illinois B" {if $values.location == "Illinois B"}selected{/if}>Illinois B</option>
					<option value="Illinois Room C" {if $values.location == "Illinois Room C"}selected{/if}>Illinois Room C</option>
					<option value="Cardinal Room" {if $values.location == "Cardinal Room"}selected{/if}>Cardinal Room</option>
				</select>
				<br /><br />

				<strong>Speaker</strong>:<br />
				<select name="speaker">
					{section name=outer loop=$speakers}
					<option value="{$speakers[outer].id}" {if $speakers[outer].id == $values.speaker}selected{/if}>{$speakers[outer].name}</option>
					{/section}
				</select>
				<br /><br />
				
				<strong>Start Time (MM/DD/YY HH:MM:SS)</strong>:<br />

				<input type="text" name="start_time" value="{$values.start_time}" />
				<br /><br />

				<strong>End Time (MM/DD/YY HH:MM:SS)</strong>:<br />
				<input type="text" name="end_time" value="{$values.end_time}" />
				<br /><br />

				<input type="hidden" name="id" value="{$values.id}" />
				<input type="hidden" name="action" value="edit" />

				<input type="submit" name="submit" value="Update Talk" />
			</form>
			<br /><br />
			<form action="{#ROOT#}/admin/edit_talk.php" method="POST">
				<input type="hidden" name="id" value="{$values.id}" />
				<input type="hidden" name="action" value="delete" />
				<input type="submit" name="submit" value="Delete Talk" />
			</form>
{include file="footer.tpl"}
