require("lazy").setup({
    { import = "plugins" },
}, {
    ui = { size = { width = 0.7, height = 0.7 }, border = "rounded" },
    git = {
        url_format = vim.env.GITHUB,
        log = { "-2" },
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
})
