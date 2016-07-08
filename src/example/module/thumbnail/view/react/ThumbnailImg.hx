package example.module.thumbnail.view.react;
import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import hex.event.Event;
import hex.event.Dispatcher;
import example.module.thumbnail.view.IThumbnailViewListener;
import js.html.ImageElement;
import example.module.thumbnail.view.message.ThumbnailViewMessage;

/**
 * ...
 * @author gtakaro
 */

typedef ThumbnailImgProps = {
	src:String,
	imgClickHandler:Dynamic
}

class ThumbnailImg extends ReactComponentOfProps<ThumbnailImgProps>
{

	public function new(props:ThumbnailImgProps) 
	{
		
		super(props);
	}
	
	override function render() {
        
        return jsx('
            <img src="{this.props.src}" width = "200" onClick=$dispatchImgClick></img>
        ');
    }
	
	function dispatchImgClick(e:Event) {
		props.imgClickHandler(e.target.currentSrc);
	}
}