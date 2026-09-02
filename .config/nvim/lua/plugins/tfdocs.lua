return {
  "mhiro2/tf-docs.nvim",
  ft = { "terraform", "hcl" },
  keys = {
    { "<C-k>", "<cmd>TfDocOpen<cr>", ft = { "terraform", "hcl" }, desc = "Terraform: open docs" },
    { "<C-l>", "<cmd>TfDocList<cr>", ft = { "terraform", "hcl" }, desc = "Terraform: list docs" },
  },
  config = function()
    require("tf-docs").setup()
  end,
}
