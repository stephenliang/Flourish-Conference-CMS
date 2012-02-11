{config_load file=default.conf section=$site}
{include file="header.tpl" title="Sponsorship Proposal"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Sponsorship Proposal</h1>
			<div class="message-box"><p>The Flourish organizers are now accepting sponsorship proposals for Flourish 2012. Please review the <a href="{#ROOT#}/sponsor.php">Sponsorship Information Page</a> for more information on what you get for sponsoring Flourish. <br /><br />Please also review the <a href="{#ROOT#}/miniexpo.php">Mini Expo</a> information page for more information about our excellent mini expo! Thank you for supporting Flourish Conference!</p></div>
<br />
			<form action="{#ROOT#}/sponsorship_proposal.php" method="POST">
				<h1 class="content-title">Sponsor Details</h1>

				<strong>Name</strong>:<br />
				<input type="text" name="name" value="{$POST.name}" />
				<br /><br />
				<strong>Company</strong>:<br />
				<input type="text" name="company" value="{$POST.company}" />
				<br /><br />
			
				<strong>Title</strong>:<br />
				<input type="text" name="title" value="{$POST.title}" />
				<br /><br />
				
				<strong>Phone</strong>:<br />
				<input type="tel" name="phone" value="{$POST.phone}" />
				<br /><br />
				
				<strong>E-Mail</strong>:<br />
				<input type="text" name="email" value="{$POST.email}" />
				<br /><br />
				
				<strong>Mailing Address</strong>:<br />
				<input type="text" name="address" value="{$POST.address}" />
				<br /><br />

				<strong>Sponsorship Amount</strong>:<br />
				<input type="text" name="sponsorshipAmount" value="{$POST.sponsorshipAmount}" />
				<br /><br />

				<strong>Business Status</strong>:<br />
				<input type="radio" name="businessStatus" value="individual" {if $POST.businessStatus == "individual"}checked{/if} /> Individual<br />
				<input type="radio" name="businessStatus" value="Corporation" {if $POST.businessStatus == "Corporation"}checked{/if} /> Corporation<br />
				<input type="radio" name="businessStatus" value="nonprofit" {if $POST.businessStatus == "nonprofit"}checked{/if} /> Non-Profit
				<br /><br />

				<strong>Would you like to be involved in the mini-expo?</strong>:<br />
				<input type="radio" name="miniexpo" value="Yes" {if $POST.miniexpo == "Yes"}checked{/if} /> Yes<br />
				<input type="radio" name="miniexpo" value="No" {if $POST.miniexpo == "No"}checked{/if} /> No
				<br /><br />
				<strong>Enter recaptcha code</strong>
				{$recaptcha}
				<br /><br />

				<input type="submit" name="submit" value="Submit Sponsorship Proposal" />
			</form>
{include file="footer.tpl"}
