return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = { enabled = false },
    servers = {
      terraformls = {
        -- Override lspconfig's callback, which enables CodeLens on attachment.
        on_attach = function(_, bufnr)
          if vim.lsp.codelens.enable then
            vim.lsp.codelens.enable(false, { bufnr = bufnr })
          end
        end,
      },
    },
  },
}
