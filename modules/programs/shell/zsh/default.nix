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
          ll = "ls -l";
          vi = "nvim";
          ff = "fastfetch -c ~/.config/fastfetch/ff.jsonc";
          reimufetch = "fastfetch -c ~/.config/fastfetch/reimu.jsonc";
          update = "sudo nixos-rebuild switch";
          # update = "sudo nixos-rebuild switch --flake /home/howl/nixos#dix";
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
