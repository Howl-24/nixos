local actions = require("fzf-lua").actions
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    keymap = {
      -- Below are the default binds, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      builtin = {
        -- neovim `:tmap` mappings for the fzf win
        -- true,        -- uncomment to inherit all the below in your custom config
        ["<M-Esc>"]    = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
        ["<C-F1>"]     = "toggle-help",
        ["<C-F2>"]     = "toggle-fullscreen",
        -- Only valid with the 'builtin' previewer
        ["<C-F3>"]     = "toggle-preview-wrap",
        ["<C-F4>"]     = "toggle-preview",
        -- Rotate preview clockwise/counter-clockwise
        ["<C-F5>"]     = "toggle-preview-ccw",
        ["<C-F6>"]     = "toggle-preview-cw",
        -- `ts-ctx` binds require `nvim-treesitter-context`
        ["<C-F7>"]     = "toggle-preview-ts-ctx",
        ["<C-F8>"]     = "preview-ts-ctx-dec",
        ["<C-F9>"]     = "preview-ts-ctx-inc",
        ["<S-Left>"]   = "preview-reset",
        ["<S-down>"]   = "preview-page-down",
        ["<S-up>"]     = "preview-page-up",
        ["<M-S-down>"] = "preview-down",
        ["<M-S-up>"]   = "preview-up",
      },
    },
    files = {
      actions = {
        ["f7"] = { actions.toggle_hidden },
        ["f8"] = { actions.toggle_ignore },
        ["alt-h"] = function() end,
        ["alt-i"] = function() end,
      },
    },
    grep = {
      actions = {
        ["f7"] = { actions.toggle_hidden },
        ["f8"] = { actions.toggle_ignore },
        ["alt-h"] = function() end,
        ["alt-i"] = function() end,
      },
    },
  },
}
