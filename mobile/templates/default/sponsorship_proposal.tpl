{config_load file=default.conf section=$site}
{include file="header.tpl" title="Sponsorship Proposal"}
        <div data-role="header">
		<a href="sponsor.php" data-role="button" data-icon="back" class="ui-btn-left" data-direction="reverse" data-iconpos="notext">Back</a>
                <h1>Sponsorship Proposal</h1>
		<a href="./" data-role="button" data-icon="home" class="ui-btn-right" data-direction="reverse" data-iconpos="notext">Home</a>
        </div><!-- /header -->
        <div data-role="content">
		{if $message}
		<ul data-role="listview" data-inset="true" data-theme="e">
			<li>
			<h1>Submit Error</h1>
			<p>{$message}</p>
			</li>
		</ul>
		{/if}
		<div data-role="collapsible" data-collapsed="false">
			<h3>Preface</h3>
			<p>
			The Flourish organizers are now accepting sponsorship proposals for Flourish 2012. Please review the <a href="{#ROOT#}/sponsor.php" rel="external">Sponsorship Information Page</a> for more information on what you get for sponsoring Flourish. </p>
			<p>Please also review the <a href="{#ROOT#}/miniexpo.php" rel="external">Mini Expo</a> information page for more information about our excellent mini expo! Thank you for supporting Flourish Conference!</p>
		</div><!-- /collapsible -->

		<form action="{#ROOT#}/sponsorship_proposal.php" method="POST">
			<div data-role="fieldcontain">
				<label for="name">Name*</label>
				<input type="text" name="name" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="company">Company*</label>
				<input type="text" name="company" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="title">Title*</label>
				<input type="text" name="title" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="phone">Phone*</label>
				<input type="tel" name="phone" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="email">E-Mail*</label>
				<input type="email" name="email" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="address">Mailing Address*</label>
				<input type="text" name="address" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="sponsorshipAmount">Sponsorship Amount*</label>
				<input type="text" name="sponsorshipAmount" value="" />
			</div>	
			<div data-role="fieldcontain">
				<fieldset data-role="controlgroup" >
					<legend>Bussiness Status*</legend>
					<input type="radio" name="businessStatus" id="businessStatus-1" value="individual" checked="checked"/> 
					<label for="businessStatus-1">Individual</label>
					<input type="radio" name="businessStatus" id="businessStatus-2" value="corporation"/> 
					<label for="businessStatus-2">Corporation</label>
					<input type="radio" name="businessStatus" id="businessStatus-3" value="nonprofit"/> 
					<label for="businessStatus-3">Non-Profit</label>
				</fieldset>
			</div>	
			
			<div data-role="fieldcontain">
				<label for="miniexpo">Would you like to be involved in the mini-expo?*</label>
				<select id="flip-1" name="miniexpo" data-role="slider">
					<option value="no">No</option>
					<option value="yes">Yes</option>
				</select>
			</div>	

			</div>	
			<div data-role="fieldcontain">
			<p>Enter recaptcha code</p>
			{$recaptcha}
			</div>	
		<input type="submit" name="submit" value="Submit" data-theme="e" />
		</form>
		</div>
	</div>
{include file="footer.tpl"}
