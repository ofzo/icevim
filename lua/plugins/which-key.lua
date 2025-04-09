return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        preset = "helix",
        plugins = {
            presets = {},
        },
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        win = {
            no_overlap = true,
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = false,
        },
        triggers = {
            -- { "<auto>", mode = "nxso" },
            { "<leader>", mode = { "n", "v" } },
            { "g", mode = { "n", "v" } },
            { "[", mode = { "n", "v" } },
            { "]", mode = { "n", "v" } },
            { "m", mode = { "n", "v" } },
            { "y", mode = { "n", "v" } },
            { "c", mode = { "n", "v" } },
            { "z", mode = { "n", "v" } },
        },
        loop = true, -- this will keep the popup open until you hit <esc>
        keys = {
            scroll_down = "<Down>", -- binding to scroll down inside the popup
            scroll_up = "<Up>", -- binding to scroll up inside the popup
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show { global = true }
            end,
            desc = "Buffer Global Keymaps (which-key)",
        },
        {
            "<c-`>",
            ":ToggleTerm<CR>",
        },
        {
            mode = { "n", "x", "v" },
            "ge",
            "G",
        },
        {
            mode = { "n", "x", "v" },
            "gl",
            "$",
        },
        {
            mode = { "n", "x", "v" },
            "gh",
            "^",
        },
    },
}
