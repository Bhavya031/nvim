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

vim.opt.rtp:prepend(lazypath)
vim.opt.number = true
vim.opt.relativenumber = true
require("lazy").setup("plugins")
