let project = new Project('101_shaderPlaygroundUI');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
project.addLibrary('zui');
resolve(project);