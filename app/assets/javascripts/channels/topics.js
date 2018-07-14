function subscribe(topicId, currentUser){
  App.topics = App.cable.subscriptions.create({channel: "TopicsChannel", topic_id: topicId, current_user: currentUser}, {
    received: function(data) {
      writeToFeed(data);
    }
  });
}

function unsubscribe(){
  App.cable.subscriptions.subscriptions.forEach((s) => {s.unsubscribe();});
}

function sendMessage(message, userName, userColor){
  var messageData = {
    message: message, 
    user_name: userName,
    user_color: userColor,
    topic_id: $('#topic_id').val()
  }
  App.topics.send(messageData);
}

function writeToFeed(message){
  $('#feed').append(messageBuilder(message));
}

function messageBuilder(message_data){
  return `<p class='message'>
            <span class='user-name' style='color:${message_data["user_color"]}'>${message_data["user_name"]}: </span>
            <span class='message-text'>${message_data["message"]}</span>
          </p>`;
}