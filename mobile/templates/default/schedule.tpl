{config_load file=default.conf section=$site}
{include file="header.tpl" title="Schedule"}
<div data-role="page" id="roomA">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" class="ui-btn-active ui-state-persist" data-ajax="true">Room A</a></li>
			<li><a href="#roomB" data-ajax="true">Room B</a></li>
			<li><a href="#roomF" data-ajax="true">Fort Dearborn</a></li>
		</ul>
	</div><!-- nav -->
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li  data-role="list-divider" >Friday, 03/30/2012</li>
		{foreach from=$talksFri key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Illinois A"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Illinois A"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
		{foreach from=$talksSat key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Illinois A"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Illinois A"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
	</div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="roomB">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar" data-position="fixed">
		<ul>
			<li><a href="#roomA" data-ajax="true">Room A</a></li>
			<li><a href="#roomB" class="ui-btn-active ui-state-persist" data-ajax="true">Room B</a></li>
			<li><a href="#roomF" data-ajax="true">Fort Dearborn</a></li>
		</ul>
	</div>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li data-role="list-divider" >Friday, 03/30/2012</li>
		{foreach from=$talksFri key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Illinois B"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Illinois B"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
		{foreach from=$talksSat key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Illinois B"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Illinois B"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
	</div><!-- /content -->
</div><!-- page -->
<div data-role="page" id="roomF">
        <div data-role="header">
                <h1>Schedule</h1>
		<a href="./" class="ui-btn-right" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
	<div data-role="navbar">
		<ul>
			<li><a href="#roomA" data-ajax="true">Room A</a></li>
			<li><a href="#roomB" data-ajax="true">Room B</a></li>
			<li><a href="#roomF" data-ajax="true" class="ui-btn-active ui-state-persist">Fort Dearborn</a></li>
		</ul>
	</div>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-role="listview">
			<li data-role="list-divider" >Friday, 03/30/2012</li>
		{foreach from=$talksFri key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Fort Dearborn"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Fort Dearborn"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
		<li  data-role="list-divider">Saturday, 03/31/2012</li>
		{foreach from=$talksSat key=k item=timeAry}
			{assign var=count value=$timeAry|@count}
			{if $timeAry.0.location == "Fort Dearborn"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.0.speaker}">
				<h3>{$timeAry.0.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.0.start_time}</p>
				<p>{$timeAry.0.name}</p>
				</a>
			</li>
			{elseif $timeAry.1.location == "Fort Dearborn"}
			<li>
				<a data-ajax="true" href="speaker_details.php?id={$timeAry.1.speaker}">
				<h3>{$timeAry.1.talkTitle}</h3>
				<p class="ui-li-aside">{$timeAry.1.start_time}</p>
				<p>{$timeAry.1.name}</p>
				</a>
			</li>
			{/if}
		{/foreach}
	</div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl"}
