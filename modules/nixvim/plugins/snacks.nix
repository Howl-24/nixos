{ ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        action = "<cmd>lua require('snacks').picker.smart()<CR>";
        key = "<leader><space>";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').picker.buffers()<CR>";
        key = "<leader>,";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').picker.grep()<CR>";
        key = "<leader>/";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').picker.command_history()<CR>";
        key = "<leader>:";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').picker.notifications()<CR>";
        key = "<leader>n";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').explorer()<CR>";
        key = "<leader>e";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').terminal.toggle()<CR>";
        key = "<leader>t";
      }
      {
        mode = "n";
        action = "<cmd>lua require('snacks').dashboard()<CR>";
        key = "<leader>db";
      }
    ];
    plugins = {
      snacks = {
        enable = true;
        settings = {
          bigfile = {
            enabled = true;
          };
          dashboard = {
            enabled = true;
            pane_gap = 6;
            preset = {
              keys = [
                {
                  icon = " ";
                  key = "f";
                  desc = "Find File";
                  action = ":lua Snacks.dashboard.pick('files')";
                }
                {
                  icon = " ";
                  key = "n";
                  desc = "New File";
                  action = ":ene | startinsert";
                }
                {
                  icon = " ";
                  key = "g";
                  desc = "Find Text";
                  action = ":lua Snacks.dashboard.pick('live_grep')";
                }
                {
                  icon = " ";
                  key = "r";
                  desc = "Recent Files";
                  action = ":lua Snacks.dashboard.pick('oldfiles')";
                }
                {
                  icon = " ";
                  key = "s";
                  desc = "Select Session";
                  action = ":lua require('persistence').select()";
                }
                {
                  icon = " ";
                  key = "l";
                  desc = "Load Session";
                  action = ":lua require('persistence').load()";
                }
                {
                  icon = " ";
                  key = "q";
                  desc = "Quit";
                  action = ":qa";
                }
              ];
              header = ''
                ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                ⡟⣩⣛⣛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠻⢿⡿⠿⠿⠿⠿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
                ⣧⠫⣉⠁⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⢿⣿
                ⣿⢠⣮⡄⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⢿⢸⣿
                ⣿⠂⢿⢘⠀⠈⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠩⢈⣼⣿
                ⣿⡆⡶⣮⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠁⠐⢸⣿⣿
                ⣿⣿⣶⠘⠬⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡂⣬⠇⣾⣿⣿
                ⣿⣿⣿⡦⠘⠃⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡄⣼⣿⣿⣿
                ⣿⣿⣿⣇⢻⠿⣱⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⣰⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣴⣿⣿⣿⣿
                ⣿⣿⣿⣿⣤⠀⢃⡄⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⣼⣾⣿⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿
                ⣿⣿⣿⣿⣿⣷⡈⠱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⣿⠇⠂⠀⠀⠀⠀⠀⠀⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿
                ⣿⣿⣿⣿⣿⣿⡷⠂⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⣄⡅⠀⠀⠀⢠⣦⣠⡣⠊⠀⠀⠀⠀⠀⢀⠼⡟⠀⠄⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿
                ⠙⠻⢿⣿⡿⠋⠀⠀⠀⠀⠀⠀⢀⠧⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣶⣾⣿⣿⣷⣶⣶⣯⣄⠀⠀⠀⠈⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⡄⢿⣿⣿
                ⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠈⢘⠀⠀⠀⠀⠀⡀⠀⣙⣻⣿⣿⣿⣿⣿⣿⣿⣶⢻⣿⣄⡃⠀⡸⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⢸⣿⣿
                ⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⡘⣿⣿
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠿⣿⣿⣿⣯⣙⢿⣿⣿⡿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣠⢁⣿⣿
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠄⢠⡀⢈⢓⡲⠶⣤⣬⣍⣙⠛⠿⣶⣿⣿⣿⣿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠺⣿⣿
                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⣀⠱⠀⠀⠀⠀⠀⢹⣿⣿⣶⣮⣭⣛⡻⢷⣶⡈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿
                ⡄⠀⠀⠀⠀⠀⠀⠀⢀⢀⣬⣅⣒⡿⢦⡀⠀⠀⠀⠀⠀⢉⠙⢛⠿⠿⣿⣿⣿⣶⣭⣝⡳⠦⣀⠀⠀⠒⠐⠂⠁⠐⠀⠀⠀⠀⠀⠀⠠⠀⡘
                ⡀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠉⠛⠻⠿⣿⡇⠀⠀⠀⠀⢰⣦⣄⡀⢹⣶⣦⣬⣍⣛⠻⠿⢿⣿⣶⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠
                ⡇⣧⠀⠀⠀⠀⠂⣀⣀⣀⣀⡀⠀⠀⠈⢉⠈⠀⠀⠀⠀⢿⣿⣿⣷⣮⣝⣛⣻⣯⣭⣷⣶⣦⣬⠭⠁⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⡄⢶⠀
                ⣿⣿⣷⡀⠈⠀⢶⣿⣿⣿⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠈⠀⠀⠀⠀⠘⠀⠜⠁⢀⣤⢠⡴⣿
                ⣿⣿⣿⡿⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⠿⣿⣿⣿⣿⣿⠿⢟⠫⠕⠐⠀⢀⠀⠀⠀⠀⠐⠻⢿⣷⣾⣿⣇⢷⡹
              '';
            };
            sections = [
              {
                icon = " ";
                title = "Keymaps";
                section = "keys";
                indent = 2;
                padding = 1;
              }
              {
                icon = " ";
                title = "Recent Files";
                section = "recent_files";
                indent = 2;
                padding = 1;
              }
              {
                icon = " ";
                title = "Projects";
                section = "projects";
                indent = 2;
                padding = 1;
              }
              {
                pane = 2;
                section = "header";
                # padding = 0.5;
              }
            ];
          };
          explorer = {
            enabled = true;
            replace_netrw = true;
          };
          indent = {
            enabled = true;
          };
          input = {
            enabled = true;
          };
          picker = {
            enabled = true;
          };
          notifier = {
            enabled = true;
            border = "rounded";
          };
          quickfile = {
            enabled = true;
          };
          scope = {
            enabled = true;
          };
          scroll = {
            enabled = true;
          };
          statuscolumn = {
            enabled = true;
          };
          words = {
            enabled = true;
          };
          image = {
            enabled = true;
          };
        };
      };
    };
  };
}
