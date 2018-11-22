import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Eye {
	public var x:Float;
	public var y:Float;
	public var size:Float;
	public var angle = 0.0;
	public var active:Bool;

	public function new(?x:Float = 0, ?y:Float = 0, ?size:Float){
		this.x = x;
		this.y = y;
		this.size = randomRangeFloat(32, 98);
		activate(x, y);
	}

	public function update(x:Float, y:Float){
		if (!active) return;
		angle = Math.atan2(y - this.y, x - this.x);
	}

	public function render(graphics:Graphics){
		if (!active) return;
		graphics.pushTranslation(x, y);
		graphics.color = Color.Black;
		graphics.fillCircle(0, 0, size + 8);

		graphics.color = Color.White;
		graphics.fillCircle(0, 0, size);

		graphics.rotate(angle, x, y);
		graphics.color = Color.Black;
		graphics.fillCircle(size / 2, 0, size / 2);

		graphics.color = Color.White;
		graphics.fillCircle(size / 8, 0, size / 3);
		graphics.popTransformation();
	}

	public function activate(?x:Float = 0, ?y:Float = 0){
		active = true;
	}

	public function randomRangeFloat(low:Float, high:Float):Float {
		return Math.floor(Math.random() * (1 + high - low)) + low;
	}
}