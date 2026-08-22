return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "actionlint",
      "ast-grep",
      "gitleaks",
      "jq",
      "luacheck",
      "mmdc",
      "tectonic",
      "terraform",
      "tfsec",
      "tree-sitter-cli",
      "trivy",
      "yq",
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
