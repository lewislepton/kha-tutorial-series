package lkl.particle;

import kha.graphics2.Graphics;
import kha.Color;

import lkl.Entity;

class Particle extends Entity {
	
	public function new(?x:Float, ?y:Float, ?width:Float, ?height:Float){
		super(x, y, width, height);
	}

	override public function update(){
		super.update();

		velocity.y -= acceleration;
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.White;
		graphics.fillRect(position.x, position.y, width, height);
	}
}