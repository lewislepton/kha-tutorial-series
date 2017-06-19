package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.Image;

import Camera;
import Player;

class Project {
	public var player:Player;
	public var camera:Camera;
	public var image:Image;
	public function new() {
		player = new Player();
		camera = new Camera();
		image = Assets.images.grass;
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		if (player.left){
			player.x -= Math.round(10);
		} else if (player.right){
			player.x += Math.round(10);
		}

		if (player.up){
			player.y -= Math.round(10);
		} else if (player.down){
			player.y += Math.round(10);
		}

		if (player.x > 1024 / 2){
			camera.x = player.x - 1024 / 2;
		}
		if (player.y > 768 / 2){
			camera.y = player.y - 768 / 2;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		camera.set(graphics);
		graphics.drawImage(image, 0, 0);
		player.render(graphics);
		camera.unset(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: player.up = true;
			case KeyCode.Down: player.down = true;
			case KeyCode.Left: player.left = true;
			case KeyCode.Right: player.right = true;
		default: return;
		}
	}
	
	public function onKeyUp(keyCode:Int){
		switch (keyCode){
			case KeyCode.Up: player.up = false;
			case KeyCode.Down: player.down = false;
			case KeyCode.Left: player.left = false;
			case KeyCode.Right: player.right = false;
		default: return;
		}
	}
}
