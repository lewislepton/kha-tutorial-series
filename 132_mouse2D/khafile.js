let project = new Project('132_mouse2D');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
resolve(project);