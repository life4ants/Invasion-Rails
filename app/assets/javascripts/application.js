// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require cable
//= require resize
//= require shapes
//= require_tree ./channels

function post(data, user)
{
   $.ajax({
      type: "POST",
      url: "/games/mess",
      data: {message: data, user: user},
      dataType: "text"

      });
}

function adsf(message, count, num)
{
  sidebar();
  if (!$("#messages-tab").is(":checked"))
    $("#messages-tab").prop("checked", 'checked')
  var node = document.createElement("li");
  node.id = 'mess'+ num;
  document.getElementById("messages").appendChild(node);

  $("#"+node.id).css({"border": "5px solid red", "padding": "0px",
  "transition": "none"});
  $("#"+node.id).addClass("border-fade animated bounce "+count);
  $("#"+node.id).html(message);
  scrollBottom();

  setTimeout(function(){
  $("#"+node.id).css({"border": "1px solid",
  "padding": "4px",
  "transition": "border 500ms ease-out, padding 500ms ease-out"}) ;
    $("#"+node.id).removeClass("animated bounce "+count);
  }, 4000);
}

function scrollBottom()
{
  $('.sidebar-messages').scrollTop($('.sidebar-messages')[$(".sidebar-messages").length-1].scrollHeight)
}

function sidebar()
{
  var toggled = $("#wrapper").hasClass("toggled");
  if (toggled && !mobile || !toggled && mobile)
    $("#sidebar").click();
}

