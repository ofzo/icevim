local opt = { silent = true, nowait = true, noremap = true }
local keyset = vim.keymap.set
local feedkeys = vim.api.nvim_feedkeys

vim.cmd [[
    lcd %:p:h
    command Q q
    command W w

    nnoremap <silent><nowait>; :
    nnoremap <silent><nowait>@ q
    nnoremap <silent><nowait>mm %
    nnoremap <silent><nowait>% ggVG$
    nnoremap <silent><nowait><leader>c gcc

    nnoremap x V
    noremap <leader>e :Neotree reveal<CR>

    inoremap <silent><nowait><C-s> :write<CR>
    nnoremap <silent><nowait>S :write<CR>
    xnoremap <silent><nowait>S :write<CR>

    nnoremap <silent><nowait>- <C-x>
    nnoremap <silent><nowait>+ <C-a>
    xnoremap <silent><nowait>- <C-x>
    xnoremap <silent><nowait>+ <C-a>

    nnoremap <silent><nowait><Tab> >>
    nnoremap <silent><nowait><S-Tab> <<
    xnoremap <silent><nowait><Tab> >>gv=gv
    xnoremap <silent><nowait><S-Tab> <<gv=gv

    xnoremap <silent><nowait>x <Down> 
    xnoremap <silent><nowait>X <Up> 

    nnoremap <silent><nowait><A-j> :move .+1<CR>==
    nnoremap <silent><nowait><A-k> :move .-2<CR>==
    xnoremap <silent><nowait><A-j> :m '>+1<CR>gv=gv
    xnoremap <silent><nowait><A-k> :m '<-2<CR>gv=gv

    nnoremap <silent><nowait>d "_dl
    xnoremap <silent><nowait>d "_d
    
    au VimLeave * set guicursor=a:ver25-blinkon0
]]

-- normal mode
-- keyset("n", "x", "V", opt)
-- keyset("n", "<leader>e", ":Neotree reveal<CR>", opt)
-- keyset({ "n", "v" }, "q", "bnext", opt)
--
-- keyset("n", "-", "<C-x>", opt)
-- keyset("n", "+", "<C-a>", opt)
--
-- -- keyset({ "n", "v", "i" }, "<C-s>", "slient! write<CR>", opt)
-- keyset({ "n", "v" }, "S", ":slient! write<CR>", opt)
--
-- keyset({ "n", "v" }, "<Tab>", function()
--     feedkeys(">>", "v", true)
-- end, opt)
-- keyset({ "n", "v" }, "<S-Tab>", function()
--     feedkeys("<<", "v", true)
-- end, opt)
--
-- keyset("n", "<A-j>", ":move .+1<CR>==", opt)
-- keyset("n", "<A-k>", ":move .-2<CR>==", opt)
-- keyset("v", "<A-j>", ":move '>+1<CR>gv=gv", opt)
-- keyset({ "n", "v" }, "d", '"_d')
--
-- -- visual mode
-- keyset("v", "x", function()
--     feedkeys("j", "n", false)
-- end, opt)
-- keyset("v", "X", function()
--     feedkeys("k", "n", false)
-- end, opt)
-- keyset("v", "q", function()
--     vim.cmd "close"
-- end, opt)
-- keyset("v", "i", function()
--     feedkeys("i", "n", false)
-- end, opt)
-- keyset("v", "a", function()
--     feedkeys("a", "n", false)
-- end, opt)
-- keyset("v", "o", function()
--     feedkeys("o", "n", false)
-- end, opt)

--- insert
keyset({ "i", "n" }, "<A-Left>", function()
    feedkeys("e", "n", false)
end, opt)
keyset({ "i", "n" }, "<A-Right>", function()
    feedkeys("b", "n", false)
end, opt)
keyset({ "i", "n" }, "<S-Left>", function()
    feedkeys("0", "n", false)
end, opt)
keyset({ "i", "n" }, "<S-Right>", function()
    feedkeys("$", "n", false)
end, opt)
