-- ~/.config/nvim/init.lua
vim.opt.termguicolors = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.api.nvim_set_keymap('n', '<C-c>', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', { noremap = true, silent = true })


if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.expandtab = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set("i", "<CR>", function()
      return "\n\t"
    end, { buffer = true, expr = true })
  end
})
vim.opt.rtp:prepend(lazypath)
vim.opt.number = true
vim.opt.relativenumber = true
require("lazy").setup("plugins")
