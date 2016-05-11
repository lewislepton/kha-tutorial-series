package;

import kha.Framebuffer;
import kha.Key;
import kha.input.Keyboard;
import kha.input.Gamepad;

import Player;

class Project {
	public var player:Player;
	
	public function new() {
		player = new Player();
		Keyboard.get().notify(onKeyDown, onKeyUp);
		Gamepad.get().notify(onGamepadAxis, null);
	}

	public function update():Void {
		if (player.up){
			player.y -= Math.round(player.speed);
		} else if (player.down){
			player.y += Math.round(player.speed);
		}
		
		if (player.left){
			player.x -= Math.round(player.speed);
		} else if (player.right){
			player.x += Math.round(player.speed);
		}
		
		bounds();
	}
	
	public function bounds(){
		if (player.x <= 0){
			player.x = 0;
		}
		if (player.y <= 0){
			player.y = 0;
		}
		
		if (player.x + player.width >= 800){
			player.x = 800 - player.width;
		}
		if (player.y + player.height >= 600){
			player.y = 600 - player.height;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}
	
	public function onKeyDown(key:Key, char:String){
		switch (key){
			case UP: player.up = true;
			case DOWN: player.down = true;
			case LEFT: player.left = true;
			case RIGHT: player.right = true;
		default: return;
		}
	}
	
	public function onKeyUp(key:Key, char:String){
		switch (key){
			case UP: player.up = false;
			case DOWN: player.down = false;
			case LEFT: player.left = false;
			case RIGHT: player.right = false;
		default: return;
		}
	}
	
	public function onGamepadAxis(axis:Int, value:Float){
		if (axis == 0){
			if (value <= -0.5){
				player.left = true;
			} else if (value >= 0.5){
				player.right = true;
			} else {
				player.left = false;
				player.right = false;
			}
		}
		
		if (axis == 1){
			if (value >= 0.5){
				player.up = true;
			} else if (value <= -0.5){
				player.down = true;
			} else {
				player.up = false;
				player.down = false;
			}
		}
	}
}
