import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Box;

class Player extends Box {
	public function new(?x:Float = 0, ?y:Float = 0, ?width:Float = 64, ?height:Float = 64){
		super(x, y, width, height);
	}

	override public function update(){
		
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
	}
}