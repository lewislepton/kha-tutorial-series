let project = new Project('112_shootEnemiesRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);