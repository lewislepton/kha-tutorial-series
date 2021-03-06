package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

import Player;

class Project {
	var player01:Player;
	var player02:Player;
	var player03:Player;
	var arSorter:Array<Player>;
	
	public function new() {
		player01 = new Player(300, 300);
		player02 = new Player(400, 400);
		player03 = new Player(200, 200);

		arSorter = new Array<Player>();
		arSorter.push(player01);
		arSorter.push(player02);
		arSorter.push(player03);

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		arSorter.sort(depth);
		player01.update(1 / 60);
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... arSorter.length){
			arSorter[i].render(graphics);
		}
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		player01.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		player01.onKeyUp(keyCode);
	}

	public function depth(a:Player, b:Player):Int {
		if (a.y == b.y) return 0;
		if (a.y > b.y) return 1;
		return - 1;
	}
}
