import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;
import kha.input.KeyCode;

import lkl.anim.Sprite;

class Player extends Sprite {
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;

	public function new(x:Float, y:Float){
		super(Assets.images.player, x, y, 64, 64);
	}

	override public function update(){
		super.update();
		if (left){
			this.position.x -= Math.round(speed);
		} else if (right){
			this.position.x += Math.round(speed);
		}
		
		if (up){
			this.position.y -= Math.round(speed);
		} else if (down){
			this.position.y += Math.round(speed);
		}
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = true;
			case KeyCode.Down: down = true;
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = false;
			case KeyCode.Down: down = false;
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
		default: return;
		}
	}
}