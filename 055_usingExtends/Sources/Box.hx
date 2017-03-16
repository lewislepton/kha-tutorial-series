import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Box {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	
	public function new(_x:Float, _y:Float, _width:Float, _height:Float){
		this.x = _x;
		this.y = _y;
		this.width = _width;
		this.height = _height;
	}

	public function update(){
		
	}

	public function render(graphics:Graphics){
		graphics.color = Color.Pink;
		graphics.fillRect(x, y, width, height);
	}
}