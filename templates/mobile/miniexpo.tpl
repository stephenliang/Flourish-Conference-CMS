{config_load file=default.conf section=$site}
{include file="header.tpl" title="Mini-Expo"}
<div data-role="page" id="miniexpo" data-add-back-btn="true">
        <div data-role="header">
                <h1>Mini-Expo</h1>
		<a href="./" class="ui-btn-right" data-ajax="false" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
        </div><!-- /header -->
        <div data-role="content">
		<ul data-theme="d" data-role="listview" data-filter="true">
			<li><a href="http://www.orbitz.com/" data-rel="external">Orbitz</a></li>
			<li><a href="http://www.spantree.net/" data-rel-"external">Spantree</a></li>
			<li><a href="http://www.dotomi.com/" data-rel-"external">Dotomi</a></li>
			<li><a href="http://www.nextag.com/" data-rel-"external">Nextag</a></li>
			<li><a href="http://bullcitymobile.com/" data-rel-"external">BullCity Mobile</a></li>
			<li><a href="http://illinoistech.org/" data-rel="external">ITA</a></li>
			<li><a href="http://pumpingstationone.org/" data-rel-"external">Pumping Station: One</a></li>
			<li><a href="http://freegeekchicago.org/" data-rel-"external">FreeGeek</a></li>
			<li><a href="http://nwclug.harpercollege.edu/" data-rel-"external">NWCLUG</a></li>
		</ul>
	</div><!-- /content -->
</div><!-- page -->
