package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

import Player;
import Follower;

class Project {
	var player01:Player;
	var player02:Player;
	var follower:Follower;

	public function new(){
		player01 = new Player(256, 128, 32);
		player02 = new Player(256, 512, 32);
		follower = new Follower();
		follower.range = 320;

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		player01.update();
		player02.update();
		follower.update(player01, player02);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player01.render(graphics);
		player02.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: player01.up = true;
			case KeyCode.Down: player01.down = true;
			case KeyCode.Left: player01.left = true;
			case KeyCode.Right: player01.right = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Up: player01.up = false;
			case KeyCode.Down: player01.down = false;
			case KeyCode.Left: player01.left = false;
			case KeyCode.Right: player01.right = false;
		default: return;
		}
	}
}
