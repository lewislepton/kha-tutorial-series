package state;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.State;
import raccoon.tween.Tween;
import raccoon.tween.Ease.Sine;

import Player;

class PlayState extends State {
	var player:Player;
	var playerTween:Tween;

	public function new(){
		super();

		player = new Player(320, 320);

		playerTween = new Tween(player.position.x, 600, 3.0, Sine.easeInOut, function(y, x){
			player.position.x = x;
		}).onComplete(tweenPlayer);
	}

	override public function update(){
		player.update();
		playerTween.update();
	}

	override public function render(canvas:Canvas){
		player.render(canvas);
	}

	public function tweenPlayer(){
		playerTween = new Tween(player.position.x, 320, 3.0, Sine.easeInOut, function(y, x){
			player.position.x = x;
		});
	}
}