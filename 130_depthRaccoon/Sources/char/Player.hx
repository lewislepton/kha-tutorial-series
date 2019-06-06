package char;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import raccoon.Texture;

class Player extends Texture {
  public var up:Bool;
  public var down:Bool;
  public var left:Bool;
  public var right:Bool;

  public function new(x:Float, y:Float){
    super(Assets.images.player, x, y);
  }

  override public function update(){
    super.update();

    if (left){
      position.x -= Math.round(speed);
    } else if (right){
      position.x += Math.round(speed);
    }
    
    if (up){
      position.y -= Math.round(speed);
    } else if (down){
      position.y += Math.round(speed);
    }
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
  }

  public function onKeyDown(keyCode:KeyCode):Void {
    switch (keyCode){
      case KeyCode.Up: up = true;
      case KeyCode.Down: down = true;
      case KeyCode.Left: left = true;
      case KeyCode.Right: right = true;
    default: return;
    }
  }

  public function onKeyUp(keyCode:KeyCode):Void {
    switch (keyCode){
      case KeyCode.Up: up = false;
      case KeyCode.Down: down = false;
      case KeyCode.Left: left = false;
      case KeyCode.Right: right = false;
    default: return;
    }
  }
}