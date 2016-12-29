$(function() {
  var pusher = new Pusher('1df273322935844f45c6', {
    encrypted: true
  });

  var notifications = pusher.subscribe('notifications');

  notifications.bind('all', function(data) {
    $("#message").html(data.message);
  });

  notifications.bind('user'+gon.user.id, function(data) {
    alert(data.message);
  });
  //notifications.bind('player'+gon.player.id, function(data) {
   // $("#message").html(data.message);
  // alert(data.message);
 // });

});