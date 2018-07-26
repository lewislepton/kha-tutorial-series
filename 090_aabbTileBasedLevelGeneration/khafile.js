let project = new Project('090_aabbTileBasedLevelGeneration');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('lkl');
resolve(project);