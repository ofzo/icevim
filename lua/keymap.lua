vim.cmd [[
    
    lcd %:p:h
    command Q q
    command W w

    noremap ; :
    noremap mm %
    noremap % ggVG$
    noremap <leader>c gcc

    au VimLeave * set guicursor=a:ver25-blinkon0
]]

local opt = { silent = true, nowait = true, noremap = true }

-- normal mode
vim.keymap.set("n", "x", function()
    vim.api.nvim_feedkeys("V", "n", false)
end, opt)

vim.keymap.set("n", "<leader>e", function()
    require("neo-tree").reveal()
end, opt)

vim.keymap.set({ "n", "v" }, "q", function()
    vim.api.nvim_command "bnext"
end, opt)
vim.keymap.set("n", "-", function()
    vim.api.nvim_feedkeys("<C-x>", "n", true)
end, opt)
vim.keymap.set("n", "+", function()
    vim.api.nvim_feedkeys("<C-a>", "n", true)
end, opt)

vim.keymap.set({ "n", "v", "i" }, "<C-s>", function()
    vim.cmd [[ write ]]
end, opt)

vim.keymap.set({ "n", "v" }, "S", function()
    vim.cmd [[ write ]]
end, opt)

vim.keymap.set({ "n", "v" }, "<Tab>", function()
    vim.api.nvim_feedkeys(">>", "v", true)
end, opt)
vim.keymap.set({ "n", "v" }, "<S-Tab>", function()
    vim.api.nvim_feedkeys("<<", "v", true)
end, opt)

vim.keymap.set(
    "n",
    "<A-j>",
    ":move .+1<CR>==",
    { desc = "Move line down", silent = true, nowait = true, noremap = true }
)

vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { desc = "Move line up", silent = true, noremap = true, nowait = true })

vim.keymap.set(
    "v",
    "<A-j>",
    ":move '>+1<CR>gv=gv",
    { desc = "Move selection down", silent = true, noremap = true, nowait = true }
)
vim.keymap.set(
    "v",
    "<A-k>",
    ":move '<-2<CR>gv=gv",
    { desc = "Move selection up", silent = true, noremap = true, nowait = true }
)

vim.keymap.set({ "n", "v" }, "d", '"_d')

-- visual mode
vim.keymap.set("v", "x", function()
    vim.api.nvim_feedkeys("j", "n", false)
end, opt)
vim.keymap.set("v", "X", function()
    vim.api.nvim_feedkeys("k", "n", false)
end, opt)
vim.keymap.set("v", "q", function()
    vim.api.nvim_command "close"
end, opt)
vim.keymap.set("v", "i", function()
    vim.api.nvim_feedkeys("i", "n", false)
end, opt)
vim.keymap.set("v", "a", function()
    vim.api.nvim_feedkeys("a", "n", false)
end, opt)
vim.keymap.set("v", "o", function()
    vim.api.nvim_feedkeys("o", "n", false)
end, opt)

--- insert
vim.keymap.set({ "i", "n" }, "<A-Left>", function()
    vim.api.nvim_feedkeys("e", "n", false)
end, opt)
vim.keymap.set({ "i", "n" }, "<A-Right>", function()
    vim.api.nvim_feedkeys("b", "n", false)
end, opt)
vim.keymap.set({ "i", "n" }, "<S-Left>", function()
    vim.api.nvim_feedkeys("0", "n", false)
end, opt)
vim.keymap.set({ "i", "n" }, "<S-Right>", function()
    vim.api.nvim_feedkeys("$", "n", false)
end, opt)
