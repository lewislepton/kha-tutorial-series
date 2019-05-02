package;

import raccoon.App;
import raccoon.State;

import state.MenuState;
import state.PlayState;
import state.OptionState;
import state.RetryState;

class Project extends App {
	public function new(){
		super();
		State.addState('menu', new MenuState());
		State.addState('play', new PlayState());
		State.addState('option', new OptionState());
		State.addState('retry', new RetryState());
		State.set('menu');
	}
}