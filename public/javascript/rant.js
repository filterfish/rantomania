$(function() {

    $("textarea.rant").keypress(function(e) {
      });

    $("#send").click(function () {
	var rant = $("textarea.rant").val();

	if ( rant == '' ) {
	  return false;
	}

        var request = {
	rant:  rant
	}

	$.post ( '/rant', request, function () {
	    $("textarea.rant").val('');
	    $("ul.rants").prepend ( '<li>' + rant + '</li>' );
	  } );

	return false;

      });
  });
