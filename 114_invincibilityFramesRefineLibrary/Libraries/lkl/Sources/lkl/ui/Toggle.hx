package lkl.ui;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import lkl.Entity;

class Toggle extends Entity {
	public var isOn:Bool;

	public var colorFrame:Color = Color.White;
	public var colorOn:Color = Color.Green;
	public var colorOff:Color = Color.Black;

	public function new(?x:Float = 0, ?y:Float = 0, ?width:Float = 32, ?height:Float = 32){
		super(x, y, width, height);

		isOn = false;
	}

	override public function update(){
		super.update();
	}

	override public function render(graphics:Graphics){
		super.render(graphics);
		if (isOn){
			graphics.color = colorOn;
			graphics.fillRect(position.x, position.y, width, height);
			graphics.color = colorFrame;
			graphics.drawRect(position.x, position.y, width, height);
		} else {
			graphics.color = colorOff;
			graphics.fillRect(position.x, position.y, width, height);
			graphics.color = colorFrame;
			graphics.drawRect(position.x, position.y, width, height);
		}
	}

	public function onToggleDown(x:Int, y:Int){
		if (x >= position.x && x <= position.x + width && y >= position.y && y <= position.y + height){
			isOn = !isOn;
		}
	}
}