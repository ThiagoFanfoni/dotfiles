return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["zsh"] = { "shfmt" },
      ["python"] = { "black" },
      ["hcl"] = { "terragrunt_hclfmt" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      terragrunt_hclfmt = {
        command = "terragrunt",
        args = { "hcl", "fmt", "--file", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
