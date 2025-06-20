return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        nix = { "nixfmt" },

        -- Fix common misspellings in source code on all filetypes
        ["*"] = { "codespell" },
      },
    },
  },
}
