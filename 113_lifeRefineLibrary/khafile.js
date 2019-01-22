let project = new Project('113_lifeRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);