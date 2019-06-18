package state;

import kha.Canvas;
import kha.Canvas;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.State;

import khatmx.TiledMap;
import khatmx.TiledObjectGroup;

import char.Player;
import world.Platform;

class PlayState extends State {
	var _map:TiledMap;

	var _player:Player;
	var _playerGroup:TiledObjectGroup;

	var _platforms:Array<Platform>;
	var _platformGroup:TiledObjectGroup;

	public function new(){
		super();

		_map = TiledMap.fromAssets(Assets.blobs.map_tmx.toString());

		_playerGroup = _map.getObjectGroupByName('player');
		for (player in _playerGroup){
			_player = new Player(player.x, player.y);
		}
		add(_player);

		_platforms = [];
		_platformGroup = _map.getObjectGroupByName('platform');
		for (platform in _platformGroup){
			var platform = new Platform(platform.x, platform.y, platform.width, platform.height);
			_platforms.push(platform);
		}
	}

	override public function update(){
		super.update();

		for (platform in _platforms){
			_player.collideRect(platform);
			if (_player.onGround && _player.jump){
				_player.velocity.y = _player.jumpValue;
				_player.onGround = false;
			}
		}
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		_map.render(canvas);
	}

	override function onKeyDown(keyCode:KeyCode) {
		_player.onKeyDown(keyCode);
	}

	override function onKeyUp(keyCode:KeyCode) {
		_player.onKeyUp(keyCode);
	}
}