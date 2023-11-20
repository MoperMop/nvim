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

local function config(file)
  return function() require("daniel.plugins." .. file) end
end

lazy.setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config("treesitter"),
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = config("rainbow-delimiters"),
  },


  "nvim-tree/nvim-web-devicons",


  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config("telescope"),
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config("harpoon"),
  },


  {
    "mbbill/undotree",
    config = function() vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>") end,
  },


  "tpope/vim-fugitive",

  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },


  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",

      'saadparwaiz1/cmp_luasnip',
      {
        "L3MON4D3/LuaSnip",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    config = config("lsp"),
  },


  {
    "nvimtools/none-ls.nvim",
    config = config("none-ls"),
  },


  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
    config = function()
      require("Comment").setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim')
          .create_pre_hook(),
      }
    end,
    dependencies = {
      'numToStr/Comment.nvim',
      opts = {},
      lazy = false,
    },
  },


  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
    config = config("auto-pairs"),
  },
  "windwp/nvim-ts-autotag",

  "tpope/vim-surround",
  "tpope/vim-repeat",


  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd.colorscheme("tokyonight") end,
  },
})
