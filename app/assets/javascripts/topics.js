$(document).on("turbolinks:load", function(){
  subscribe();
});

$(document).on('unload', () => {
  if(App.cable && App.cable.subscriptions.subscriptions.length > 0){
    unsubscribe();
  }
})