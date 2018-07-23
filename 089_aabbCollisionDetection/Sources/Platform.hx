import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import lkl.Entity;

class Platform extends Entity {
	public function new(x:Float, y:Float, width:Float, height:Float){
		super(x, y, width, height);
	}

	override public function update(){
		super.update();
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		graphics.color = Color.Green;
		graphics.fillRect(position.x, position.y, width, height);
	}
}