{ ... }: {
  home-manager.sharedModules = [
    (_: {
      home.file.".local/bin".source = ./bin;
      home.file.".local/bin".recursive = true;
      home.file.".local/bin".executable = true;
    })
  ];
}

