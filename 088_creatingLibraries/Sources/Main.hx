package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static var WIDTH = 1024;
	public static var HEIGHT = 768;
	public static var SPP = 2;

	public static function main(){
		System.init({
			title:'088_creatingLibraries',
			width:WIDTH,
			height:HEIGHT,
			samplesPerPixel:SPP
		}, function(){
			Assets.loadEverything(function(){
				var Project = new Project();
				Scheduler.addTimeTask(Project.update, 0, 1 / 60);
				System.notifyOnRender(Project.render);
			});
		});
	}
}