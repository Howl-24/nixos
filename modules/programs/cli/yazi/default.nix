{ pkgs, ... }: {
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
        settings = {
          repend_preloaders = [
            {
              mime = "{audio,video,image}/*";
              run = "mediainfo";
            }
            {
              mime = "application/subrip";
              run = "mediainfo";
            }
          ];
          prepend_previewers = [
            {
              mime = "{audio,video,image}/*";
              run = "mediainfo";
            }
            {
              mime = "application/subrip";
              run = "mediainfo";
            }
            {
              mime = "*.md";
              run = "glow";
            }
          ];
        };
        initLua = ./init.lua;
        plugins = {
          git = pkgs.yaziPlugins.git;
          diff = pkgs.yaziPlugins.diff;
          glow = pkgs.yaziPlugins.glow;
          mediainfo = pkgs.yaziPlugins.mediainfo;
          lazygit = pkgs.yaziPlugins.lazygit;
          full-border = pkgs.yaziPlugins.full-border;
          yatline-catppuccin = pkgs.yaziPlugins.yatline-catppuccin;
          toggle-pane = pkgs.yaziPlugins.toggle-pane;
        };
        theme = {
          dark = "catppuccin-mocha";
          light = "catppuccin-latte";
        };
        flavors = {
          dark = ./flavors/catppuccin-mocha.yazi;
          light = ./flavors/catppuccin-latte.yazi;
        };
      };
    })
  ];
}
