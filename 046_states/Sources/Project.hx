package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.Key;
import kha.input.Keyboard;

import state.Blue;
import state.Red;

enum GameState {
	Blue;
	Red;
}

class Project {
	public var red:Red;
	public var blue:Blue;
	public var gameState:GameState;

	public function new() {
		blue = new Blue();
		red = new Red();

		setBlueState();

		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		switch (gameState){
			case GameState.Blue:
			blue.render(graphics);
			case GameState.Red:
			red.render(graphics);
		default: return;
		}
		graphics.end();
	}

	public function onKeyDown(keyCode:Int){
		switch (keyCode){
			case KeyCode.B: setBlueState();
			case KeyCode.R: setRedState();
		default: return;
		}
	}

	public function setRedState(){
		gameState = GameState.Red;
	}

	public function setBlueState(){
		gameState = GameState.Blue;
	}
}
