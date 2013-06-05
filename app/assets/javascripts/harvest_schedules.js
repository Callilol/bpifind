$(document).ready(function(){

	$('#harvest_schedule_collection_ids').multiselect({
      buttonClass: 'btn',
      buttonWidth: 'auto',
      buttonContainer: '<div class="btn-group" />',
      maxHeight: 200,
			enableFiltering: true,
			filterPlaceholder: 'Rechercher une collection...',
			filterBehavior: 'both',
      buttonText: function(options) {
        if (options.length == 0) {
          return 'Aucune <b class="caret"></b>';
        }
        else if (options.length > 3) {
          return options.length + ' collections  <b class="caret"></b>';
        }
        else {
          var selected = '';
          options.each(function() {
            selected += $(this).text() + ', ';
          });
          return selected.substr(0, selected.length -2) + ' <b class="caret"></b>';
        }
      }
    });

});
