package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Player {
	public var x:Int;
	public var y:Int;
	public var left:Bool;
	public var right:Bool;
	public var up:Bool;
	public var down:Bool;
	public function new(){
		
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.fillRect(x, y, 128, 128);
	}
}