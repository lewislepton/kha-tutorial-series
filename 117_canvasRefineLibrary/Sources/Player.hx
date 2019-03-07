import kha.Canvas;
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

	public function new(x:Float, y:Float){
		super(x, y, 64, 64);
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

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = Color.Pink;
		canvas.g2.fillRect(position.x, position.y, width, height);
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