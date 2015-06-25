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
    $( ".amb-content" ).slideUp( "fast", "linear" );
    setTimeout(function() {
      $( "#"+id ).slideDown( "fast", "linear" );
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

  var leafLarge1 = $('#leafLarge1');
  var leafLarge2 = $('#leafLarge2');
  var leafLarge3 = $('#leafLarge3');

  var leafFloat1 = function(rtl){
    var speed = Math.random() * 5
    var rotation = Math.random() * 800
    var top = Math.random() * $('html').height();
    leafLarge1.css('rotation',  '0deg')
    if(rtl){
      var left = $('html').width() + 360;
      } else{
        var left = -360;
      };
  TweenMax.to(leafLarge1, 10 + speed, {
    // repeat: -1,
    // yoyo:true,
    ease:Sine.easeInOut,
    left:left,
    top: top,
    rotation: rotation,
    onComplete: function(){
      rtl = (rtl) ? false : true;
      leafFloat1(rtl);
    };
    });
  }

    var leafFloat2 = function(rtl){
    var speed = Math.random() * 5
    var rotation = Math.random() * 800
    var top = Math.random() * $('html').height();
    leafLarge2.css('rotation',  '0deg')
    if(rtl){
      var left = $('html').width() + 360;
      } else{
        var left = -360;
      };
  TweenMax.to(leafLarge2, 10 + speed, {
    // repeat: -1,
    // yoyo:true,
    ease:Sine.easeInOut,
    left:left,
    top: top,
    rotation: rotation,
    onComplete: function(){
      rtl = (rtl) ? false : true;
      leafFloat2(rtl);
    };
    });
  };

    var leafFloat3 = function(rtl){
    var speed = Math.random() * 5
    var rotation = Math.random() * 800
    var top = Math.random() * $('html').height();
    leafLarge3.css('rotation',  '0deg')
    if(rtl){
      var left = $('html').width() + 360;
      } else{
        var left = -360;
      };
  TweenMax.to(leafLarge3, 10 + speed, {
    // repeat: -1,
    // yoyo:true,
    ease:Sine.easeInOut,
    left:left,
    top: top,
    rotation: rotation,
    onComplete: function(){
      rtl = (rtl) ? false : true;
      leafFloat3(rtl);
    }
    });
  };

  leafFloat1(true);
  leafFloat2(true);
  leafFloat3(true);

  ////////////
  //Tweenstuff
  ////////////

  $('#wrapper').height($('html').height());



  // Flash messages fading
  setTimeout(function() {
    $("#notice-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 4000);

  setTimeout(function() {
    $("#alert-wrapper").fadeOut("slow", function() {
      $(this).remove;
    })
  }, 3000);





  // The function actually applying the offset
  function offsetAnchor() {
    if(location.hash.length !== 0) {
      window.scrollTo(window.scrollX, window.scrollY - 100);
    }
  }

    // This will capture hash changes while on the page
    $(window).on("hashchange", function () {
        offsetAnchor();
    });

    // This is here so that when you enter the page with a hash,
    // it can provide the offset in that case too. Having a timeout
    // seems necessary to allow the browser to jump to the anchor first.
    window.setTimeout(function() {
        offsetAnchor();
    }, 1); // The delay of 1 is arbitrary and may not always work right (although it did in my testing).


    $(".hashlink").on("click", function() {
      $("#main-menu-container").fadeToggle( "fast", "linear" );
      $( "#nav-menu-btn" ).text("Menu");
    });

});

   