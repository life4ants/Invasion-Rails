//= require channels/game


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

function show_dependent_info(messages)
{
  if (isMyTurn)
  {
    console.log("reserves are: "+gon.user_player.reserves);
    console.log("temp reserves are: "+gon.user_player.temp_reserves);
    show_info_box();
    $("#my-turn").html("It's Your Turn!").removeAttr('style');
    alert(gon.user.name+", it is your turn.");
    set_alerts(messages);
  }
  else
  {
    $("#alerts").html('');
    $("#my-turn").html("").css('border', 'none');
    show_info_box();
  }
}

function set_alerts(messages)
{
  if (gon.game.phase == "initialTroops")
  {
    var P = gon.user_player;
    var messages =
    [  gon.user.name + ", it is your turn to disribute initial troops.",
    "You have "+P.reserves+" troops left to distribute.",
    "You may distribute "+P.temp_reserves+" of those now."   ];
    showAlerts(messages);
  }
  else if (gon.game.phase == "addTroops")
  {
    showAlerts(messages);
  }
}

function show_info_box()
{
  if (isMyTurn)
  {
    if (gon.game.phase === "initialTroops")
    {
      output = "<div id='infoBox'>Territories: " +gon.player_terr_counts[gon.game.turn_index-1] + "<br>Reserves: " +
      gon.user_player.temp_reserves + "<br>Total Reserves: " + gon.user_player.reserves+"</div>";
    }
    else
    {
      output = "<div id='infoBox'>Territories: " +gon.player_terr_counts[gon.game.turn_index] + "<br>Reserves: " +
      gon.user_player.temp_reserves + "<br>Total Reserves: " + gon.user_player.reserves+ "<br>" + attackLine+"</div>";
    }
    $("#current-player").html(output);
  }
  else
  {
    icon = gon.player_icons[gon.current_player.id];
    output = "<li>Current Player ("+gon.game.turn_index+" of "+gon.game.num_of_players+")<h4>"+insertShape(icon)+
             gon.current_player.name+"</h4></li>";
    $("#current-player").html(output);
  }
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
    gon.user_player.temp_reserves--;
    gon.user_player.reserves--;
    gon.territory_data[index].troops++;
    CTD[index] = CTD[index]+1 || 1;
    CTD.total += 1;

    $('#label'+index).html(gon.territory_data[index].troops);
    show_info_box();
    if (gon.user_player.temp_reserves <= 0)
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
    var json = JSON.stringify({game: gon.game.id, player: gon.game.turn_index, data: CTD});
    $.ajax({
      type: "POST",
      url: "/games/refresh",
      data: {this: json},
      dataType: "json",
      success: function(result)
      {
        if (result.success)
        {
          CTD = {total: 0}
          alert("Your turn is over.");
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
    if (!$("#collapseThree").hasClass('in'))
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

function update_gon()
{
  $.ajax({
    type: "GET",
    url: "/games/refresh",
    data: {game: gon.game.id},
    dataType: "text",
    success: function(result){
      console.log('gon update received');
      gon = JSON.parse(result);
      console.log('gon was updated');
      console.log('reserves: '+gon.user_player.reserves+", temp_reserves: "+gon.user_player.temp_reserves);
    }
  });
}
function update_map(obj)
{
  for (var key in obj)
  {
    gon.territory_data[key].troops += obj[key];
    document.getElementById("icon"+key).innerHTML = terri_owner(key);
    document.getElementById("label"+key).innerHTML = gon.territory_data[key].troops;
    select(key);
  }
  setTimeout(function(){
    for (var key in obj){
      deselect(key);
    }
  }, 2000);
}

function mess()
{
  var json = JSON.stringify({game: gon.game.id, data: CTD});
  $.ajax({
    type: "GET",
    url: "/games/mess",
    data: {this: json}
  });
}