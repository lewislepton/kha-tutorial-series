package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.Video;
import kha.capture.VideoCapture;

class Project {
	var video:Video;
	public function new() {
		VideoCapture.init(init, error);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		if (video != null){
			graphics.drawVideo(video, 0, 0, 800, 600);
		}
		graphics.end();
	}

	public function init(video:Video){
		this.video = video;
	}

	public function error(){
		trace('THERES SOMETHING WRONG CAPTAIN!!!');
	}
}
