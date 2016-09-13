package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Blue {
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Blue;
		graphics.fillCircle(256, 256, 128, 128);
	}
}