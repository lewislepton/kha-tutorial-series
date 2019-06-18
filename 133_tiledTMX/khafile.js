let project = new Project('133_tiledTMX');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('raccoon');
project.addLibrary('khatmx');
resolve(project);