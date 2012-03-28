{config_load file='default.conf' section=$site}
{include file="header.tpl" title="Registration"}
<div data-role="page" data-add-back-btn="true">

        <div data-role="header">
                <h1>Registration</h1>
		<a href="./" class="ui-btn-right" data-ajax="false" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
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
		<div data-role="collapsible-set">
			<div data-role="collapsible" data-collapsed="false">
				<h3>Preface</h3>
				<p>
					Registration is now open for the public to sign up for Flourish! Open Source Conference 2012. We are happy to have you come to the conference and we hope that you will have a good time. Flourish Confrence is a <strong>free</strong> and open to the public conference. We encourage you to bring friends, family, and co-workers to our conference.</p>
			</div><!-- /collapsible -->
			<div data-role="collapsible" data-collapsed="true">
			<h3>Note</h3><p>We have a limited supply of T-Shirts available and therefore, only those who register in advance are guaranteed a T-Shirt.</p>
			</div>
			<div data-role="collapsible" data-collapsed="true">
			<h3>Disability Notice</h3> <p>If you need special accommodations due to a disability, please email <a href="mailto:info@flourishconf.com">info@flourishconf.com</a> to let us know and we will try our best to ensure you have the best experience at Flourish Conference.</p>
			</div>

			<form action="{#ROOT#}/registration.php" method="POST">
			
			<div data-role="fieldcontain">
				<label for="name">Name*</label>
				<input type="text" name="name" value="" />
			</div>	
			<div data-role="fieldcontain">
				<label for="email">E-Mail*</label>
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
			
			<div data-role="fieldcontain">
				<label for="laptop">Are you bringing a laptop?</label>
				<select id="flip-1" name="laptop" data-role="slider">
					<option value="no">No</option>
					<option value="yes">Yes</option>
				</select>
			</div>	

			<div data-role="fieldcontain">
				<label for="student">Are a UIC student?</label>
				<select id="flip-2" name="student" data-role="slider">
					<option value="no">No</option>
					<option value="yes">Yes</option>
				</select>
			</div>	

			<div data-role="fieldcontain">
				<label for="hear">Where did you hear about us?</label>
				<input type="text" name="hear" value="" />
			</div>	

			<div data-role="fieldcontain">
				<label for="where">Where are you from?</label>
				<input type="text" name="where" value="" />
			</div>	

			<div data-role="fieldcontain">
				<label for="textarea-1">Comments:</label>
				<textarea name="comments" id="textarea-1" value=""></textarea>
			</div>	
		<input type="submit" name="submit" value="Submit" />
		</form>

        </div><!-- /content -->
</div><!-- page -->
{include file="footer.tpl" title="Main"}
