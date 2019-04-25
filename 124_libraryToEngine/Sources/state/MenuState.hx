package state;

import raccoon.App;
import raccoon.Raccoon;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.State;
import raccoon.tool.Util;

import Player;
// import PlayerImage;
import Gun;
import Enemy;

class MenuState extends State {
	var player:Player;
	// var playerImage:PlayerImage;
	var gun:Gun;
	var arEnemy:Array<Enemy>;

	public function new(){
		super();
		player = new Player(320, 320);

		// playerImage = new PlayerImage(320, 320);

		gun = new Gun(player.position.x, player.position.y);
		arEnemy = [];
		for (i in 0 ... 30){
			var e = new Enemy(Util.randomRangeFloat(0, Raccoon.WIDTH), Util.randomRangeFloat(0, Raccoon.HEIGHT));
			arEnemy.push(e);
		}
	}

	override public function update(){
		gun.update();
		gun.x = player.position.x + player.width / 2;
		gun.y = player.position.y + player.height / 2;
		player.update();

		// playerImage.update();

		for (enemy in arEnemy){
			enemy.update();
			for (bullet in gun.arBullet.entity){
				if (bullet.overlap(enemy)){
					if (enemy.invincible){
					} else {
						enemy.life -= 1;
						if (enemy.life == 0){
							arEnemy.remove(enemy);
						}
					}
					enemy.invincible = true;
					gun.arBullet.entity.remove(bullet);
				}
			}
		}
	}

	override public function render(canvas:Canvas){
		player.render(canvas);
		// playerImage.render(canvas);

		gun.render(canvas);

		for (enemy in arEnemy){
			enemy.render(canvas);
		}
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
		App.mouseX = x;
		App.mouseY = y;
	}
}