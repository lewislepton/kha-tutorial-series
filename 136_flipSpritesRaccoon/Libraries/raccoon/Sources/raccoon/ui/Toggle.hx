package raccoon.ui;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import raccoon.Entity;

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

	override public function render(canvas:Canvas){
		super.render(canvas);
		if (isOn){
			canvas.g2.color = colorOn;
			canvas.g2.fillRect(position.x, position.y, width, height);
			canvas.g2.color = colorFrame;
			canvas.g2.drawRect(position.x, position.y, width, height);
		} else {
			canvas.g2.color = colorOff;
			canvas.g2.fillRect(position.x, position.y, width, height);
			canvas.g2.color = colorFrame;
			canvas.g2.drawRect(position.x, position.y, width, height);
		}
	}

	public function onToggleDown(x:Int, y:Int){
		if (x >= position.x && x <= position.x + width && y >= position.y && y <= position.y + height){
			isOn = !isOn;
		}
	}
}