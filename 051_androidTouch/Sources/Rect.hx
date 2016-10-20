package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Rect {
	public var x:Int;
	public var y:Int;
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.fillRect(x, y, 128, 128);
	}
}