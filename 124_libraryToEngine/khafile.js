let project = new Project('124_libraryToEngine');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
resolve(project);