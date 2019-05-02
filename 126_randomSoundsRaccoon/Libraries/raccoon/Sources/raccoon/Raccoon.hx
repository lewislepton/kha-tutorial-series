package raccoon;

import kha.Framebuffer;
import kha.Scheduler;
import kha.Assets;
import kha.System;
import kha.Color;
import kha.Image;

class Raccoon {
  static var _app:App;
  public static var WIDTH(default, null):Int = 1280;
  public static var HEIGHT(default, null):Int = 720;

  public static var backbuffer:Image;
  public static var BUFFERWIDTH(default, null):Int = WIDTH;
  public static var BUFFERHEIGHT(default, null):Int = HEIGHT;

  public static var backgroundcolor:Color;
  public static var smooth:Bool;
  static var _fps:Float;
  public static function setup(config:RaccoonConfig){
    if (config.width == null) config.width = WIDTH;
    if (config.height == null) config.height = HEIGHT;
    if (config.bufferwidth == null) config.bufferwidth = WIDTH;
    BUFFERWIDTH = config.bufferwidth;
    if (config.bufferheight == null) config.bufferheight = HEIGHT;
    BUFFERHEIGHT = config.bufferheight;

    if (config.fps == null) config.fps = 60;
    _fps = config.fps;

    if (config.backgroundcolor == null) config.backgroundcolor = Color.Black;
    backgroundcolor = config.backgroundcolor;

    if (config.smooth == null) config.smooth = false;
    smooth = config.smooth;

    System.start({
			title:config.title,
			width:config.width,
			height:config.height
		},
		function(_){
			Assets.loadEverything(function(){
				Scheduler.addTimeTask(update, 0, 1 / _fps);
        _app = Type.createInstance(config.app, []);
				System.notifyOnFrames(function(framebuffer){
				  render(framebuffer[0]);
				});
			});
		});
  }

  static function update(){
    _app.update();
  }

  static function render(framebuffer:Framebuffer){
    _app.render(framebuffer);
  }
}

typedef RaccoonConfig = {
  app:Class<App>,
  ?title:String,
  ?width:Int,
  ?height:Int,
  ?bufferwidth:Int,
  ?bufferheight:Int,
  ?backgroundcolor:Color,
  ?smooth:Bool,
  ?fps:Float
}