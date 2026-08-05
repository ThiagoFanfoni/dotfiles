return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.terraform = { "terraform_validate", "tflint" }
      opts.linters_by_ft.tf = { "terraform_validate", "tflint" }
    end,
  },
}
