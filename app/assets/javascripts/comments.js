// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var main = function() {
    $('.btn').click(function(){
         var post = $('.status-box').val();
         $('<li>').text(post).prependTo('.posts');
         $('.status-box').val('');
         $('.counter').text('140');
         $('.btn').addClass('disabled');
        });
        
    $('.status-box').keyup(function(){
        
        var postlength = $(this).val().length;
        var charactersleft = 140 - postlength;
        $('.counter').text(charactersleft);
        
        if(charactersleft < 0) {
            $('.btn').addClass('disabled');
            }
        else if(charactersleft = 140) {
            $('.btn').removeClass('disabled');
            }  
        else {
            $('.btn').removeClass('disabled'); 
        }
        });
        
            
        
        $('.btn').addClass('disabled');
    };
    
$(document).ready(main);    
    