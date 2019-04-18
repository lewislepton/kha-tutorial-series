import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Bullet;

import raccoon.tool.Pool;

class Gun {
	public var x:Float;
	public var y:Float;
	public var arBullet:Pool<Bullet>;

	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;

		arBullet = new Pool<Bullet>(3);
	}

	public function update(){
		arBullet.update();
	}

	public function render(canvas:Canvas){
		arBullet.render(canvas);
	}

	public function onMouseDown(button:Int):Void {
		if (button == 0){
			create(x, y);
		}
	}

	public function create(?x:Float, ?y:Float){
		var bullet = new Bullet(x, y);
		arBullet.add(bullet);
	}
}