package state;

import kha.Canvas;
import kha.input.KeyCode;

import raccoon.State;
import raccoon.audio.Sfx;

class MenuState extends State {
	public function new(){
		super();
	}

	override public function update(){
		
	}

	override public function render(canvas:Canvas){
		
	}

	override public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case Space: Sfx.play('tone3');
			case A: Sfx.random('tone');
		default: return;
		}
	}
}