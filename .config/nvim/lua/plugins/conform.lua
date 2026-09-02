return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft.fish = nil
    opts.formatters_by_ft.zsh = nil
    opts.formatters_by_ft.hcl = { "terragrunt_hclfmt" }
    opts.formatters_by_ft["*"] = { "trim_whitespace", "trim_newlines" }

    opts.formatters.terragrunt_hclfmt = {
      command = "terragrunt",
      args = { "hcl", "fmt", "--file", "$FILENAME" },
      stdin = false,
    }
  end,
}
