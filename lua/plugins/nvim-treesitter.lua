return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" }, -- optional lazy-loading
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "toml",
        "json",
        "bash",
        "python",
        "typescript",
        "javascript",
        "html",
        "css",
        "yaml",
        "rust",
        "c",
        "cpp",
        "java",
        "markdown",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
