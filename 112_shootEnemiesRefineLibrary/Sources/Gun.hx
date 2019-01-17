import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Bullet;

class Gun {
	public var x:Float;
	public var y:Float;
	public var arBullet:Array<Bullet>;

	public function new(x:Float, y:Float){
		this.x = x;
		this.y = y;

		arBullet = [];
	}

	public function update(){
		for (bullet in arBullet){
			bullet.update();
		}
	}

	public function render(graphics:Graphics){
		for (bullet in arBullet){
			bullet.render(graphics);
		}
	}

	public function onMouseDown(button:Int):Void {
		if (button == 0){
			create(x, y);
		}
	}

	public function create(?x:Float, ?y:Float){
		for (bullet in arBullet){
			if (!bullet.active){
				bullet.activate(x, y);
			}
		}
		arBullet.push(new Bullet(x, y));
	}

	public function delete(?x:Float, ?y:Float){
		var b = arBullet.length;
		while (b --> 0){
			if (arBullet[b].position.x + arBullet[b].width <= 0 || arBullet[b].position.x >= Main.WIDTH || arBullet[b].position.y + arBullet[b].height <= 0 || arBullet[b].position.y >= Main.HEIGHT){
				arBullet.splice(b, 1);
			}
		}
	}
}