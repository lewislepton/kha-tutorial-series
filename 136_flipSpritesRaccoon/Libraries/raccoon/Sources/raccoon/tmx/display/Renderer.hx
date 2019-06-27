package raccoon.tmx.display;

import kha.Canvas;
import kha.graphics2.Graphics;

interface Renderer {
	public function setTiledMap(map:TiledMap):Void;
	public function drawLayer(canvas:Canvas, layer:Layer):Void;
	public function drawImageLayer(canvas:Canvas, imageLayer:ImageLayer):Void;
	public function clear(canvas:Canvas):Void;
}