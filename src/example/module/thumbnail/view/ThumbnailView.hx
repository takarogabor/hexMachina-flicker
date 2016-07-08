package example.module.thumbnail.view;
import api.react.ReactComponent;
import hex.event.Dispatcher;
import hex.event.Event;
import hex.event.MessageType;
import hex.log.Logger;
import js.html.DivElement;
import js.Browser;
import js.html.Image;
import example.module.thumbnail.view.message.ThumbnailViewMessage;
import js.html.InputElement;
import js.html.MouseEvent;
import js.html.KeyboardEvent;
import api.react.ReactDOM;
import api.react.ReactMacro.jsx;

import example.module.thumbnail.view.react.ThumbnailDiv;

/**
 * ...
 * @author gtakaro
 */
class ThumbnailView implements IThumbnailView
{

	var dispatcher:Dispatcher<IThumbnailViewListener>;
	
	var stateUpdaters : Array<Dynamic>;
		
	public function new() 
	{
		this.dispatcher = new Dispatcher();
		this.stateUpdaters = new Array<Dynamic>();
		
		ReactDOM.render(jsx('<ThumbnailDiv addStateUpdater=$addStateUpdater imgClickHandler=$imgClickHandler/>'), 
				Browser.document.getElementById('thumbnailBar'));
		
	}
	
	public function addStateUpdater(func : Dynamic) : Void
	{
		stateUpdaters.push(func);
	}
	
	public function setImages(urls:Array<String>) : Void
	{
		Logger.DEBUG( "ThumbnailModule setImages urls:" + urls );
		for (f in this.stateUpdaters) {
			f(urls);
		}
		this.dispatcher.dispatch( ThumbnailViewMessage.THUMBNAIL_CLICK, [urls[0]]);
	}
	
	
	public function imgClickHandler(url:String):Void 
	{
		this.dispatcher.dispatch( ThumbnailViewMessage.THUMBNAIL_CLICK, [url]);
	}
	
	public function addHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool 
	{
		return this.dispatcher.addHandler( messageType, scope, callback );
	}
	
	public function removeHandler(messageType:MessageType, scope:Dynamic, callback:Dynamic):Bool 
	{
		return this.dispatcher.removeHandler( messageType, scope, callback );
	}
	
	@:isVar public var visible(get, set):Bool;
	
	function get_visible():Bool 
	{
		return visible;
	}
	
	function set_visible(value:Bool):Bool 
	{
		return visible = value;
	}
	
}