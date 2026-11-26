return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    local lint = require("lint")
    opts.linters.terraform_validate = require("lint.util").wrap(lint.linters.terraform_validate, function(diagnostic)
      if
        vim.startswith(diagnostic.message, "Missing required provider - ")
        or diagnostic.message:find(": there is no package for .- cached in %.terraform/providers")
      then
        return nil
      end
      return diagnostic
    end)
  end,
}
