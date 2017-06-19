package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;

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
		blue.button.onClick = setRedState;
		red = new Red();
		red.button.onClick = setBlueState;

		setBlueState();

		Keyboard.get().notify(onKeyDown, null);
		Mouse.get().notify(onMouseDown, null, null, null);
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

	public function onMouseDown(button:Int, x:Int, y:Int){
		switch (gameState){
			case GameState.Blue:
			if (button == 0) blue.button.onMouseDown(x, y);
			case GameState.Red:
			if (button == 0) red.button.onMouseDown(x, y);
		default: return;
		}
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
