/*
* Copyright (C) 2009 Joel Sutherland
* Licenced under the MIT license
* http://www.newmediacampaigns.com/page/jquery-flickr-plugin
*
* Available tags for templates:
* title, link, date_taken, description, published, author, author_id, tags, image*
*/

(function($) {


  $.randomize = function(arr) {
  
    for(var j, x, i = arr.length; i; j = parseInt(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x);
    return arr;
  
  
  
  };


})(jQuery);

(function($) {
	$.fn.jflickrfeed = function(settings, callback) {
		settings = $.extend(true, {
			flickrbase: 'http://api.flickr.com/services/rest?format=json',
			limit: 20,
			qstrings: {
				lang: 'en-us',
				format: 'json',
				method: 'flickr.photos.search',
				api_key: 'ced41541d8c4ac4a7fc9030b55d769c1',
				jsoncallback: '?',
				per_page: 500,
				sort: 'interestingness-desc',
			},
			cleanDescription: true,
			useTemplate: true,
			itemTemplate: '',
			itemCallback: function(){}
		}, settings);

		var url = settings.flickrbase;
		var first = false;

		for(var key in settings.qstrings){
			if(!first)
				url += '&';
			url += key + '=' + settings.qstrings[key];
			first = false;
		}

		return $(this).each(function(){
			var $container = $(this);
			var container = this;
			$.getJSON(url, function(data){
				$.randomize(data.photos.photo);
				$.each(data.photos.photo, function(i,item){
					if(i < settings.limit){
					
						// Clean out the Flickr Description
						if(settings.cleanDescription){
							var regex = /<p>(.*?)<\/p>/g;
							var input = item.description;
							if(regex.test(input)) {
								item.description = input.match(regex)[2]
								if(item.description!=undefined)
									item.description = item.description.replace('<p>','').replace('</p>','');
							}
						}
						
						// Add Image Sizes
						// http://www.flickr.com/services/api/misc.urls.html
						//
						item['image'] = 'http://farm' + item.farm + '.static.flickr.com/'
					            + item.server + '/' + item.id + '_' + item.secret+'.jpg';    
			     			item['url'] = 'http://www.flickr.com/photos/flourishconf/'+item.id;	
						
						// Use Template
						if(settings.useTemplate){
							var template = settings.itemTemplate;
							for(var key in item){
								var rgx = new RegExp('{{' + key + '}}', 'g');
								template = template.replace(rgx, item[key]);
							}
							$container.append(template)
						}
						
						//itemCallback
						settings.itemCallback.call(container, item);
					}
				});
				if($.isFunction(callback)){
					callback.call(container, data);
				}
			});
		});
	}
})(jQuery);
