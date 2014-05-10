

$(document).on("focus", function() {
	$('#home-message').hide();
	$('.img').hover( function() {
		$(this).fadeTo(300, 0.5, function() {
			$(this).fadeTo(300, 1);
		});
	});
    $('.img-container').click( function() {
    	$('.img-container').slideUp("slow", function() {
    		$('.img-container').slideDown("slow", function() {
    			$('#home-message').slideToggle("fast");
    		});
    		
    	});
    });
});