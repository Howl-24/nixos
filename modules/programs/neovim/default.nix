{ ... }: {
  home-manager.sharedModules = [
    (_: {
      programs.neovim.enable = true;
      home.file.".config/nvim".source = ./nvim;
    })
  ];
}
