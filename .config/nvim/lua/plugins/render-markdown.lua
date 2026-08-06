return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("markdown_plain_text", { clear = true }),
        pattern = { "markdown", "markdown.mdx", "rmd" },
        callback = function()
          vim.opt_local.conceallevel = 0
        end,
      })
    end,
    opts = {
      enabled = false,
      win_options = {
        conceallevel = {
          default = 0,
          rendered = 2,
        },
      },
    },
  },
}
