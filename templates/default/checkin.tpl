{config_load file=default.conf section=$site}
{include file="header_checkin.tpl" title="Registration Checkin"}

	<label for="search">Search</label>
	<input type="text" name="search" value="" id="search" />
	<noscript>IMPORTANT: This section requires Javascript for search and dialog functionalities! Javascript it currently detected as disabled.</noscript>
	<table id="regtable">
	<tr><th>ID</th><th>Name</th><th>email</th><th>T-Shirt Size</th><th>Wireless Username</th><th>Wireless Password</th><th>Comments</th><th></th></tr>
	{foreach from=$reglist key=k item=i}
	<tr class="result"><td>{$k}</td><td>{$i.name}</td><td>{$i.email}</td><td>{$i.tsize}</td><td>{$i.wifiuser}</td><td>{$i.wifipass}</td>{if $i.comments == ''}<td></td>{else}<td class="regcomcell"><div class="regcomment">{$i.comments}</div></td>{/if}<td class="tdc"><div><form name="checkin1-{$k}" id="checkin1-{$k}" class="formcl" action="./checkin.php" method="post">
	<p class="submit">
		<input type="submit" name="submit" id="submit1-{$k}" class="{if $i.day1}button-secondary{else}button-primary{/if}" value="Day 1 {if $i.day1}Checkout{else}Checkin{/if}" />
		<input type="hidden" name="day" value="1" />
		<input type="hidden" name="{if $i.day1}checkout_for{else}checkin_for{/if}" value="{$k}" />
	</p>
</form>
<form name="checkin2-{$k}" id="checkin2-{$k}" class="formcr" action="./checkin.php" method="post">
	<p class="submit">
		<input type="submit" name="submit" id="submit2-{$k}" class="{if $i.day2}button-secondary{else}button-primary{/if}" value="Day 2 {if $i.day2}Checkout{else}Checkin{/if}" />
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
		<p><strong>Other Functions</strong></p>
		<p><strong>Comments</strong> - All registrant comments are hidden by default because they can be rather long. Just click on a registrant's cell to view the comment. Click again to hide. Comments are available only on cells with orange backgrounds.</p>
		<p>Note: If you happen to refresh the screen and your browser happens to ask to resubmit data, please try to NOT submit.</p>
	</div>
	<div id="doublecheckin" class="dialog" title="Error! Double Checkin!">
		<p>Sorry, but this registrant has already checked in on another day.</p>
		<p>If you need this registrant checked-in on another day, then you much first check him/her out of the other day.</p>
	</div>
{include file="footer_checkin.tpl"}
