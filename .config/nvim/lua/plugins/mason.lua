return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "ast-grep",
      "black",
      "gitleaks",
      "luacheck",
      "prettier",
      "tectonic",
      "tfsec",
      "tree-sitter-cli",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
