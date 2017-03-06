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
    $( "#main-menu-container" ).fadeToggle( "fast", "linear" );
    if ( $( "#nav-menu-btn" ).text() == "Menu" ) {
      $( "#nav-menu-btn" ).text("Close");
    } else {
      $( "#nav-menu-btn" ).text("Menu");
    }
  });



  // Change the Ambassador display information
  $( ".amb-img" ).on("click", function() {
    var id = $(this).data("content");
    $( ".amb-intro" ).slideUp( "fast", "linear" );
    $( ".amb-content" ).slideUp( "2s", "swing" );
    setTimeout(function() {
      $( "#"+id ).slideDown( "2s", "linear" );
    }, 500);
  });


  // Social media cube rotation
  $('.cube').on("mouseover", function() {
    $(this).css('transform', 'rotateY(90deg)');
  });
  $('.cube').on("mouseout", function() {
    $(this).css('transform', 'rotateY(0deg)');
  });


  ////////////
  //Tweenstuff
  ////////////
  $('#wrapper').height($('html').height());


  var float = function(element, rtl){
    var speed = Math.random() * 5
    var rotation = Math.random() * 800
    var top = Math.random() * $('html').height();
    var left = (rtl) ? $('html').width() + 360 : -360;
    element.css('rotation',  '0deg');

    TweenMax.to(element, 10 + speed, {
      ease:Sine.easeInOut,
      left:left,
      top: top,
      rotation: rotation,
      onComplete: function(){
        rtl = (rtl) ? false : true;
        float(element, rtl);
      }
    });
  };

  float($('#leafLarge1'), true);
  float($('#leafLarge2'), false);
  float($('#leafLarge3'), true);

  // Flash messages: Notice
  setTimeout(function() {
    $("#notice-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 4000);

  // Flash messages: Alert
  setTimeout(function() {
    $("#alert-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 3000);





  // Applying the offset
  function offsetAnchor() {
    if(location.hash.length !== 0) {
      window.scrollTo(window.scrollX, window.scrollY - 100);
    }
  }

  // Capture hash changes while on the page
  $(window).on("hashchange", function () {
      offsetAnchor();
  });

  // For when changing page
  window.setTimeout(function() {
      offsetAnchor();
  }, 1);

  // Change the menu button when a link is clicked
  $(".hashlink").on("click", function() {
    $("#main-menu-container").fadeToggle( "fast", "linear" );
    $( "#nav-menu-btn" ).text("Menu");
  });

});
