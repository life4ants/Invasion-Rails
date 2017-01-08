
// on ready function:
$(function(){
  $("#territory88").click(function(){
    clicker(88);
  });

  populate();
  //gon.watch('reserves', {interval: 500}, refreshReserves);
});

function refreshReserves(data)
{
  gon.reserves = data;
  populate();
}

function terri_owner(index)
{
  var player = gon.owners[index-1];
  var icon = gon.player_icons[player];
  return insertShape(icon);
}
function populate()
{
  for (var i=1; i<91; i++)
  {
    document.getElementById("icon"+i).innerHTML = terri_owner(i);
    document.getElementById("label"+i).innerHTML = gon.troops[i-1];
  }
}
// initialized variables:



var selectedCountry = [];
var odd = false;



// functions:
function clicker(index)
{
  if (gon.user_player.id === gon.owners[index-1])
    {
      incrementReserves(index);
    }
  else {
    alert("that territory does not belong to you!");
  }
  //tool1(index);
  /*
    if (selectedCountry[0]){
      deselect(selectedCountry[0]);
    }
    selectedCountry[0] = index;
    select(index); */
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

function incrementReserves(index)
{
  gon.troops[index-1]++;

  $('#label'+index).html(gon.troops[index-1]);
}

function endTurn()
{
  var data = $("#message-input").val();
    $.ajax({
      type: "POST",
      url: "/games/mess",
      data: {message: data},
      dataType: "text"

      });
}
function tool1(index)
{
  incrementReserves(index);
  game = gon.game;
    $.ajax({
      type: "POST",
      url: "/games/increment_reserves",
      data: {game: game, index: index},
      dataType: "text"
      });
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

