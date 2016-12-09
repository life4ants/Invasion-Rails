var selectedCountry = []


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
  var id = "#country"+country;
  if (country == 87)
    $(id).css("stroke-width", "3")
  else
    $(id).css("stroke-width", "30")
}
function deselect(country)
{
   var id = "#country"+country;
  $(id).css("stroke-width", "0")
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