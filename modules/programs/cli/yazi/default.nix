{ ... }: {
  home-manager.sharedModules = [
    (_: {
      programs.yazi = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        shellWrapperName = "y";
        settings = {
          manager = {
            show_hidden = false;
            show_symlink = true;
            sort_dir_first = true;
            linemode = "size"; # or size, permissions, owner, mtime
            ratio = [
              # or 0 3 4
              1
              3
              4
            ];
          };
          preview = {
            # wrap = "yes";
            tab_size = 4;
            image_filter =
              "triangle"; # from fast to slow but high quality: nearest, triangle, catmull-rom, lanczos3
            max_width = 3840; # maybe 1000
            max_height = 2160; # maybe 1000
            image_quality = 90;
          };
        };
        keymap = {
          manager.prepend_keymap = [
            {
              on = "T";
              run = "plugin toggle-pane min-preview";
            }
            {
              on = "T";
              run = "plugin toggle-pane max-preview";
            }
          ];
        };
        flavors = {
          dark = ./flavors/catppuccin-mocha.yazi;
          light = ./flavors/catppuccin-latte.yazi;
        };
        plugins = {
          git = pkgs.git;
          diff = pkgs.diff;
          glow = pkgs.glow;
          mediainfo = pkgs.mediainfo;
          lazygit = pkgs.lazygit;
          full-border = pkgs.full-border;
          yatline-catppuccin = pkgs.yatline-catppuccin;
          toggle-pane = pkgs.toggle-pane;
        };
      };
    })
  ];
}
