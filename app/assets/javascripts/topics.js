$(document).on("turbolinks:load", () => {
  var topicId = $('#topic-id').val();
  var currentUser = $('#current-user').val();
  if(topicId && currentUser){
    subscribe(topicId, currentUser);
  }
  setUserColor();

  $('#message-input').focus();
  $('#message-input').keypress((e) => {
    if (e.keyCode == 13 || e.which == 13){
      sendMessageToCable();
    }
  });

  $('#send-message-button').click(() => {
    sendMessageToCable();
  });

  $('#change-user-color-button').click(() => {
    setUserColor();
  });

  $('.nav-link').click(() => {
    if(App.cable && App.cable.subscriptions.subscriptions.length > 0){
      unsubscribe();
    }
  });

});

$(document).on('unload', () => {
  if(App.cable && App.cable.subscriptions.subscriptions.length > 0){
    unsubscribe();
  }
});



$(document).ready(() => {
  // setUserColor();

  // $('#send-message-button').click(() => {
  //   var message = $('#message-input').val();
  //   var currentUser = JSON.parse($('#current-user').val());

  //   if(message && message.length > 0){
  //     sendMessage(message, currentUser.name, getUserColor());
  //     $('#message-input').val(null);
  //   }
  // });

  // $('#change-user-color-button').click(() => {
  //   setUserColor();
  // });

});

function sendMessageToCable(){
  var message = $('#message-input').val();
  var currentUser = JSON.parse($('#current-user').val());

  if(message && message.length > 0){
    sendMessage(message, currentUser.name, getUserColor());
    $('#message-input').val(null);
  }
}

function setUserColor(){
  $('#user-color-block').css('background-color', randomColor());
}

function getUserColor(){
  return $('#user-color-block').css('background-color'); 
}

function randomColor(){
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}