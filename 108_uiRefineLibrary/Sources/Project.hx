package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.input.Mouse;

import lkl.ui.Button;
import lkl.ui.Toggle;
import lkl.ui.Text;

class Project {
	var uiButton:Button;
	var uiToggle:Toggle;
	var uiText:Text;

	public function new(){
		uiButton = new Button(320, 320, 32, 32);
		uiToggle = new Toggle(640, 320, 128, 128);
		uiText = new Text(Assets.fonts.arial, 'hello', 460, 240, 64);

		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		uiButton.render(graphics);
		uiToggle.render(graphics);
		uiText.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (button == 0){
			uiButton.onButtonDown(x, y);
			uiToggle.onToggleDown(x, y);
		}
	}
}