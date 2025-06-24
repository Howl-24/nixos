return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "C:/Users/Howl/.config/nvim/linter/markdownlint.yaml", "--" },
      },
    },
  },
}

