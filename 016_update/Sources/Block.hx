package;

import kha.graphics2.Graphics;

class Block {
	public var x:Int;
	public var y:Int;
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.fillRect(x, y, 64, 64);
	}
}