package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;

import lkl.ui.Text;

import Player;

class Project {
	var player:Player;
	var uiText:Text;

	public function new(){
		player = new Player();
		uiText = new Text('arial', 'hello', 128, 128, 64);

		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		uiText.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.A: uiText.set('abel');
			case KeyCode.B: uiText.set('arial');
			case KeyCode.One: player.set('player01');
			case KeyCode.Two: player.set('player02');
		default: return;
		}
	}
}