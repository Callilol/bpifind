$(document).ready(function(){

	//searchbars
	$(".collection_search").attr("autocomplete", "off");

	$(".collection_search").typeahead({
		source: function(query, process) {
			$.getJSON(
				'/admin/collections/search.json',
				{q: query},
				function (data) {
					items = [];
					map = {};
					$.each(data, function (i, item) {
						map[item.label] = item;
						items.push(item.label);
					});
					return process(items);
				}
			);
		},
		updater: function (item) {
			if (map[item].url != 'none') { window.location = map[item].url; }
		}
	});
});
