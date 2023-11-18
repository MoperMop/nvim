vim.opt.nu = true
vim.opt.rnu = true

vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.cmd.colorscheme = "default"
vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222222" })

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"

vim.opt.signcolumn = "yes"


vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.updatetime = 50
