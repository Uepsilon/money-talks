
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(function() {
  setTimeout(function() { $('.info.message').hide('slow up'); }, 2000);
  $('.dropdown').dropdown();
  $('#send').on('click', function(event){
    event.preventDefault();
    $.ajax({
      type: "POST",
      dataType: 'script',
      url: '/messages',
      data: {
        message: { recipient_id: $('#user').val(),
                    message: $('#message').val(),
                    amount: $('#amount').val()
                 }
      }
    });
  })
})