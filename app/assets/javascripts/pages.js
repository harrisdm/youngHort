// mailer form 

$(document).ready(function() {

jQuery(function($)
{
    $("#contact_form").submit(function()
    {
        var email = $("#email").val(); // get email field value
        var name = $("#name").val(); // get name field value
        var title = $("#title").val(); //get title field value
        var message = $("#message").val(); // get message field value   
        $.ajax(
        {
            type: "POST",
            url: "https://mandrillapp.com/api/1.0/messages/send.json",
            data: {
                'key': 'cvJsi-uTJIlZthUx1uNpoQ',
                'message': {
                    'from_email': email,
                    'from_name': name,
                    'headers': {
                        'Reply-To': email
                    },
                    'subject': title,
                    'text': message,
                    'to': [
                    {
                        'email': 'stella.halena@gmail.com',
                        'name': 'stella',
                        'type': 'to'
                    }]
                }
            }
        })
        .done(function(response) {
            alert("Thank you! Your message has been sent. We will get back to you as soon as we can "); // show success message
            $("#email").val(''); // reset email field after successful submission
            $("#name").val(''); // reset name field after successful submission
            $("#title").val(''); // reset title field after sucessfull submission
            $("#message").val(''); // reset message field after successful submission
        })
        .fail(function(response) {
            alert("There's a problem sending your message. Please try again.");
        });
        return false; // prevent page refresh
    });
});

  // Slider on the home page
  $("#imageSlider").slick({
    //dots: true,
    arrows: false,
    infinite: true,
    slidesToShow: 1,
    adaptiveHeight: true,
    autoplay: true,
    autoplaySpeed: 2000,
    pauseOnHover: false
  });

});

