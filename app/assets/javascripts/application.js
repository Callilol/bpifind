// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-typeahead

$(document).ready(function(){

	//searchbar
	$(".searchbar").attr("autocomplete", "off");

	$(".searchbar").typeahead({
		source: function(query, process) {
			search_klass = this.$element.attr('klass');
			nested = this.$element.attr('nested');
			$.getJSON(
				'/admin' + search_klass  + '/search.json',
				{q: query, nested: nested},
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
			$.get(
				'/admin' + search_klass + '/search',
				{q: query, nested: nested},
				function (data) {
					$('#' + search_klass.substring(1, search_klass.length))[0].innerHTML = data;
				}
			);
		},
		updater: function (item) {
			if (map[item].url != 'none') { window.location = map[item].url; }
		}
	});
});
