package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static function main() {
		System.init({title:"Project", width:1024, height:768}, function(){
			Assets.loadEverything(function(){
				var Project = new Project();
				Scheduler.addTimeTask(Project.update, 0, 1 / 60);
				System.notifyOnRender(Project.render);
			});
		});
	}
}
