let project = new Project('125_blankRaccoonProject');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
resolve(project);