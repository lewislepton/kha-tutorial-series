package raccoon.anim;

/*
Originally coded & created by Robert Konrad
http://robdangero.us
https://github.com/Kha-Samples/Kha2D

Edited for the Kha Tutorial Series by Lewis Lepton
https://lewislepton.com
https://github.com/lewislepton/kha-tutorial-series
*/

import kha.Canvas;
import kha.Color;
import kha.graphics2.Graphics;
import kha.Image;
import kha.Assets;

import raccoon.anim.Animation;
import raccoon.Entity;

class Sprite extends Entity {
	private var _image: Image;
	private var _animation: Animation;
	
	private var _w: Float;
	private var _h: Float;
	
	public function new(imagename: String, x:Float = 0, y:Float = 0, width: Int = 0, height: Int = 0){
		super(x, y, width, height);
		this._image = Reflect.field(Assets.images, imagename);
		_w = width;
		_h = height;
		if (this.width  == 0 && _image != null) this.width  = _image.width;
		if (this.height == 0 && _image != null) this.height = _image.height;
		_animation = Animation.create(0);
	}
	
	public function setAnimation(animation: Animation): Void {
		this._animation.take(animation);
	}
	
	override public function update(): Void {
		super.update();
		_animation.next();
	}
	
	override public function render(canvas: Canvas): Void {
		super.render(canvas);
		if (_image != null) {
			canvas.g2.color = Color.White;
			canvas.g2.drawScaledSubImage(_image, Std.int(_animation.get() * _w) % _image.width, Math.floor(_animation.get() * _w / _image.width) * _h, _w, _h, Math.round(position.x), Math.round(position.y), width, height);
		}
	}
	
	public function set(imagename:String): Void {
		this._image = Reflect.field(Assets.images, imagename);
	}
	
	public function outOfView(): Void {
		
	}
	
	function get_width(): Float {
		return _w;
	}
	
	function set_width(value: Float): Float {
		return _w = value;
	}
	
	function get_height(): Float {
		return _h;
	}
	
	function set_height(value: Float): Float {
		return _h = value;
	}
}
