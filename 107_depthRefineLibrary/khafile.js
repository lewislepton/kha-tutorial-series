let project = new Project('107_depthRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);