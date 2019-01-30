let project = new Project('115_poolRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);