
// on ready function:
$(function(){
  $("#territory88").click(function(){
    clicker(88);
  });

  populate();
  scrollBottom();
  show_dependent_info()
  //gon.watch('reserves', {interval: 500}, refreshReserves);
});

function terri_owner(index)
{
  var player = gon.territory_data[index].owner;
  var icon = gon.player_icons[player];
  return insertShape(icon);
}
function populate()
{
  for (var i=1; i<91; i++)
  {
    document.getElementById("icon"+i).innerHTML = terri_owner(i);
    document.getElementById("label"+i).innerHTML = gon.territory_data[i].troops;
  }
}

function scrollBottom()
{
  $('.sidebar-messages').scrollTop($('.sidebar-messages')[$(".sidebar-messages").length-1].scrollHeight)
}

function show_dependent_info()
{
  if (isMyTurn)
  {
    set_alerts();
    show_info_box();
    $("#my-turn").html("It's Your Turn!").removeAttr('style');
  }
  else
  {

  }
}

function set_alerts()
{
  if (gon.game.phase == "initialTroops")
  {
    var P = gon.current_player;
    var messages =
    [  gon.user.name + ", it is your turn to disribute initial troops.",
    "You have "+P.reserves+" troops left to distribute.",
    "You may distribute "+P.temp_reserves+" of those now."   ];
    showAlerts(messages);
  }
  else if (gon.game.phase == "")
  {

  }
}

function show_info_box()
{
  if (gon.game.phase === "initialTroops")
    {
        output = "<div id='infoBox'>Territories: " +gon.player_terr_counts[gon.game.turn_index] + "<br>Reserves: " +
         gon.current_player.temp_reserves + "<br>Total Reserves: " + gon.current_player.reserves+"</div>";
    }
    else
    {
        output = "<div id='infoBox'>Territories: " +gon.player_terr_counts[gon.game.turn_index] + "<br>Reserves: " +
         gon.current_player.temp_reserves + "<br>Total Reserves: " + gon.current_player.reserves+ "<br>" + attackLine+"</div>";
    }
    document.getElementById("current-player").innerHTML = output;
}
// initialized variables:
var selectedCountry = [];
var odd = false;
var isMyTurn = gon.user_player.id == gon.current_player.id;
var attackLine = "";
var CTD = {total: 0}; // Changed Territory Data

////////////////////////////////////////////////////////////////////////////////////////////
// functions:
function clicker(index)
{
  if (isMyTurn)
  {
    var _player = gon.user_player.id;
    var _owner = gon.territory_data[index].owner;

    if (gon.game.phase == "initialTroops")
    {
      if (_player == _owner)
      {
        incrementReserves(index);
      }
      else {
      alert("that territory does not belong to you!");
      }
    }
    else if (gon.game.phase == "distributeTroops")
    {

    }
  }
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
  if (gon.game.phase == "initialTroops")
  {
    gon.current_player.temp_reserves--;
    gon.current_player.reserves--;
    gon.territory_data[index].troops++;
    CTD[index] = CTD[index]+1 || 1;
    CTD.total += 1;

    $('#label'+index).html(gon.territory_data[index].troops);
    show_info_box();
    if (gon.current_player.temp_reserves <= 0)
    {
      end_turn();
    }
  }
  else if (gon.game.phase == '')
  {

  }
}

function end_turn()
{
  if (gon.game.phase == "initialTroops")
  {
    isMyTurn = false;
    var object = {game: gon.game.id, player: gon.game.turn_index, data: CTD}
    var json = JSON.stringify(object);
    $.ajax({
      type: "POST",
      url: "/games/refresh",
      data: {this: json},
      dataType: "json",
      success: function(result)
      {
        if (result.success)
        {
          gon.current_player = result.current_player
          $("header").load('/games/'+gon.game.id+'/game_header');
          $("#sidebar-wrapper").load('/games/'+gon.game.id+'/sidebar');
          resize();
        }
        else
        {
          console.log("update troops failed because: "+result.reason);
          alert("something went wrong. please refresh the page.");
        }
      }
    });
  }
}

function reset_territory_data()
{
  //for (var i=0; i<)
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

function showAlerts(messages)
{
  $("#alerts").html('');
  if (!$("collapseThree").hasClass('in'))
        $("#alerts-panel a").click();
  showSidebar();
  loopOverMessages(0, messages);
}
function loopOverMessages(n, messages)
{
  bounceMessage('alerts', 'alert'+n, messages[n], "", 2000);
  if (n < messages.length-1)
    setTimeout(function(){ loopOverMessages(n+1, messages);}, 1500);
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


function showSidebar()
{
  var toggled = $("#wrapper").hasClass("toggled");
  if (toggled && !mobile || !toggled && mobile)
    $("#sidebar").click();
}

function refresh()
{
  $.ajax({
    type: "GET",
    url: "/games/refresh",
    data: {game: gon.game, time: gon.territory_data.update_time},
    dataType: "text",
    success: function(result){
      var data = JSON.parse(result);
      if (data.changed.length > 0)
      {
        gon.territory_data = Object.assign(gon.territory_data, data);
        update_map(gon.territory_data.changed);
      }
    }
  });
}
function update_map(ar)
{
  for (var i=0; i < ar.length; i++)
  {
      document.getElementById("icon"+ar[i]).innerHTML = terri_owner(ar[i]);
      document.getElementById("label"+ar[i]).innerHTML = gon.territory_data[ar[i]].troops;
      select(ar[i]);
  }
  setTimeout(function(){
    for (var i=0; i<ar.length; i++){
      deselect(ar[i]);
    }
  }, 1200);
}

function mess()
{
  $.ajax({
    type: "GET",
    url: "/games/mess",
    success: function(result){
      console.log(result);
      alert(result);
    }
  });
}
