// Title: admin.js
// Author: clee231
// Description: Adds dynamic content to admin pages.

setTimeout(function() { $(".success-box").fadeOut(3000); }, 1000);

function filter(selector, query) {  
  query =   $.trim(query); //trim white space  
  query = query.replace(/ /gi, '|'); //add OR for regex query  
  
  $(selector).each(function() {  
    ($(this).text().search(new RegExp(query, "i")) < 0) ? $(this).fadeOut('slow') : $(this).fadeIn('fast');  
  });  
}  
$(window).load(function () {
	//default each row to visible  
	$('tbody tr').fadeIn();
	$('#help').dialog({ autoOpen: false }, { width: 500 }, {show: 'fade'}, { hide: 'explode' });
	$('#menu span.menu_item a').eq(0).click(function() {
		$('#help').dialog('open');
	});
	$('#stats').dialog({ autoOpen: false }, {show: 'fade'}, { hide: 'explode' });
	$('#menu span.menu_item a').eq(1).click(function(event) {
		event.preventDefault();
		$('#stats').dialog('open');
	});

	$('#search').keyup(function(event) {
	//if esc is pressed or nothing is entered  
	if (event.keyCode == 27 || $(this).val() == '') {  
		//if esc is pressed we want to clear the value of search box  
		$(this).val('');  

		//we want each row to be visible because if nothing  
		//is entered then all rows are matched.  
	$('tbody tr').fadeIn();  
    }  

	//if there is text, lets filter  
	else {  
		filter('tbody tr.result', $(this).val());  
	} 
});
});
