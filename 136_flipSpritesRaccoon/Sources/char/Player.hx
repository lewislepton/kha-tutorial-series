package char;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.anim.Sprite;

class Player extends Sprite {
  public var left:Bool;
  public var right:Bool;
  
  public var jump:Bool;
  public var jumpValue = -10.3;

  public function new(x:Float, y:Float){
    super('player', x, y, 96, 128);
  }

  override public function update(){
    super.update();

    if (left){
      position.x -= Math.round(speed);
      flip.x = true;
    } else if (right){
      position.x += Math.round(speed);
      flip.x = false;
    }

    velocity.y += acceleration;
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }

  public function onKeyDown(keyCode:KeyCode):Void {
    switch (keyCode){
      case KeyCode.Left: left = true;
      case KeyCode.Right: right = true;
      case KeyCode.Space: jump = true;
    default: return;
    }
  }

  public function onKeyUp(keyCode:KeyCode):Void {
    switch (keyCode){
      case KeyCode.Left: left = false;
      case KeyCode.Right: right = false;
      case KeyCode.Space: jump = false;
    default: return;
    }
  }
}