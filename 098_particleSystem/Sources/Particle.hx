import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.math.Vector2;

class Particle {
	public var position:Vector2;
	public var velocity:Vector2 = new Vector2();
	public var speed = 3.0;
	public var acceleration = 0.3;

	public var active:Bool;
	
	public function new(?x:Float, ?y:Float){
		position = new Vector2(x, y);
		activate(x, y);
	}

	public function update(){
		if (!active) return;
		position.x += velocity.x * speed;
		position.y += velocity.y * speed;
		velocity.y -= acceleration;
	}

	public function render(graphics:Graphics){
		if (!active) return;
		graphics.color = Color.White;
		graphics.fillRect(position.x, position.y, 2, 2);
	}

	public function activate(?x:Float = 0, ?y:Float = 0){
		active = true;
	}
}