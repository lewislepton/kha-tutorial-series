package;

import kha.graphics2.Graphics;
import kha.Color;

class Block02 {
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		// graphics.color = Color.Pink;
		// graphics.color = Color.fromBytes(255, 150, 100);
		graphics.color = Color.fromFloats(0.5, 0.7, 0.9);
		graphics.fillRect(128, 32, 64, 64);
	}
}