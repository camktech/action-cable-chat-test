function subscribe(){
  console.log('createStream')
  var topicId = $('#topic_id').val();
  if(topicId){
    App.topics = App.cable.subscriptions.create({channel: "TopicsChannel", topic_id: topicId}, {
      connected: function() {
        // Called when the subscription is ready for use on the server
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
      },

      received: function(data) {
        // Called when there's incoming data on the websocket for this channel
      }
    });
  }
  else if(App.cable && App.cable.subscriptions.subscriptions.length > 0){
    unsubscribe();
  }
}

function unsubscribe(){
  App.cable.subscriptions.subscriptions.forEach((s)=>{s.unsubscribe()});
}