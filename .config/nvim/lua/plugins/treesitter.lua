return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      local have_query = LazyVim.treesitter.have_query

      LazyVim.treesitter.have_query = function(...)
        local ok, result = pcall(have_query, ...)
        if ok then
          return result
        end
        if tostring(result):find("No parser for language", 1, true) then
          return false
        end
        error(result)
      end
    end,
    opts = {
      ensure_installed = {
        "css",
        "latex",
        "scss",
        "svelte",
        "typst",
        "vue",
      },
    },
  },
}
