package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.anim.Animation;
import lkl.anim.Sprite;

class Player extends Sprite {
	public var leftWalk:Animation;
	public var rightWalk:Animation;
	public var leftIdle:Animation;
	public var rightIdle:Animation;

	public var left:Bool;
	public var right:Bool;

	public var rightLook = true;

	public function new(x:Float, y:Float){
		super(Assets.images.playerAnim, x, y, 256, 256);

		leftWalk = Animation.createRange(8, 15, 4);
		rightWalk = Animation.createRange(0, 7, 4);
		leftIdle = Animation.create(8);
		rightIdle = Animation.create(0);

		setAnimation(rightIdle);
	}

	override public function update(){
		super.update();
		if (left){
			setAnimation(leftWalk);
			rightLook = false;
		} else if (right){
			setAnimation(rightWalk);
			rightLook = true;
		} else {
			setAnimation(rightLook ? rightIdle:leftIdle);
		}
	}

	public function onKeyDown(keyCode:KeyCode){
		switch (keyCode){
			case KeyCode.Left: left = true;
			case KeyCode.Right: right = true;
		default: return;
		}
	}
	
	public function onKeyUp(keyCode:KeyCode){
		switch (keyCode){
			case KeyCode.Left: left = false;
			case KeyCode.Right: right = false;
		default: return;
		}
	}
}