$(document).ready(function() {
	$('#cycle').jflickrfeed({
		qstrings: {
			user_id: '34691837@N05'
		},
		itemTemplate: '<li><a href="{{url}}" target="_blank"><img src="{{image}}" alt="" /></a></li>'
	}, function(data) {
		$('#cycle div').hide();
		$('#cycle').cycle({
			timeout: 5000
		});
		$('#cycle li').hover(function(){
			$(this).children('div').show();
		},function(){
			$(this).children('div').hide();
		});
	});
	
	$(".right-gallery-img").each( function(index) {
		$(this).show();
	});

});

