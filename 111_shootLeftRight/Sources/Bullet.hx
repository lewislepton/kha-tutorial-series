import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import lkl.Entity;

class Bullet extends Entity {
	var speeder:Float;

	public function new(x:Float, y:Float, ?right:Bool){
		super(x, y, 16, 16);

		speeder = right ? speed:-speed;
	}

	override public function update(){
		super.update();

		velocity.x = Math.round(speeder);
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Red;
		graphics.fillRect(position.x, position.y, width, height);
	}
}