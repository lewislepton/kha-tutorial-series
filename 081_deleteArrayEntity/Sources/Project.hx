package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import Player;

class Project {
	var arPlayer:Array<Player>;

	public function new(){
		arPlayer = [];
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		boxBorderDelete();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.color = Color.White;
		graphics.drawRect(64, 64, 896, 640);

		for (player in arPlayer){
			player.render(graphics);
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			create(x, y);
		} else if (button == 1){
			delete(x, y);
		}
	}

	public function create(?x:Float = 0, ?y:Float = 0){
		for (player in arPlayer){
			if (!player.active){
				player.activate(x, y);
				return;
			}
		}
		arPlayer.push(new Player(Assets.images.player, x, y));
	}

	public function delete(?x:Float = 0, ?y:Float = 0){
		var e = arPlayer.length;
		while (e --> 0){
			if (x >= arPlayer[e].x && x <= arPlayer[e].x + arPlayer[e].width && y >= arPlayer[e].y && y <= arPlayer[e].y + arPlayer[e].height){
				arPlayer.splice(e, 1);
			}
		}
	}

	public function boxBorderDelete(?x:Float, ?y:Float){
		var top = 64;
		var bottom = 704;
		var left = 64;
		var right = 960;

		var e = arPlayer.length;
		while (e --> 0){
			arPlayer[e].update();
			if (arPlayer[e].x + arPlayer[e].width <= left || arPlayer[e].x >= right || arPlayer[e].y + arPlayer[e].height <= top || arPlayer[e].y >= bottom){
				arPlayer.splice(e, 1);
			}
			trace('player amount ' + arPlayer.length);
		}
	}
}
