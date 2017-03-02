var Territory = React.createClass({
  render: function(){
    return (
      <div className="countrybox" id='territory{props.id}'>
        <div className='icon' id='icon{props.id}'>
          {props.icon}
        </div>
        <div id='label{props.id}' class='T-label'>
          {props.reserves}
        </div>
      </div>
    );
  }
});
