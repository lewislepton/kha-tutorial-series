let project = new Project('121_tweenRefineLibrary');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('lkl');
resolve(project);