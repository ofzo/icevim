local HOME = os.getenv "HOME"
local file = io.open(HOME .. "/.config/nvim/git_tmp.txt")

if file == nil then
    print "try to connent to github use ssh..."
    local result = vim.fn.system "ssh -T git@github.com"

    -- "You've successfully authenticated"
    if string.find(result, "You've successfully authenticated") ~= nil then
        vim.fn.system "echo 'git@github.com:%s' > ~/.config/nvim/git_tmp.txt"
        vim.env.GITHUB = "git@github.com:%s"
    else
        vim.fn.system "echo 'https://github.com/%s ' > ~/.config/nvim/git_tmp.txt"
        vim.env.GITHUB = "https://github.com/%s"
    end
else
    io.input(file)
    vim.env.GITHUB = io.read()
    io.close(file)
end

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        string.format(vim.env.GITHUB, "folke/lazy.nvim.git"),
        -- "git@github.com:folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
    vim.api.nvim_echo({
        { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" },
        { "Press any key to exit...", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
end

require("lazy").setup({
    { import = "plugins" },
}, {
    ui = { size = { width = 0.7, height = 0.7 }, border = "rounded" },
    git = {
        url_format = vim.env.GITHUB,
        log = { "-2" },
    },
    lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json", -- lockfile generated after running update.
    install = { colorscheme = { "catppuccin" } },
    defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
    },
    news = {
        -- When enabled, NEWS.md will be shown when changed.
        -- This only contains big new features and breaking changes.
        lazyvim = true,
        -- Same but for Neovim's news.txt
        neovim = false,
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = { "netrw", "tohtml" }, -- 禁用非必要插件
        },
    },
})
