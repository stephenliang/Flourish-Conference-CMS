{config_load file=default.conf section=$site}
{include file="header.tpl" title="Schedule"}
<div data-role="page" id="roomA" data-add-back-btn="true">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" class="ui-btn-active" data-ajax="true">A</a></li>
			<li><a href="#roomB" data-ajax="true">B</a></li>
			<li><a href="#roomC" data-ajax="true">C</a></li>
			<li><a href="#other" data-ajax="true">Other</a></li>
		</ul>
	</div><!-- nav -->
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li  data-role="list-divider" >Friday, 03/30/2012</li>
			{foreach from=$talksFri key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois A"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
			{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
			{foreach from=$talksSat key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois A"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
			{/foreach}
	</div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="roomB">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" data-ajax="true">A</a></li>
			<li><a href="#roomB" class="ui-btn-active ui-state-persist" data-ajax="true">B</a></li>
			<li><a href="#roomC" data-ajax="true">C</a></li>
			<li><a href="#other" data-ajax="true">Other</a></li>
		</ul>
	</div>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li data-role="list-divider" >Friday, 03/30/2012</li>
			{foreach from=$talksFri key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois B"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
			{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
		{foreach from=$talksSat key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois B"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
		{/foreach}
	</div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="roomC">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" data-ajax="true">A</a></li>
			<li><a href="#roomB" data-ajax="true">B</a></li>
			<li><a href="#roomC" class="ui-btn-active ui-state-persist" data-ajax="true">C</a></li>
			<li><a href="#other" data-ajax="true">Other</a></li>
		</ul>
	</div><!-- nav -->
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li  data-role="list-divider" >Friday, 03/30/2012</li>
		{foreach from=$talksFri key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois Room C"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
		{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
		{foreach from=$talksSat key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Illinois Room C"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
		{/foreach}
	</div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="other">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" data-ajax="true">A</a></li>
			<li><a href="#roomB" data-ajax="true">B</a></li>
			<li><a href="#roomC" data-ajax="true">C</a></li>
			<li><a href="#other" class="ui-btn-active ui-state-persist" data-ajax="true">Other</a></li>
		</ul>
	</div><!-- nav -->
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li  data-role="list-divider" >Friday, 03/30/2012</li>
			{foreach from=$talksFri key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Cardinal Room" OR $info.location == "Bowling Alley" OR $info.location == "White Oak Room" OR $info.location == "Fort Dearborn"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}<br/>{$timeAry.0.location}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
			{/foreach}
			<li  data-role="list-divider">Saturday, 03/31/2012</li>
			{foreach from=$talksSat key=k item=timeAry}
				{foreach from=$timeAry key=k item=info}
				
				{if $info.location == "Cardinal Room" OR $info.location == "Bowling Alley" OR $info.location == "White Oak Room" OR $info.location == "Fort Dearborn"}
				<li>
					{if $info.name != ""} <a data-ajax="true" href="speaker_details.php?id={$info.speaker}"> {/if}
					<h3>{$info.talkTitle}</h3>
					<p class="ui-li-aside">{$info.start_time}<br/>{$timeAry.0.location}</p>
					<p>{$info.name}</p>
					</a>
				</li>
				{/if}
				{/foreach}
			{/foreach}
		</ul>
	</div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl"}
