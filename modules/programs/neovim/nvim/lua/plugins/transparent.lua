return {
  "xiyaowong/transparent.nvim",
  opts = {
    -- Default highlight groups to set as transparent
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },

    -- Additional groups to be set as transparent
    extra_groups = {
      'NoiceCmdlineIcon',
      'NoiceCmdlinePopupBorder',
      'NoiceCmdlineIconSearch',
      "NoiceConfirmBorder",
      "WhichKeyBorder",
      "WhichKeyNormal",
      "WhichKeyTitle",
      "FzfLuaBorder",
    }, -- Add custom groups if needed

    -- Groups you don't want to apply transparency to
    exclude_groups = {}, -- For example, add 'StatusLine' here if you don't want to affect it

    -- Function to run when highlight groups are cleared
    on_clear = function()
      -- User's custom code to run after clearing transparency
    end,
  }
}
