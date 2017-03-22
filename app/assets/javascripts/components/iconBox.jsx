$(function(){
  document.getElementById('game_player_icon').onchange = function(){
    document.getElementById('icon-preview').innerHTML = insertShape(this.value, 50);
  };
  document.getElementById('player_icon').onchange = function(){
    document.getElementById('icon-preview').innerHTML = insertShape(this.value, 50);
  };
});

function input_selector(i){
  var gpi = document.getElementById('game_player_icon');
  var pi = document.getElementById('player_icon');
  if (pi)
    pi.value = i;
  else if (gpi)
    gpi.value = i;

  document.getElementById('icon-preview').innerHTML = insertShape(i, 50);
}


var IconBox = React.createClass({
  renderSquares: function(x) {
    var output = [];
    for (var i = 0; i<=x; i++){
      output[output.length] =(this.renderSquare(i));
    }
    return output;
  },

  handleClick: function(index){
    window.input_selector(index);
  },

  renderSquare: function(i){
    return (
      <Square value={i} key={i}
      onClick={function(){
        this.handleClick(i)}.bind(this)
      }
      />
    );
  },

  render: function() {
    return (
      <div>
        <strong>Please select an icon:</strong>
        <div className="board">
          {this.renderSquares(99)}
       </div>
     </div>
    );
  }
});
