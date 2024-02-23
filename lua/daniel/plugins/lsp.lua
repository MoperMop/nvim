require("mason").setup({})
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "lua_ls",
    "cssls",
    "html",
    "emmet_language_server",
  },
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilites = lsp_capabilities
      })
    end
  },
})


vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end
})


local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


require("luasnip.loaders.from_vscode").lazy_load()
