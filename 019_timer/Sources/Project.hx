package;

import kha.Framebuffer;
import kha.Key;
import kha.input.Keyboard;
import kha.System;

import Block;

class Project {
	public var block01:Block;
	public var block02:Block;
	
	public var startTime:Float;
	
	public var WIDTH = 800;
	public var HEIGHT = 600;
	
	public function new() {
		block01 = new Block(Math.random() * WIDTH, Math.random() * HEIGHT);
		block02 = new Block(Math.random() * WIDTH, Math.random() * HEIGHT);
		
		startTime = System.time;
		
		Keyboard.get().notify(onKeyDown, null);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		var barWidth = 200;
		var timer:Float = System.time - startTime;
		graphics.begin();
		
		graphics.fillRect(60, HEIGHT / 2, barWidth * timer, 32);
		
		if (timer >= 1){
			block01.render(graphics);
		}
		
		if (timer >= 2){
			block02.render(graphics);
		}
		
		if (timer >= 3){
			startTime = System.time;
		}
		
		graphics.end();
	}
	
	public function onKeyDown(key:Key, char:String):Void {
		switch (key){
			case CHAR:
				if (char == ' '){
					startTime = System.time;
				}
		default: return;
		}
	}
}
