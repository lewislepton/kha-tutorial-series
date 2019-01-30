import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import lkl.Entity;

class Bullet extends Entity {
	public var angle:Float;

	public function new(x:Float, y:Float){
		super(x, y, 16, 16);

		speed = 4.0;

		angle = Math.atan2(Project.mouseY - position.y, Project.mouseX - position.x);
	}

	override public function update(){
		super.update();

		velocity.x = Math.cos(angle) * speed;
		velocity.y = Math.sin(angle) * speed;
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Red;
		graphics.fillRect(position.x, position.y, width, height);
	}
}