package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.System;
import kha.Scaler;
import kha.Image;
import kha.input.Mouse;
import kha.ScreenCanvas;

import Button;

class Project {
	var backbuffer:Image;
	var mouseX:Int = 0;
	var mouseY:Int = 0;
	var btnPressMe:Button;

	public function new(){
		backbuffer = Image.createRenderTarget(Main.WIDTH, Main.HEIGHT);

		btnPressMe = new Button(128, 128, 128, 128, Color.Pink);
		btnPressMe.onClick = clickedButton;

		Mouse.get().notify(onMouseDown, null, onMouseMove, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = backbuffer.g2;
		graphics.begin();
		btnPressMe.render(graphics);
		graphics.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		mouseX = Scaler.transformX(x, y, backbuffer, ScreenCanvas.the, System.screenRotation);
		mouseY = Scaler.transformY(x, y, backbuffer, ScreenCanvas.the, System.screenRotation);
		if (button == 0){
			btnPressMe.onMouseDown(mouseX, mouseY);
		}
	}

	public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		mouseX = Scaler.transformX(x, y, backbuffer, ScreenCanvas.the, System.screenRotation);
		mouseY = Scaler.transformY(x, y, backbuffer, ScreenCanvas.the, System.screenRotation);
	}

	public function clickedButton(){
		trace('BUTTON CLICKED');
	}
}
