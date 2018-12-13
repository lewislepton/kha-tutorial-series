let project = new Project('102_objectEntityRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);