{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["vscode"];
  home-manager.sharedModules = [
    (_: {
      programs.vscode = {
        enable = true;
        # mutableExtensionsDir = true; # TODO: test with home-manager
        # package = pkgs.vscodium;
        package = pkgs.vscode;
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons
            # asvetliakov.vscode-neovim
          ];  
        };
      };
    })
  ];
}
