return {
  "stevearc/conform.nvim",

  opts = function(_, opts)
    opts.formatters.terragrunt_hclfmt = {
      args = { "hcl", "fmt", "--file", "$FILENAME" },
      command = "terragrunt",
      stdin = false,
    }

    opts.formatters_by_ft["*"] = { "trim_whitespace", "trim_newlines" }
    opts.formatters_by_ft.fish = nil
    opts.formatters_by_ft.hcl = { "terragrunt_hclfmt" }
    opts.formatters_by_ft.zsh = { "shfmt" }
  end,
}
