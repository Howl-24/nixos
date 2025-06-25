{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.howl = {
    shell = pkgs.zsh;
  };

  home-manager.sharedModules = [

    (
      { ... }:
      {
        programs.zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;

          oh-my-zsh = {
            enable = true;
            plugins = [
              "git"
              "vi-mode"
              "themes"
            ];
            theme = "random";
          };

          shellAliases = {
            lg = "lazygit";
            ff = "fastfetch -c ~/.config/fastfetch/ff.jsonc";
            reimufetch = "fastfetch -c ~/.config/fastfetch/reimu.jsonc";
            update = "sudo nixos-rebuild switch";
          };

          envExtra = ''
            export PATH="$HOME/.local/bin:$PATH"
          '';

          initContent = ''
            case $- in # check shell options
                *i*) ;; # interactive shell
                  *) return;; # don't do anything
            esac
          '';
        };
      }
    )
  ];
}
