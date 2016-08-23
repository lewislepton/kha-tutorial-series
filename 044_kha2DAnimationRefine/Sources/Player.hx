package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Key;

import kha2d.Animation;
import kha2d.Sprite;

class Player extends Sprite {
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

	public function onKeyDown(key:Key, char:String){
		switch (key){
			case LEFT: left = true;
			case RIGHT: right = true;
		default: return;
		}
	}

	public function onKeyUp(key:Key, char:String){
		switch (key){
			case LEFT: left = false;
			case RIGHT: right = false;
		default: return;
		}
	}
}