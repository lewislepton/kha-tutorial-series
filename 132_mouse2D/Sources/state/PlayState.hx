package state;

import kha.Canvas;

import raccoon.Raccoon;
import raccoon.State;

import Block;

class PlayState extends State {
	var _block01:Block;
	var _block02:Block;

	public function new(){
		super();
		sort(true);

		_block01 = new Block();
		_block02 = new Block();

		add(_block01);
		add(_block02);
	}

	override public function update(){
		super.update();
		
		_block01.position.x = Raccoon.mouseX - _block01.width / 2;
		_block01.position.y = Raccoon.BUFFERHEIGHT / 2 - _block01.height / 2;
		_block01.width = Raccoon.mouseY / 2 + 10;
		_block01.height = Raccoon.mouseY / 2 + 10;

		var invX = Raccoon.BUFFERWIDTH - Raccoon.mouseX;
		var invY = Raccoon.BUFFERHEIGHT - Raccoon.mouseY;

		_block02.position.x = invX - _block02.width / 2;
		_block02.position.y = Raccoon.BUFFERHEIGHT / 2 - _block02.height / 2;
		_block02.width = invY / 2 + 10;
		_block02.height = invY / 2 + 10;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
	}
}