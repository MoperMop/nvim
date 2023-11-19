for group, value in pairs({
  Identifier="#44aaff",
  Statement="#b860eb",
  Operator="#ffff00",
  Special="white",
  Function="#ffe07a",
  KeyWord="#5a52ff",
  String="#17e84b",
  Number="#ffa200",

  LineNR="white",
}) do
  vim.cmd("hi " .. group .. " guifg=" .. value)
end

for group, value in pairs({
  Normal="black",
  NormalNC="#333333",

  ColorColumn="#0000aa",

  Pmenu="#444444",
  PmenuSel="#666666",
}) do
  vim.cmd("hi " .. group .. " guibg=" .. value)
end


for group_from, group_to in pairs({
  Boolean="KeyWord",
  SignColumn="Normal",
}) do
  vim.cmd("hi! link " .. group_from .. " " .. group_to)
end
