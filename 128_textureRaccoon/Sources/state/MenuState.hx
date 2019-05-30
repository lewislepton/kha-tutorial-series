package state;

import kha.Canvas;
import kha.Assets;

import raccoon.State;
import raccoon.Texture;

class MenuState extends State {
	var texture01:Texture;
	var texture02:Texture;

	public function new(){
		super();

		texture01 = new Texture(Assets.images.player, 300, 300, 256, 128);
		texture02 = new Texture(Assets.images.player, 300, 300, 64, 128);

		texture01.rotation = 0.6;
		texture02.rotation = 0.3;
	}

	override public function update(){
		// if (texture01.overlap(texture02)){
		// 	trace('OVERLAP');
		// }

		texture01.collideRect(texture02);
		texture01.update();
		texture02.update();
	}

	override public function render(canvas:Canvas){
		texture01.render(canvas);
		texture02.render(canvas);
	}

	override function onMouseMove(x:Int, y:Int, cx:Int, cy:Int) {
		texture02.position.x = x;
		texture02.position.y = y;
	}
}