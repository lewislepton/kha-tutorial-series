package raccoon.particle;

import kha.Canvas;
import kha.Color;

import raccoon.Entity;

class Particle extends Entity {
	
	public function new(?x:Float, ?y:Float, ?width:Float, ?height:Float){
		super(x, y, width, height);
	}

	override public function update(){
		super.update();

		velocity.y -= acceleration;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = Color.White;
		canvas.g2.fillRect(position.x, position.y, width, height);
	}
}