-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)


local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local cond = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    before_key = 'h',
    after_key = 'l',
    cursor_pos_before = true,
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    manual_position = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})


local js = {"javascript", "typescript", "javascriptreact", "typescriptreact"};
npairs.add_rules({
  Rule("/*", "*/", js)
    :with_move(cond.not_before_text("/*")),
  Rule("/**", "*/", js)
    :only_cr()
    :replace_map_cr(function () return "<cr><bs><bs><C-{>O" end),
  Rule("|", "|", {"rust", "ruby"})
    :with_move(),
  Rule("```", "```", {"rust", "markdown"})
    :with_cr(),
})


-- local ts_conds = require('nvim-autopairs.ts-conds')
-- 
-- -- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--     :with_pair(ts_conds.is_ts_node({'string','comment'})),
--   Rule("$", "$", "lua")
--     :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })
