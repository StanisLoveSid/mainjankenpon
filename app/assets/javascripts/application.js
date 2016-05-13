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
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require zclip
//= require jquery_ujs
//= require ckeditor-jquery
//= require turbolinks
//= require_tree .




$(document).ready(function() {
     $("#lead_form").hide();
       $("#lead_form1").hide();
         $("#lead_form2").hide();
           $("#lead_form3").hide();
            $("#lead_form4").hide();
             $("#lead_form5").hide();
              $("#lead_form6").hide();
    setTimeout(function() {
        
        $("#lead_form").fadeIn(1500);

    },3000);

        setTimeout(function() {
        
        $("#lead_form1").fadeIn(1500);

    },8000);

           setTimeout(function() {
        
        $("#lead_form2").fadeIn(1500);

    },11000);

             setTimeout(function() {
        
        $("#lead_form3").fadeIn(1500);

    },14000);

                          setTimeout(function() {
        
        $("#lead_form4").fadeIn(1500);

    },18000);

                            setTimeout(function() {
        
        $("#lead_form5").fadeIn(1500);

    },23000);

                              setTimeout(function() {
        
        $("#lead_form6").fadeIn(1500);

    },30000);                     

});

$('.ckeditor').ckeditor({
  // optional config
});
