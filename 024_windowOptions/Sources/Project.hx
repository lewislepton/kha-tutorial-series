package;

import kha.Framebuffer;
import kha.Scaler;
import kha.System;
import kha.Image;

import Block;

class Project {
	public var backbuffer:Image;
	public var block:Block;
	
	public function new() {
		backbuffer = Image.createRenderTarget(400, 400);
		block = new Block();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = backbuffer.g2;
		graphics.begin();
		block.render(graphics);
		graphics.end();
		
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
}
