package;

import kha.Framebuffer;
import kha.Assets;
import kha.Video;

class Project {
	public var video:Video;

	public function new() {
		video = Assets.videos.drClaw;
		video.play(true);
		video.isFinished();
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawVideo(video, 0, 0, video.width(), video.height());
		graphics.end();
	}
}
