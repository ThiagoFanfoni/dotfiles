return {
  "stevearc/conform.nvim",

  opts = function(_, opts)
    opts.formatters_by_ft.fish = nil
    opts.formatters_by_ft.hcl = function(bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if vim.endswith(filename, ".pkr.hcl") or vim.endswith(filename, ".pkrvars.hcl") then
        return { "packer_fmt" }
      end
      return { "terragrunt_hclfmt" }
    end
    opts.formatters_by_ft.text = { "trim_whitespace", "trim_newlines" }
    opts.formatters_by_ft.zsh = { "shfmt" }
  end,
}
