{ config, pkgs, ... }: {
  programs.zsh.enable = true;
  users.users.howl = { shell = pkgs.zsh; };

  home-manager.sharedModules = [

    ({ ... }: {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "random";
        };

        shellAliases = {
          vi = "nvim";
          lg = "lazygit";
          ff = "fastfetch -c ~/.config/fastfetch/ff.jsonc";
          reimufetch = "fastfetch -c ~/.config/fastfetch/reimu.jsonc";
          update = "sudo nixos-rebuild switch";
        };

        initContent = ''
           if uwsm check may-start && uwsm select; then
          	exec uwsm start default
          fi
        '';
      };
    })
  ];
}
