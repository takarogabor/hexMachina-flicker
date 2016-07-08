package example.module.thumbnail.view.react;
import api.react.ReactComponent;
import api.react.ReactMacro.jsx;


/**
 * ...
 * @author gtakaro
 */
typedef ThumbnailDivProps = {
	addStateUpdater:Dynamic,
	imgClickHandler:Dynamic
}
typedef ThumbnailDivState = {
	images:Array<String>
}
class ThumbnailDiv extends ReactComponentOfPropsAndState<ThumbnailDivProps, ThumbnailDivState>
{

	var items : Array<String>;
	
	public function new(props:ThumbnailDivProps) 
	{
		super(props);
		items = [];
		this.state = {images: items};
		props.addStateUpdater(function(newImages:Array<String>) {
			setState({ images:newImages });
		});
	}
	
	override function render() {
        
		return jsx('
            <div>
				${createChildren()}
            </div>
        ');
    }
	
	function createChildren() 
	{
		return [for (entry in state.images) jsx('<ThumbnailImg src={entry} imgClickHandler={props.imgClickHandler}/>')];
	}
	
}