{ ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        action = "<cmd>CopilotChatToggle<CR>";
        key = "<leader>ai";
      }
    ];
    plugins.copilot-chat = {
      enable = true;
      settings = {
        answer_header = "## Copilot ";
        auto_follow_cursor = false;
        error_header = "## Error ";
        mappings = {
          close = {
            insert = "<C-c>";
            normal = "q";
          };
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.";
            insert = "<Tab>";
          };
        };
        prompts = {
          Explain = "Please explain how the following code works.";
          Review = "Please review the following code and provide suggestions for improvement.";
          Tests = "Please explain how the selected code works, then generate unit tests for it.";
        };
        question_header = "## User ";
        show_help = true;
        window = {
          layout = "vertical"; # 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
          width = 0.2; # fractional width of parent, or absolute width in columns when > 1
          height = 0.5; # fractional height of parent, or absolute height in rows when > 1
        };
      };
    };
  };
}
