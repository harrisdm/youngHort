// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require froala_editor.min.js
//= require_tree .


$(document).ready(function() {

  // Convert the textarea fields into the WYSIWYG editor
  $('#postContent').editable({inlineMode: false});

  // Toggle the menu on and off
  $( "#nav-menu-btn" ).on("click", function() {
    $( "#mainMenu" ).fadeToggle( "fast", "linear" );
    if ( $( "#nav-menu-btn" ).text() == "Menu" ) {
      $( "#nav-menu-btn" ).text("Close");
    } else {
      $( "#nav-menu-btn" ).text("Menu");
    }
  });



  // Change the Ambassador display information
  $( ".amb-img" ).on("click", function() {
    var id = $(this).data("content");
    $( ".amb-intro" ).fadeOut( "fast", "linear" );
    $( ".amb-content" ).fadeOut( "fast", "linear" );
    setTimeout(function() {
      $( "#"+id ).fadeIn( "fast", "linear" );
    }, 500);
  });


  // Social media cube rotation
  $('.cube').on("mouseover", function() {
    $(this).css('transform', 'rotateY(90deg)');
  });
  $('.cube').on("mouseout", function() {
    $(this).css('transform', 'rotateY(0deg)');
  });

  // Flash message fading
  setTimeout(function() {
    $("#notice-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 4000);

  setTimeout(function() {
    $("#alert-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 4000);

});
   