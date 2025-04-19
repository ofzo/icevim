local opt = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.mapleader = " "
g.maplocalleader = " "
g.autoformat = true

opt.number = true
opt.background = "light"
opt.cursorline = false

opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true
opt.shiftround = true
opt.autoindent = true
opt.smarttab = true -- 插入 tab 时使用 shiftwidth

-- Case insensitive searching when no upper case character is present
opt.ignorecase = true
opt.smartcase = true

-- Disable the ugly highlight during searches
opt.hlsearch = false

opt.cmdheight = 1
opt.cmdwinheight = 1

-- Auto load the file when modified externally
opt.autoread = true
opt.autowrite = true

opt.wrap = false

-- Add mouse support for all modes
opt.mouse = "a"
opt.mousemodel = "extend"

opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Time to wait for a sequence of key combination
opt.timeoutlen = 100

-- Split window from below and right
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true

-- Maximum of 16 lines of prompt
-- This affects both neovim's native completion and that of nvim-cmp
opt.pumheight = 16

opt.showmode = false

opt.laststatus = 3
opt.termguicolors = true

-- 固定 signcolumn 为 1 列宽度（始终显示，不随内容动态收缩）
opt.signcolumn = "yes:1"
-- opt.cursorlineopt = "both"

-- 实用设置
opt.scrolloff = 6 -- 保持光标周围始终有8行显示
opt.sidescrolloff = 6 -- 水平滚动时保持8列显示

opt.clipboard = "unnamedplus"

opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}

vim.lsp.inlay_hint.enable(true, nil)

opt.foldlevel = 99 -- 设置折叠层级为最高（全部展开）
