/**
 * ...
 * @author gtakaro
 */

var ThumbnailImg = React.createClass({
	render: function() {
		return (
			<img src={this.props.src} width = "200" onClick = {this.props.imgClickHandler}></img>
		);
	}
}); 
 
var ThumbnailDiv = React.createClass({
	getInitialState: function() {
		return {images: []}; 
	},
	
	componentDidMount: function() {
		var xx = this;
		this.props.addStateUpdater(function(newImages) {
			xx.setState({ images:newImages });
		});
	},
	
	render: function() {
		var props = this.props;
		var imgNodes = this.state.images.map(function(url) {
		  return (
			<ThumbnailImg src={url} imgClickHandler={props.imgClickHandler}/>
		  );
		});
		
		return (
		  <div>
			{imgNodes}
          </div>
		);
	}
}); 
