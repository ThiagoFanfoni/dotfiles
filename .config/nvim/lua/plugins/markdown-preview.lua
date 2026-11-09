return {
  -- "iamcco/markdown-preview.nvim",
  "sammaji/markdown-preview.nvim",

  init = function()
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_theme = "light"
    vim.g.mkdp_theme_css = vim.fn.stdpath("config") .. "/styles/markdown-preview-github.css"

    vim.api.nvim_create_autocmd("BufDelete", {
      callback = function(args)
        if vim.bo[args.buf].filetype ~= "markdown" then
          return
        end

        if vim.fn.exists("*mkdp#rpc#preview_close") == 0 then
          return
        end

        vim.api.nvim_buf_call(args.buf, function()
          vim.fn["mkdp#rpc#preview_close"]()
        end)
      end,
    })
  end,
}
