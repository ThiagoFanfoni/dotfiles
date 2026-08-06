return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft.fish = nil
    opts.formatters_by_ft.zsh = { "shfmt" }
    opts.formatters_by_ft.python = { "black" }
    opts.formatters_by_ft.hcl = { "terragrunt_hclfmt" }
    opts.formatters_by_ft["*"] = { "trim_whitespace", "trim_newlines" }

    opts.formatters.shfmt = {
      prepend_args = { "-i", "2" },
    }
    opts.formatters.terragrunt_hclfmt = {
      command = "terragrunt",
      args = { "hcl", "fmt", "--file", "$FILENAME" },
      stdin = false,
    }
  end,
}
