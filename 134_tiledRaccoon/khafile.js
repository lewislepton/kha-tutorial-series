let project = new Project('134_tiledRaccoon');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
resolve(project);