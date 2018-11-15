package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static var WIDTH = 1024;
	public static var HEIGHT = 768;

	public static function main(){
		System.start({
			title:"Project",
			width:WIDTH,
			height:HEIGHT
		},
		function(_){
			Assets.loadEverything(function(){
				var Project = new Project();
				Scheduler.addTimeTask(Project.update, 0, 1 / 60);
				System.notifyOnFrames(function(framebuffer){
				Project.render(framebuffer[0]);
				});
			});
		});
	}
}
