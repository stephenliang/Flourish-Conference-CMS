{config_load file=default.conf section=$site}
{include file="header.tpl" title="Schedule"}
<div data-role="page" id="roomA" data-add-back-btn="true">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
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
	<div data-role="footer" data-id="nav" data-position="fixed">
		<div data-role="navbar" >
			<ul>
				<li><a href="#roomA" class="ui-btn-active ui-state-persist">A</a></li>
				<li><a href="#roomB">B</a></li>
				<li><a href="#roomC">C</a></li>
				<li><a href="#other">Other</a></li>
			</ul>
		</div><!-- nav -->
        </div><!-- /footer -->
</div><!-- page -->
<div data-role="page" id="roomB">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
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
	<div data-role="footer" data-id="nav" data-position="fixed">
		<div data-role="navbar" >
			<ul>
				<li><a href="#roomA">A</a></li>
				<li><a href="#roomB" class="ui-btn-active ui-state-persist">B</a></li>
				<li><a href="#roomC">C</a></li>
				<li><a href="#other">Other</a></li>
			</ul>
		</div><!-- nav -->
        </div><!-- /footer -->
</div><!-- page -->
<div data-role="page" id="roomC">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
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
	<div data-role="footer" data-id="nav" data-position="fixed">
		<div data-role="navbar" >
			<ul>
				<li><a href="#roomA">A</a></li>
				<li><a href="#roomB">B</a></li>
				<li><a href="#roomC" class="ui-btn-active ui-state-persist">C</a></li>
				<li><a href="#other">Other</a></li>
			</ul>
		</div><!-- nav -->
        </div><!-- /footer -->
</div><!-- page -->
<div data-role="page" id="other">
        <div data-role="header" data-id="nav" data-position="fixed">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
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
	<div data-role="footer" data-id="nav" data-position="fixed">
		<div data-role="navbar" >
			<ul>
				<li><a href="#roomA">A</a></li>
				<li><a href="#roomB">B</a></li>
				<li><a href="#roomC">C</a></li>
				<li><a href="#other" class="ui-btn-active ui-state-persist">Other</a></li>
			</ul>
		</div><!-- nav -->
        </div><!-- /footer -->
</div><!-- page -->
{include file="footer.tpl"}
