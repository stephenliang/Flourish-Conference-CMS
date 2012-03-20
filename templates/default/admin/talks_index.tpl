{config_load file=default.conf section=$site}
{include file="header.tpl" title="List of Talks"}
{include file="tinymce.tpl"}
			<h1 class="content-title">List of Talks</h1>

			<a href="{#ROOT#}/admin/add_talk.php">Add new talk</a>

			<table>
				<thead>
					<tr>
						<td>talk title</td>
						<td>talk description</td>
						<td>speaker</td>
						<td>location</td>
						<td>start time</td>
						<td>end time</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				<tbody>
					{section name=outer loop=$talks}
					<tr>
						<td>{$talks[outer].talkTitle}</td>
						<td>{$talks[outer].talkDescription}</td>
						<td>{$talks[outer].name}</td>
						<td>{$talks[outer].location}</td>
						<td>{$talks[outer].start_time}</td>
						<td>{$talks[outer].end_time}</td>
						<td><a href="{#ROOT#}/admin/edit_talk.php?id={$talks[outer].id}">edit/delete</a></td>
					</tr>
					{/section}
				</tbody>
			</table>
{include file="footer.tpl"}
