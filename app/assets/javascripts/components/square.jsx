var Square = React.createClass({
  shape: function(){
    return { __html: window.insertShape(this.props.value)};
  },

  render: function(){
    return (
    <button className="square" onClick={this.props.onClick}>
        <div>
          {this.props.value}
        </div>
        <div dangerouslySetInnerHTML={this.shape()} />
    </button>
    );
  }
});