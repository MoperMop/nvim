local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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


local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("had a problem while installing plugins, please restart")
  return
end

lazy.setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

  "mbbill/undotree",

  "tpope/vim-fugitive",


  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",


  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    build = ":colorscheme tokyonight",
  }
})
