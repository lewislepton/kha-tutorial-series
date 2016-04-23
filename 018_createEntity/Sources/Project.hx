package;

import kha.Framebuffer;
import kha.input.Mouse;

import Block;

class Project {
	public var arBlock:Array<Block>;
	
	public function new() {
		arBlock = new Array<Block>();
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... arBlock.length){
			arBlock[i].render(graphics);
		}
		graphics.end();
	}
	
	public function onMouseDown(button:Int, x:Int,y:Int):Void {
		if (button == 0){
			for (i in 0 ... arBlock.length){
				if (!arBlock[i].isActive){
					arBlock[i].activate(x, y);
					return;
				}
			}
			arBlock.push(new Block(x, y));
			trace(arBlock.length);
		}
		
		if (button == 1){
			arBlock.pop();
			trace(arBlock.length);
		}
	}
}
