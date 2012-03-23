{config_load file=default.conf section=$site}
{include file="header.tpl" title="Registration"}
{include file="tinymce.tpl"}
			<h1 class="content-title">Registration for Flourish! Conference 2012</h1>
			<div class="message-box">
				<p>
					Registration is now open for the public to sign up for Flourish! Open Source Conference 2012. We are happy to have you come to the conference and we hope that you will have a good time. Flourish Confrence is a <strong>free</strong> and open to the public conference. We encourage you to bring friends, family, and co-workers to our conference.</p>
				<p><strong>T-Shirt Availability Notice</strong>: We have run out of T-Shirts in certain sizes. You can still indicate your T-Shirt size but you will be placed on a wait list. If there are still T-Shirts available in your size on Saturday Afternoon (12:00pm), you can pick one up at the registration table.</p>
				<p><strong>Disability Notice</strong>: If you need special accommodations due to a disability, please email <a href="mailto:info@flourishconf.com">info@flourishconf.com</a> to let us know and we will try our best to ensure you have the best experience at Flourish Conference.</p>

			</div>
<br />
			<form action="{#ROOT#}/registration.php" method="POST">
				<h1 class="content-title">Attendee Details</h1>

				<strong>Name</strong>:<br />
				<input type="text" name="name" value="{$POST.name}" />
				<br /><br />
				
				<strong>E-Mail</strong>:<br />
				<input type="text" name="email" value="{$POST.email}" />
				<br /><br />
				
				<strong>T-Shirt Size (optional)</strong>:<br />
				<input type="radio" name="size" value="small" {if $POST.size == "small"}checked{/if}> Small (Waitlist)<br />
				<input type="radio" name="size" value="medium" {if $POST.size == "medium"}checked{/if}> Medium (Waitlist)<br />
				<input type="radio" name="size" value="large" {if $POST.size == "large"}checked{/if}> Large<br />
				<input type="radio" name="size" value="xl" disabled {if $POST.size == "xl"}checked{/if}> XL<br />
				<input type="radio" name="size" value="xxl" {if $POST.size == "xxl"}checked{/if}> XXL (Waitlist)<br />
				<input type="radio" name="size" value="xxxl" {if $POST.size == "xxxl"}checked{/if}> XXXL<br />
				<br /><br />

				<strong>Are you bringing a laptop? (optional)</strong>:<br />
				<input type="radio" name="laptop" value="yes" {if $POST.laptop == "yes"}checked{/if}> Yes<br />
				<input type="radio" name="laptop" value="no" {if $POST.laptop == "no"}checked{/if}> No<br />
				<br /><br />
				
				<strong>Are you a UIC Student?</strong>:<br />
				<input type="radio" name="student" value="yes" {if $POST.student == "yes"}checked{/if}> Yes<br />
				<input type="radio" name="student" value="no" {if $POST.student == "no"}checked{/if}> No<br />
				<br /><br />
				
				<strong>Where did you hear about us? (optional)</strong>:<br />
				<input type="text" name="hear" value="{$POST.hear}" />
				<br /><br />

				<strong>Where are you from? (optional)</strong>:<br />
				<input type="text" name="where" value="{$POST.where}" />
				<br /><br />


				<strong>Comments (optional)</strong>:<br />
				<textarea name="comments">{$POST.comments}</textarea>
				<br /><br />

				<strong>Enter recaptcha code</strong>
				{$recaptcha}
				<br /><br />

				<input type="submit" name="submit" value="Submit Registration" />
			</form>
{include file="footer.tpl"}
