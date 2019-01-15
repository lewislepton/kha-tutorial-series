package lkl.anim;

/*
Originally coded & created by Robert Konrad
http://robdangero.us
https://github.com/Kha-Samples/Kha2D

Edited for the Kha Tutorial Series by Lewis Lepton
https://lewislepton.com
https://github.com/lewislepton/kha-tutorial-series
*/

import kha.Color;
import kha.graphics2.Graphics;
import kha.Image;
import kha.Assets;

import lkl.anim.Animation;
import lkl.Entity;

class Sprite extends Entity {
	private var image: Image;
	private var animation: Animation;
	
	var w: Float;
	var h: Float;
	
	public function new(imagename: String, x:Float = 0, y:Float = 0, width: Int = 0, height: Int = 0){
		super(x, y, width, height);
		this.image = Reflect.field(Assets.images, imagename);
		w = width;
		h = height;
		if (this.width  == 0 && image != null) this.width  = image.width;
		if (this.height == 0 && image != null) this.height = image.height;
		animation = Animation.create(0);
	}
	
	public function setAnimation(animation: Animation): Void {
		this.animation.take(animation);
	}
	
	override public function update(): Void {
		super.update();
		animation.next();
	}
	
	override public function render(graphics: Graphics): Void {
		super.render(graphics);
		if (image != null) {
			graphics.color = Color.White;
			graphics.drawScaledSubImage(image, Std.int(animation.get() * w) % image.width, Math.floor(animation.get() * w / image.width) * h, w, h, Math.round(position.x), Math.round(position.y), width, height);
		}
	}
	
	public function set(imagename:String): Void {
		this.image = Reflect.field(Assets.images, imagename);
	}
	
	public function outOfView(): Void {
		
	}
	
	function get_width(): Float {
		return w;
	}
	
	function set_width(value: Float): Float {
		return w = value;
	}
	
	function get_height(): Float {
		return h;
	}
	
	function set_height(value: Float): Float {
		return h = value;
	}
}
