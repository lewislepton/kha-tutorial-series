package raccoon;

import kha.Canvas;
import kha.graphics2.ImageScaleQuality;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.input.Gamepad;
import kha.input.Surface;
import kha.Image;
import kha.System;
import kha.Scaler;
import kha.ScreenCanvas;

import raccoon.State;

class App {
  private var _imageQuality:ImageScaleQuality;

	public function new(){
		Raccoon.backbuffer = Image.createRenderTarget(Raccoon.BUFFERWIDTH, Raccoon.BUFFERHEIGHT);

    _imageQuality = Raccoon.smooth ? ImageScaleQuality.High:ImageScaleQuality.Low;

		State.setup();

		Keyboard.get().notify(onKeyDown, onKeyUp);
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
		Gamepad.get().notify(onGamepadAxis, onGamepadButton);
		Surface.get().notify(onTouchDown, onTouchUp, onTouchMove);
	}

	public function update():Void {
		if (State.activeState != null){
			State.activeState.update();
		}
	}

	public function render(canvas:Canvas):Void {
		Raccoon.backbuffer.g2.begin();
    canvas.g2.color = Raccoon.backgroundcolor;
    canvas.g2.fillRect(0, 0, Raccoon.backbuffer.width, Raccoon.backbuffer.height);
		if (State.activeState != null){
			State.activeState.render(Raccoon.backbuffer);
		}
		Raccoon.backbuffer.g2.end();

		canvas.g2.begin();
    canvas.g2.imageScaleQuality = _imageQuality;
		Scaler.scale(Raccoon.backbuffer, canvas, System.screenRotation);
		canvas.g2.end();
  }

	public function onKeyDown(keyCode:KeyCode):Void {
		if (State.activeState != null){
			State.activeState.onKeyDown(keyCode);
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		if (State.activeState != null){
			State.activeState.onKeyUp(keyCode);
		}
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		Raccoon.mouseX = Scaler.transformX(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		Raccoon.mouseY = Scaler.transformY(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseDown(button, Raccoon.mouseX, Raccoon.mouseY);
		}
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		Raccoon.mouseX = Scaler.transformX(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		Raccoon.mouseY = Scaler.transformY(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseUp(button, Raccoon.mouseX, Raccoon.mouseY);
		}
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int):Void {
		Raccoon.mouseX = Scaler.transformX(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		Raccoon.mouseY = Scaler.transformY(x, y, Raccoon.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseMove(Raccoon.mouseX, Raccoon.mouseY, cx, cy);
		}
	}

	public function onTouchDown(id:Int, x:Int, y:Int):Void {
		if (State.activeState != null){
			State.activeState.onTouchDown(id, x, y);
		}
	}

	public function onTouchUp(id:Int, x:Int, y:Int):Void {
		if (State.activeState != null){
			State.activeState.onTouchUp(id, x, y);
		}
	}

	public function onTouchMove(id:Int, x:Int, y:Int):Void {
		if (State.activeState != null){
			State.activeState.onTouchMove(id, x, y);
		}
	}

	public function onGamepadAxis(axis:Int, value:Float):Void {
		if (State.activeState != null){
			State.activeState.onGamepadAxis(axis, value);
		}
	}

	public function onGamepadButton(button:Int, value:Float):Void {
		if (State.activeState != null){
			State.activeState.onGamepadButton(button, value);
		}
	}
}