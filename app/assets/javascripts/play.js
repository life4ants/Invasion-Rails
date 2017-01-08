
// on ready function:
$(function(){
  $("#territory88").click(function(){
    clicker(88);
  });

  populate();
  scrollBottom();
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

function showMessage(message)
{
  var full_message = "<strong>"+message.sender+"</strong>"+" says:"+"<br>"+message.content;
  showSidebar();
  if (!$("collapseTwo").hasClass('in'))
        $("#messages-panel a").click();
  bounceMessage('messages', 'mess'+message.id, full_message, 'times3', 3500);
}

function showInfos(messages)
{
  $("#alerts").html('');
  if (!$("collapseThree").hasClass('in'))
        $("#alerts-panel a").click();
  showSidebar();
  loopOverMessages(0, messages);
}
function loopOverMessages(n, messages)
{
  bounceMessage('alerts', 'alert'+n, messages[n], "", 1500);
  if (n < messages.length-1)
    setTimeout(function(){ loopOverMessages(n+1, messages);}, 1000);
}

function bounceMessage(type, id, full_message, count, delay)
{
  var node = document.createElement("li");
  node.id = id;
  document.getElementById(type).appendChild(node);

  $("#"+node.id).css({"border": "5px solid red", "padding": "0px",
  "transition": "none"});
  $("#"+node.id).addClass("border-fade animated bounce "+count);
  $("#"+node.id).html(full_message);
  scrollBottom();

  setTimeout(function(){
  $("#"+node.id).css({"border": "1px solid",
  "padding": "4px",
  "transition": "border 500ms ease-out, padding 500ms ease-out"}) ;
    $("#"+node.id).removeClass("animated bounce"+count);
  }, delay);
}

function scrollBottom()
{
  $('.sidebar-messages').scrollTop($('.sidebar-messages')[$(".sidebar-messages").length-1].scrollHeight)
}

function showSidebar()
{
  var toggled = $("#wrapper").hasClass("toggled");
  if (toggled && !mobile || !toggled && mobile)
    $("#sidebar").click();
}

