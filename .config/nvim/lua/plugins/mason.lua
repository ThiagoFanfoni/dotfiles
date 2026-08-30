return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "tectonic",
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
