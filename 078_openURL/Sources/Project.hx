package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;
import kha.System;

class Project {
	var urlString:String = 'https://lewislepton.com';
	public function new(){
		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Space: System.loadUrl(urlString);
		default: return;
		}
	}
}