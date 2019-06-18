package raccoon;

import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Image;

import raccoon.Entity;
import raccoon.tool.Util;

class Texture extends Entity {
  public var image:Image;
  private var _rot:Float = 0;
  
  public function new(image:Image, x:Float, y:Float, ?width:Float, ?height:Float){
    super(x, y, width, height);
    this.image = image;
    if (width > 0){
      this.width = width;
    } else {
      this.width = image.width;
    }
    if (height > 0){
      this.height = height;
    } else {
      this.height = image.height;
    }
  }

  override public function update(){
    super.update();
    if (rotation != 0.0){
      _rot += rotation;
    }
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.pushTranslation(position.x, position.y);
    canvas.g2.rotate(Util.degToRad(_rot), position.x + width / 2, position.y + height / 2);
    canvas.g2.color = Color.White;
    canvas.g2.drawScaledImage(image, 0, 0, width, height);
    canvas.g2.popTransformation();
  }
}