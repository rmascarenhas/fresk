$(function() {
    $('form').on('click', '.remove_fields', function(event) {
        // "activate" the _destroy hidden field, indicating that the task is
        // to be removed
        $(this).first().prev('div').children(':first').children(':first').val(true);

        // hide task form
        $(this).closest('fieldset').hide();

        event.preventDefault();
    });

	$('form').on('click', '.add_fields', function(event) {
		// replace the object id used in the +link_to_add_fields+ helper method to the
		// current time, so that we have a unique index for each object.
		time = new Date().getTime();
		regexp = new RegExp($(this).data('id'), 'g');

		// prepend the fields, doing the actual id replacement
		$(this).before($(this).data('fields').replace(regexp, time));
		
		event.preventDefault();
	});
});
