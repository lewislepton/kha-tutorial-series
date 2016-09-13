package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Red {
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Red;
		graphics.fillCircle(128, 128, 128, 128);
	}
}