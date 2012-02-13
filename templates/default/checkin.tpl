{config_load file=default.conf section=$site}
{include file="header_admin.tpl" title="Registration Checkin"}

	<label for="search">Search</label>
	<input type="text" name="search" value="" id="search" />
	<noscript>IMPORTANT: This section requires Javascript for search and dialog functionalities! Javascript it currently detected as disabled.</noscript>
	<table>
	<tr><th>ID</th><th>Name</th><th>email</th><th>T-Shirt Size</th><th>Wireless Username</th><th>Wireless Password</th><th>Comments</th></tr>
	{foreach from=$reglist key=k item=i}
	<tr id="result"><td>{$k}</td><td>{$i.name}</td><td>{$i.email}</td><td>{$i.tsize}</td><td>{$i.wifiuser}</td><td>{$i.wifipass}</td><td>{$i.comments}</td><td class="tdc"><div><form name="checkin-{$k}" id="checkin-{$k}" class="formcl" action="./checkin.php" method="post">
	<p class="submit">
		<input type="submit" name="submit" id="submit" class="{if $i.day1}button-secondary{else}button-primary{/if}" value="Day 1 {if $i.day1}Checkout{else}Checkin{/if}" />
		<input type="hidden" name="day" value="1" />
		<input type="hidden" name="{if $i.day1}checkout_for{else}checkin_for{/if}" value="{$k}" />
	</p>
</form>
<form name="checkin-{$k}" id="checkin-{$k}" class="formcr" action="./checkin.php" method="post">
	<p class="submit">
		<input type="submit" name="submit" id="submit" class="{if $i.day2}button-secondary{else}button-primary{/if}" value="Day 2 {if $i.day2}Checkout{else}Checkin{/if}" />
		<input type="hidden" name="day" value="2" />
		<input type="hidden" name="{if $i.day2}checkout_for{else}checkin_for{/if}" value="{$k}" />
	</p>
</form></div></td></tr>
	{/foreach}
	</table>
	<div id="help" class="dialog" title="Help Information">
		<p>This is the Flourish 2012 checkin section of the site.  Please allow javascript to be run on this section of the website. There are 2 main functions of this page.</p>
		<p><strong>Search</strong> - The search functionality allows you to quickly sort through the many registrants.  While the input box is focused, you may press the escape key on your keyboard to clear the search filter.  The search behaviour is a little different than what you may expect.  It searches each cell for each specific word. Words do not neccessarily have to be in the same cell to find a match.</p>
		<p><strong>Day1&amp;2 Checkin&amp;Checkout</strong> - The blue buttons on the left allow you to check in a registrant.  Red buttons indicate that the registrant has already been checked in.</p>
		<p>If you mistakenly click checkin on a registrant, just click on the corresponding red button to checkout.</p>
		<p>If possible, please do not resubmit form data when refreshing.</p>
	</div>
	<div id="stats" class="dialog" title="Statistics Page">
		<p>Sorry, but this page isn't finished quite yet. Check back next week.</p>
	</div>
{include file="footer_admin.tpl"}
