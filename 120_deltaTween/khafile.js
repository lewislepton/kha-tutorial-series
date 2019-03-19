let project = new Project('120_deltaTween');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('delta');
resolve(project);