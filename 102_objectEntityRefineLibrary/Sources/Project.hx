package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

import Player;
import Level;

class Project {
	var player:Player;
	var level:Level;
	
	public function new(){
		player = new Player(Main.WIDTH / 2, 128, 32, 32);

		level = new Level();

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		player.update();

		for (room in level.arPlatform){
			player.collideRect(room);
			if (player.onGround && player.jump){
				player.velocity.y = player.jumpValue;
				player.onGround = false;
			}
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		level.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}
}
