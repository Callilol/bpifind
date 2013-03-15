$(document).ready(function(){

	//searchbar
	$(".searchbar").attr("autocomplete", "off");

	$(".searchbar").typeahead({
		source: function(query, process) {
			search_klass = this.$element.attr('klass');
			$.getJSON(
				'/admin/' + search_klass  + '/search.json',
				{q: query},
				function (data) {
					return process(data);
				}
			);
			$.get(
				'/admin/' + search_klass + '/search',
				{q: query},
				function (data) {
					//$('#' + search_klass.substring(1, search_klass.length))[0].innerHTML = data;
					$('#collections')[0].innerHTML = data;
				}
			);
		},
		updater: function (obj) {
			alert(obj);
			//window.location = obj["url"];
		}
	});


});
