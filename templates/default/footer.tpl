		</div>
		<br />
			</div>
	<div id="footer">
		{if $mobileDevice == 1}
		<a href="/2011">2011</a> | <a href="/flourish2010">2010</a> | <a href="/flourish2009">2009</a> | <a href="/flourish2008">2008</a> | <a href="/index2007.php">2007</a><br />
		{/if}
	</div>
	{if $mobileDevice == 0}
	<div id="social-container" {if $showBar == 0}style="display:none"{/if}>
		{literal}
		<div id="google">
			<!-- Place this render call where appropriate -->
			<script type="text/javascript">
			  (function() {
			    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			    po.src = 'https://apis.google.com/js/plusone.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			  })();
			</script><!-- Place this tag where you want the +1 button to render -->
			<div class="g-plusone" data-size="small" data-annotation="bubble" data-width="120" data-href="http://flourishconf.com"></div>
		</div>
		<div id="facebook">
			<!-- Place this render call where appropriate -->
			<script type="text/javascript">
			  (function() {
			    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			    po.src = 'https://apis.google.com/js/plusone.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			  })();
			</script>
			<div class="fb-like" data-href="http://flourishconf.com" data-send="false" data-layout="button_count" data-width="120" data-show-faces="false"></div>
			<div id="fb-root"></div>
			<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=375601199121923";
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>
		</div>
		<div id="twitter-button" class="twitter-button-large">
			<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://flourishconf.com" data-text="Flourish! Conference 2012 in Chicago is coming Mar. 30-31, help spread the word!" data-via="flourishconf" data-hashtags="flrsh12"></a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		</div>
		<div id="twitter">
		</div>
		<div id="old-flourish">
			<a href="/2011">2011</a> | <a href="/flourish2010">2010</a> | <a href="/flourish2009">2009</a> | <a href="/flourish2008">2008</a> | <a href="/index2007.php">2007</a><br />
		</div>
		<div id="old-flourish-small">
			<a href="/2011">2011</a> | <a href="/flourish2010">2010</a> | <a href="/flourish2009">2009</a> <br /> <a href="/flourish2008">2008</a> | <a href="/index2007.php">2007</a><br />
		</div>

		<div id="close-bar">
			<span id="close-button" class="some-button"></span>
		</div>

		{/literal}
	</div>
	<div id="show-social-container" {if $showBar == 0}style="display:block"{/if}>
		<span id="open-button" class="some-button"></span>
	</div>
	{/if}

	<!-- Piwik -->
	{literal}
	<script type="text/javascript">
	var pkBaseURL = (("https:" == document.location.protocol) ? "https://www.flourishconf.com/piwik/" : "http://www.flourishconf.com/piwik/");
	document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
	</script><script type="text/javascript">
	try {
	var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
	piwikTracker.trackPageView();
	piwikTracker.enableLinkTracking();
	} catch( err ) {}
	</script><noscript><p><img src="http://www.flourishconf.com/piwik/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
	<!-- End Piwik Tracking Code -->
	{/literal}

	</body>
</html>
