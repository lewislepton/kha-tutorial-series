var project = new Project('024_windowOptions');
project.addAssets('Assets/**');
project.addSources('Sources');

project.windowOptions.width = 400;
project.windowOptions.height = 400;

return project;
