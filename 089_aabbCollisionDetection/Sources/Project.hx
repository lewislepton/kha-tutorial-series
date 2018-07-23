package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

import lkl.tool.Util;

import Player;
import Platform;

class Project {
	var player:Player;
	var arPlatform:Array<Platform>;
	var amount = 30;

	public function new(){
		player = new Player(Main.WIDTH / 2, 128, 32, 32);

		setupPlatform();

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		player.update();

		for (platform in arPlatform){
			player.collideRect(platform);
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
		for (platform in arPlatform){
			platform.render(graphics);
		}
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}

	public function setupPlatform(){
		arPlatform = new Array<Platform>();
		for (i in 0 ... amount){
			var platform = arPlatform[i];
			platform = new Platform(Util.randomRangeFloat(0, Main.WIDTH), Util.randomRangeFloat(256, Main.HEIGHT), Util.randomRangeFloat(64, 256), Util.randomRangeFloat(8, 64));
			arPlatform.push(platform);
		}
	}
}
