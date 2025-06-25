{ inputs, pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      imports = [
        inputs.nixvim.homeModules.nixvim
        ./core
        ./plugins
        ./themes
      ];

      home.packages = with pkgs; [ ];
      programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        clipboard = {
          register = "unnamedplus";
          providers = {
            wl-copy.enable = true;
            xclip.enable = true;
          };
        };
        globals.mapleader = " ";
        extraPackages = with pkgs; [
          # Formatters
          nixfmt-rfc-style
          shfmt
          stylua
          prettierd
        ];
      };
    })
  ];
}
