let project = new Project('118_shaderObjectRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('lkl');
resolve(project);