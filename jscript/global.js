$(document).ready( function() {
	$("input:submit").button();
	 $("#close-button").button({ icons: {primary: "ui-icon-closethick"}}).click (function() {
		 createCookie("show-bar", 0, 30);
		 $("#social-container").hide();
		 $("#show-social-container").show();
	 });

	 $("#open-button").button({ icons: {primary: "ui-icon-plusthick"}}).click (function() {
		 createCookie("show-bar", 1, 30);
		 $("#social-container").show();
		 $("#show-social-container").hide();
	 });

	 if ( $(window).width() < 1024 )
	{
		$("#old-flourish").hide();
		$("#old-flourish-small").show();
		$("#twitter-button").removeClass("twitter-button-large");
		$("#twitter-button").addClass("twitter-button-small");
	}

});

function createCookie(name,value,days) {
if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
}
else var expires = "";
document.cookie = name+"="+value+expires+"; path=/";
}
