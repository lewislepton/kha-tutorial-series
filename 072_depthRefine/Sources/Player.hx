import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.Assets;
import kha.input.KeyCode;

class Player {
	public var image:Image;
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;
	public var x:Float;
	public var y:Float;
	var speed = 300;

	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;
		image = Assets.images.player;
	}

	public function update(delta:Float){
		if (left){
			this.x -= Math.round(speed) * delta;
		} else if (right){
			this.x += Math.round(speed) * delta;
		}
		
		if (up){
			this.y -= Math.round(speed) * delta;
		} else if (down){
			this.y += Math.round(speed) * delta;
		}
	}

	public function render(graphics:Graphics){
		graphics.color = Color.White;
		graphics.drawImage(image, x, y);
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