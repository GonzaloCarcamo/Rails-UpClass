// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery
//= require ads.js.erb
//= require_tree
$(document).on('turbolinks:load', function() {

$('#tags').children().hide()

$("#ad_category").change(function(){
var select = $('#ad_category')[0].options.selectedIndex
var tag = $(`.${select}`).children()[1].dataset.category


if (select == tag) {
  $('#tags').children().hide()
  $(`.${select}`).show()
}
})

$('#send-comment').click(function(e){
  e.preventDefault()

  var comment = $('#comment').val()
  var user = $('#user').val()
  var ad = $('#p').val()
  var token = $( 'meta[name="csrf-token"]' ).attr( 'content' );
    $.ajaxSetup( {
      beforeSend: function ( xhr ) {
        xhr.setRequestHeader( 'X-CSRF-Token', token );
      }
    });
  $.ajax({
    type: 'POST',
    url: '/comments',
    data: { user_id: user, post: comment, ad_id: ad },
    dataType: 'script'
  })
})

})
