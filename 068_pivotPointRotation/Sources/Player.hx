import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.math.FastMatrix3;

class Player {
	public var x:Float;
	public var y:Float;
	public var size = 128;
	var rotate:Float;
	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;
	}

	public function update(){
		rotate += 0.06;
	}

	public function render(graphics:Graphics){
		graphics.pushTransformation(FastMatrix3.translation(32, 32));
		graphics.rotate(rotate, x, y);
		graphics.color = Color.Pink;
		graphics.fillRect(x, y, size, size);
		graphics.popTransformation();
	}
}