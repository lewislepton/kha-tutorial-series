let project = new Project('136_flipSpritesRaccoon');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
resolve(project);