let project = new Project('061_napeShapesMaterial');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('nape');
resolve(project);