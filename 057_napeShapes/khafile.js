let project = new Project('057_napeShapes');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('nape');
resolve(project);