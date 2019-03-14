let project = new Project('119_actuateTween');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('actuate');
resolve(project);