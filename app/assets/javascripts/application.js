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
//= require jquery.ui.all
//= require bootstrap
//= require_tree .

$(document).ready(function(){

	$(".date_picker").datepicker( $.datepicker.regional['fr'] );

	//searchbars
	$(".searchbar").attr("autocomplete", "off");

	$(".searchbar").typeahead({
		source: function(query, process) {
			search_klass = this.$element.attr('klass');
			nested = this.$element.attr('nested');
			$.getJSON(
				'/admin/search.json',
				{q: query, klass: search_klass, nested: nested},
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
				'/admin/search',
				{q: query, klass: search_klass, nested: nested},
				function (data) {
					console.log();
					$('.partial')[0].innerHTML = data;
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
		klass = $(this).attr('klass');
		nested = $(this).attr('nested');
		params = {}
		for (var i = 0 ; i < filters.length; i++)
		{ 
			field = filters[i].name;
			value = filters[i].value;
			params[field] = value;
		}
		url = $(this).attr('url');
		$.get(
			'/admin/filter',
			{filters: params, klass: klass, nested: nested},
			function (data) {
				$('.partial')[0].innerHTML = data;
			}
		);
	});

	//reset
	$(".reset").on("ajax:success", function(response, data){
		$('.searchbar')[0].value = '';
		$('select').val('0');
		$('.partial')[0].innerHTML = data;
	});

});
