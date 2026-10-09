return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      taplo = {
        root_markers = {
          ".taplo.toml",
          "taplo.toml",
          ".git",
          ".mise.toml",
          "mise.toml",
        },
      },
    },
  },
}
