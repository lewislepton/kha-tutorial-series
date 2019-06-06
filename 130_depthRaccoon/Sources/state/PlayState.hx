package state;

import kha.Canvas;
import kha.input.KeyCode;

import raccoon.State;
import char.Player;
import char.Crate;

class PlayState extends State {
	var _player:Player;
	var _crate:Crate;

	public function new(){
		super();

		sort(true);

		_player = new Player(300, 300);
		_crate = new Crate(500, 300);

		add(_player);
		add(_crate);
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
	}

	override function onKeyDown(keyCode:KeyCode) {
		_player.onKeyDown(keyCode);
	}

	override function onKeyUp(keyCode:KeyCode) {
		_player.onKeyUp(keyCode);
	}
}