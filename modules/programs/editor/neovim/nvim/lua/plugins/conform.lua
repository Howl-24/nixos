return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        nix = { "nixfmt" },

        json = { "jq" },
        -- Fix common misspellings in source code on all filetypes
        ["*"] = { "codespell" },
      },
    },
  },
}
