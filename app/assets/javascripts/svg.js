var onResize = function() {
  // apply dynamic padding at the top of the body according to the fixed navbar height
  $("body").css("padding-top", $(".navbar-fixed-top").height()+10);
};

// attach the function to the window resize event
$(window).resize(onResize);

// call it also when the page is ready after load or reload
$(document).on('ready page:change', function() {
  onResize();

$("#territory88").click(function(){
    clicker(88);
  });

});


var pusher = new Pusher('1df273322935844f45c6', {
  encrypted: true
});

var channel = pusher.subscribe('foo_channel');

channel.bind('hello', function(data) {
  $("#message").html(data.message);
});

var selectedCountry = [];
var odd = false;


function clicker(index)
{
    if (selectedCountry[0]){
      deselect(selectedCountry[0]);
    }
	  selectedCountry[0] = index;
    select(index);
}

function select(country)
{
  var id = ".territory"+country;
  if (country == 87)
    $(id).css("stroke-width", "3");
  else
    $(id).css("stroke-width", "30");
  $("#svg"+country).css("background-color", "#551155");
}

function deselect(country)
{
   var id = ".territory"+country;
  $(id).css("stroke-width", "0");
  $("#svg"+country).css("background-color", "transparent");
}
function endTurn()
{
  if (odd){
    $("#message").html("");
    odd = false;
  }
  else{
    $.ajax("/games/mess");
    odd = true;
  }
}

function turnInCards()
{
  $("#message").html(gamePhase);
}

function fun(n)
{
  if (n == 1)
  {
    select(n);
    setTimeout(function(){ fun(n+1) }, 200);
  }

  else if (n <= 90)
  {
    select(n);
    deselect(n-1);
    setTimeout(function(){ fun(n+1) }, 200);
  }
  else {
    deselect(n-1);
    alert("all done!");
  }
}

function tools()
{
  console.log(user);
  console.log(user.name);
}
