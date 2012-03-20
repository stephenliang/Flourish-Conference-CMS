{config_load file=default.conf section=$site}
{include file="header.tpl" title="List of Speakers"}
{include file="tinymce.tpl"}
			<h1 class="content-title">List of Speakers</h1>

			<a href="{#ROOT#}/admin/add_speaker.php">Add new speaker</a>

			<table>
				<thead>
					<tr>
						<td>&nbsp;</td>
						<td>name</td>
						<td>bio</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				<tbody>
					{section name=outer loop=$speakers}
					<tr>
						<td><img class="small" src="{#ROOT#}/images/speakers/{$speakers[outer].picture}"></td>
						<td>{$speakers[outer].name}</td>
						<td>{$speakers[outer].bio}</td>
						<td><a href="{#ROOT#}/admin/edit_speaker.php?id={$speakers[outer].id}">edit/delete</a></td>
					</tr>
					{/section}
				</tbody>
			</table>
{include file="footer.tpl"}
