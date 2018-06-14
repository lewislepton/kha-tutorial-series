package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;

import kha2d.Animation;
import kha2d.Sprite;

class Char extends Sprite {
	public var leftWalk:Animation;
	public var rightWalk:Animation;
	public var idle:Animation;

	public var left:Bool;
	public var right:Bool;

	public function new(){
		super(Assets.images.playerAnim, 256, 256);

		leftWalk = Animation.createRange(8, 15, 4);
		rightWalk = Animation.createRange(0, 7, 4);
		idle = Animation.createRange(16, 19, 8);

		setAnimation(idle);

		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	override public function update(){
		super.update();
		if (left){
			setAnimation(leftWalk);
		} else if (right){
			setAnimation(rightWalk);
		} else {
			setAnimation(idle);
		}
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
		default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch (keyCode){
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
		default: return;
		}
	}
}