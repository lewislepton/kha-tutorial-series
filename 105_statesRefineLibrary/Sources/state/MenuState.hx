package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.State;

class MenuState extends State {
	public function new(){
		super();
	}

	override public function update(){
		
	}

	override public function render(graphics:Graphics){
		graphics.color = Color.Pink;
		graphics.fillRect(320, 320, 128, 128);
	}

	override public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			// case KeyCode.One: State.set('menu');
			case KeyCode.Two: State.set('play');
			case KeyCode.Three: State.set('option');
			case KeyCode.Four: State.set('retry');
		default: return;
		}
	}
}