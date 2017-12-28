import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.math.Vector2;
import kha.math.FastMatrix3;

class Player {
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;
	var velocity:Vector2;
	var position:Vector2;
	var speed = 0.3;
	var rotationSpeed = 3.6;
	var rotation:Float;
	var friction = 0.96;

	public function new(x:Float, y:Float){
		velocity = new Vector2(0, 0);
		position = new Vector2(x, y);
	}

	public function update(){
		if (up){
			velocity.x += Math.cos(degToRad(rotation)) * speed;
			velocity.y += Math.sin(degToRad(rotation)) * speed;
		} else {
			velocity.x *= friction;
			velocity.y *= friction;
		}

		if (left){
			rotation -= Math.round(rotationSpeed) * friction;
		} else if (right){
			rotation += Math.round(rotationSpeed) * friction;
		}

		position.x += velocity.x;
		position.y += velocity.y;
	}

	public function render(graphics:Graphics){
		graphics.pushTransformation(FastMatrix3.translation(-32, -32));
		graphics.rotate(degToRad(rotation), position.x, position.y);
		graphics.color = Color.Pink;
		graphics.fillRect(position.x, position.y, 64, 64);
		graphics.popTransformation();
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

	public function degToRad(degrees:Float):Float {
		return degrees * Math.PI / 180;
	}
}