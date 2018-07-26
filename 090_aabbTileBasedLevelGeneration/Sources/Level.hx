import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import Platform;

class Level {
	public var map:Array<Array<Int>>;
	public var arPlatform:Array<Platform>;
	public var tileSize = 64;

	public function new(){
		map = [
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
			[1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
			[1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1],
			[1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1],
			[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
			[1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1],
			[1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1],
			[1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1],
			[1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
		];

		setupPlatforms();
	}

	public function render(graphics:Graphics){
		for (platforms in arPlatform){
			platforms.render(graphics);
		}
	}

	public function setupPlatforms(){
		arPlatform = new Array<Platform>();
		for (row in 0 ... map.length){
			for (col in 0 ... map[row].length){
				if (map[row][col] == 1){
					var platform = new Platform(col * tileSize, row * tileSize, tileSize, tileSize);
					arPlatform.push(platform);
				}
			}
		}
	}
}