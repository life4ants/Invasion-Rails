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
  clicker(88);});

});

var selectedCountry = [];


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
function endTurn() {
  fun(1);
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

//unused:
function hasClass(el, className) {
  if (el.classList)
    return el.classList.contains(className)
  else
    return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
}

function addClass(el, className) {
  if (el.classList)
    el.classList.add(className)
  else if (!hasClass(el, className)) el.className += " " + className
}

function removeClass(el, className) {
  if (el.classList)
    el.classList.remove(className)
  else if (hasClass(el, className)) {
    var reg = new RegExp('(\\s|^)' + className + '(\\s|$)')
    el.className=el.className.replace(reg, ' ')
  }
}