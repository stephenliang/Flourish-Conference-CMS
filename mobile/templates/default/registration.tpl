{config_load file='default.conf' section=$site}
{include file="header.tpl" title="Registration"}
<div data-role="page">

        <div data-role="header" data-position="inline">
		<a href="{#ROOT#}" data-role="button" data-icon="delete" class="ui-btn-left" data-direction="reverse" data-theme="a">Cancel</a>
                <h1>Registration</h1>
		<a href="#" data-role="button" data-icon="check" class="ui-btn-right" data-theme="e">Submit</a>
		<!--<input type="submit" data-icon="check" class="ui-btn-right" data-inline="true" data-theme="b" data-transition="pop" value="Submit"/>-->
        </div><!-- /header -->

        <div data-role="content">
		<div data-role="collapsible" collapsed="false">
				<h3>Preface</h3>
				<p>
					Registration is now open for the public to sign up for Flourish! Open Source Conference 2012. We are happy to have you come to the conference and we hope that you will have a good time. Flourish Confrence is a <strong>free</strong> and open to the public conference. We encourage you to bring friends, family, and co-workers to our conference.</p>
					<div data-role="collapsible" collapsed="false">
					<h3>Note</h3><p>We have a limited supply of T-Shirts available and therefore, only those who register in advance are guaranteed a T-Shirt.</p>
					</div>
					<div data-role="collapsible" collapsed="false">
					<h3>Disability Notice</h3> <p>If you need special accommodations due to a disability, please email <a href="mailto:info@flourishconf.com">info@flourishconf.com</a> to let us know and we will try our best to ensure you have the best experience at Flourish Conference.</p>
					</div>
		</div><!-- /collapsible -->

		<form action="{#ROOT#}/registration.php" method="POST">
		
		<div data-role="fieldcontain">
			<label for="name">Name:</label>
			<input type="text" name="name" value="" />
		</div>	
		<div data-role="fieldcontain">
			<label for="email">E-Mail:</label>
			<input type="email" name="email" value="" />
		</div>	
		<div data-role="fieldcontain">
			<fieldset data-role="controlgroup" data-type="horizontal">
				<legend>Choose a T-Shirt Size:</legend>
				<input type="radio" name="size" id="size-1" value="small" checked="checked"/> 
				<label for="size-1">S</label>
				<input type="radio" name="size" id="size-2" value="medium"/> 
				<label for="size-2">M</label>
				<input type="radio" name="size" id="size-3" value="large"/> 
				<label for="size-3">L</label>
				<input type="radio" name="size" id="size-4" value="xl"/> 
				<label for="size-4">XL</label>
				<input type="radio" name="size" id="size-5" value="xxl"/> 
				<label for="size-5">XXL</label>
			</fieldset>
		</div>	
		</form>

        </div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl" title="Main"}
