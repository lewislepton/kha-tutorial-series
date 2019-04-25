import raccoon.App;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Entity;

class Bullet extends Entity {
	public var angle:Float;

	public function new(x:Float, y:Float){
		super(x, y, 16, 16);

		speed = 4.0;

		angle = Math.atan2(App.mouseY - position.y, App.mouseX - position.x);
	}

	override public function update(){
		super.update();

		velocity.x = Math.cos(angle) * speed;
		velocity.y = Math.sin(angle) * speed;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = Color.Red;
		canvas.g2.fillRect(position.x, position.y, width, height);
	}
}