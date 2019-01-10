package state;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import lkl.State;

import Player;
import Gun;

class MenuState extends State {
	var player:Player;
	var gun:Gun;

	public function new(){
		super();
		player = new Player(320, 320);
		gun = new Gun(player.position.x, player.position.y);
	}

	override public function update(){
		gun.update();
		gun.x = player.position.x + player.width / 2;
		gun.y = player.position.y + player.height / 2;
		player.update();
	}

	override public function render(graphics:Graphics){
		player.render(graphics);
		gun.render(graphics);
	}

	override public function onKeyDown(keyCode:KeyCode):Void {
		player.onKeyDown(keyCode);
	}

	override public function onKeyUp(keyCode:KeyCode):Void {
		player.onKeyUp(keyCode);
	}

	override public function onMouseDown(button:Int, x:Int, y:Int):Void {
		gun.onMouseDown(button);
	}

	override public function onMouseMove(x:Int, y:Int, mx:Int, my:Int):Void {
		Project.mouseX = x;
		Project.mouseY = y;
	}
}