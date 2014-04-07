$(document).ready(function() {
	/*
	// remote
	var bestPictures = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		prefetch: web.base + 'static/theme/forest/lib/typeahead/post_1960.json',
		remote: web.base + 'queries.php?%QUERY.json'
	});
	bestPictures.initialize();
	
	$('#remote .typeahead').typeahead(null, {
		name: 'best-pictures',
		displayKey: 'value',
		source: bestPictures.ttAdapter()
	});
	
	// custom templates
	var custom = $('.custom-templates-typeahead').typeahead(null, {
		name: 'best-pictures',
		displayKey: 'value',
		source: bestPictures.ttAdapter(),
		templates: {
			empty: [
				'<div class="empty-message">',
				'unable to find any Best Picture winners that match the current query',
				'</div>'
			].join('\n'),
			suggestion: Handlebars.compile('<p><strong>{{value}}</strong> â€“ {{year}}</p>')
		}
	});
	custom.on('typeahead:selected',function(evt, data) {
		console.log(data);
	});
	/*	*/
});