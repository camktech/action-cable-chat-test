// dynamically create subscription and events based on room id/name
// handle different streams in the Channel class
$(document).ready(() => {
  var topicId = $('#topic-container').data('topic-id');
  if(topicId > 0){
    // createSubscription(topicId);
  }


  $('#chit').click((e) => {
    App.chat_room.send({message: 'asdasd'})
    console.log('asd')
  });
})
var topicId = $('#topic-container').data('topic-id');
// function createSubscription(topicId){
  // App.chat_room = App.cable.subscriptions.create(
  //   {channel: "ChatRoomChannel", room_id: topicId},
  //   {
  //     connected: () => {

  //     },
  //     received: (data) => {
  //       console.log(data);
  //     }
  //   }
  // )

  App.chat_room = App.cable.subscriptions.create({channel: "ChatRoomChannel", room_id: "asasas"}, {
  connected() {},
    // Called when the subscription is ready for use on the server

  disconnected() {},
    // Called when the subscription has been terminated by the server

  received(data) {
    return console.log(data);
  },

  speak(data) {
    return this.perform('speak', data);
  }
}
);
  
  console.log(App)
// }
