package;

import raccoon.App;
import raccoon.State;

import state.MenuState;
import state.PlayState;

class Project extends App {
	public function new(){
		super();
		State.addState('menu', new MenuState());
		State.addState('play', new PlayState());
		State.set('play');
	}
}