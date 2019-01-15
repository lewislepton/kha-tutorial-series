package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.State;

import Player;

class MenuState extends State {
	var player:Player;

	public function new(){
		super();
		player = new Player(320, 320);
	}

	override public function update(){
		player.update();
	}

	override public function render(graphics:Graphics){
		player.render(graphics);
	}

	override public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	override public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}
}