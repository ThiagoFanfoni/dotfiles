return {
  "mhiro2/tf-docs.nvim",
  ft = { "terraform", "hcl" },
  config = function()
    require("tf-docs").setup()
  end,
}
