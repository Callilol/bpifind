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
//= require jquery-ui
//= require_tree .
//= require_tree ./select2-3.3.2
//= require bootstrap-typeahead

$(document).ready(function(){

	$(".date_picker").datepicker( $.datepicker.regional['fr'] );

	//searchbars
	$(".searchbar").attr("autocomplete", "off");

	$(".searchbar").typeahead({
		source: function(query, process) {
			search_klass = this.$element.attr('klass');
			$.getJSON(
				'/admin' + search_klass  + '/search.json',
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
			$.get(
				'/admin' + search_klass + '/search',
				{q: query},
				function (data) {
					$('#' + search_klass.substring(1, search_klass.length))[0].innerHTML = data;
				}
			);
		},
		updater: function (item) {
			if (map[item].url != 'none') { window.location = map[item].url; }
		}
	});

	//filters
	$('.filter').change(function(){
		filters = $('.filter')
		params = {}
		for (var i = 0 ; i < filters.length; i++)
		{ 
			field = filters[i].name;
			value = filters[i].value;
			params[field] = value;
		}
		url = $(this).attr('url');
		partial = $(this).attr('partial');
		$.get(
			url,
			{filters: params},
			function (data) {
				$(partial)[0].innerHTML = data;
			}
		);
	});

});
