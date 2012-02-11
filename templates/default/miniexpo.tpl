{config_load file=default.conf section=$site}
{include file="header.tpl" title="Mini Expo"}

			<h1 class="content-title">Mini Expo Information</h1>

			<h2>What's all about?</h2>
			<div class="essay">
				<span class="right-img"><a href="{#ROOT#}/images/about_history.jpg"><img src="{#ROOT#}/images/miniexpo_ps1.jpg" class="medium" alt="" /></a><span class="caption"><a href="http://pumpingstationone.org/">Pumping Station: One</a> at Flourish Conference 2011.</span></span>
				<p>Flourish! Open Source Conference is not just a conference with talks and workshops. We also host a mini-expo for various companies and organizations to represent themselves to the audience throughout the conference. Organizations ranging from your favorite non-profit to the latest, most hip, but not very well known startup non-profit come to our mini-expo to show you what they've got. We also have Chicagoland companies come to represent their products and contributions to the open source community. So in between talks, after the day is over, or if you come in early, drop by the mini-expo and find out what Chicago really has to offer!</p>
				<h2>How do I sign up?</h2>
				<span class="left-img"><a href="{#ROOT#}/images/miniexpo_barcamp.jpg"><img src="{#ROOT#}/images/miniexpo_barcamp.jpg" class="medium" alt=""></a><span class="caption"><a href="http://barcampchicago.org/">Barcamp Chicago</a> at Flourish Conference 2011.</span></span><p>The goal of Flourish Conference is fto enhance your experience of the Chicagoland open source community and to show off what Chicago really has to offer. Due to this, all non-profit organizations can register at no cost. For profit organizations are provided a table for a small donation, please see our <a href="{#ROOT#}/sponsor.php">Sponsorship Information</a> page for more information. Please confirm your sponsorship or non-profit registration by March 16th. To sign up for the mini expo, simply use our <a href="{#ROOT#}/sponsorship_proposal.php">Sponsorship Proposal</a> form (or click on the big gold button below). Non-profits can put $0.00 for the sponsorship amount. We don't mind!</p>
			<form action="{#ROOT#}/sponsorship_proposal.php" method="GET">
				<input type="submit" value="Submit a Sponsorship Proposal!" class="big-button" />
			</form>
				<div style="clear: both;"></div>
			</div>

{include file="footer.tpl"}
