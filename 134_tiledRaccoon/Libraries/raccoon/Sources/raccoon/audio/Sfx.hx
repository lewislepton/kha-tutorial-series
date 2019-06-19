package raccoon.audio;

import kha.Assets;
import kha.audio1.Audio;

import raccoon.tool.Util;

class Sfx {
  public static function play(name:String, ?volume:Float = 0.3){
    var sound = Audio.play(Reflect.field(Assets.sounds, name), false);
    sound.volume = volume;
  }

  public static function random(name:String, ?amount:Int = 3, ?volume:Float = 0.3){
    var choiceSound:Int = Util.randomInt(amount);
    for (i in 0 ... amount){
      if (choiceSound == i){
        var sound = Audio.play(Reflect.field(Assets.sounds, name + i), false);
        sound.volume = volume;    
      }
    }
  }
}