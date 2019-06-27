package state;

import kha.Canvas;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.State;

import raccoon.tmx.TiledMap;
import raccoon.tmx.TiledObjectGroup;
import raccoon.tool.Direction;

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

			if (_player.direction == Direction.LEFT && _player.left){
				_player.velocity.y = 0.13;
				if (_player.jump){
					_player.velocity.x += 3.0;
					_player.velocity.y -= 6.0;
				}
			} else if (_player.direction == Direction.RIGHT && _player.right){
				_player.velocity.y = 0.13;
				if (_player.jump){
					_player.velocity.x -= 3.0;
					_player.velocity.y -= 6.0;
				}
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