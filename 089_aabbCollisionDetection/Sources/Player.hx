import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.Entity;

class Player extends Entity {
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;
	public var jump:Bool;
	public var jumpValue = -6;

	public function new(x:Float, y:Float, width:Float, height:Float){
		super(x, y, width, height);

		platformer = true;
	}

	override public function update(){
		super.update();

		if (!platformer){
			if (up){
				velocity.y = -1;
			} else if (down){
				velocity.y = 1;
			} else {
				velocity.y = 0;
			}
		}

		if (left){
			velocity.x = -1;
		} else if (right){
			velocity.x = 1;
		} else {
			velocity.x = 0;
		}

		if (platformer){
			velocity.y += acceleration;
		}
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Pink;
		graphics.fillRect(position.x, position.y, width, height);
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = true;
			case KeyCode.Down: down = true;
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
			case KeyCode.Space: jump = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: up = false;
			case KeyCode.Down: down = false;
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
			case KeyCode.Space: jump = false;
		default: return;
		}
	}
}