local opt = { silent = true, nowait = true, noremap = true }
local keyset = vim.keymap.set
local feedkeys = vim.api.nvim_feedkeys

vim.cmd [[source ~/.config/nvim/lua/keymap.vim]]

--- insert
keyset({ "i", "n" }, "<A-Right>", function()
    feedkeys("e", "n", false)
end, opt)
keyset({ "i", "n" }, "<A-Left>", function()
    feedkeys("b", "n", false)
end, opt)
keyset({ "i", "n" }, "<S-Left>", function()
    feedkeys("0", "n", false)
end, opt)
keyset({ "i", "n" }, "<S-Right>", function()
    feedkeys("$", "n", false)
end, opt)
