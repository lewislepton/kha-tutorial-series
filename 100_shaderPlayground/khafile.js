let project = new Project('100_shaderPlayground');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
resolve(project);