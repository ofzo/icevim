return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "gbrlsnchs/telescope-lsp-handlers.nvim",
    },
    event = "VeryLazy",
    keys = {
        {
            "<leader>f",
            function()
                local builtin = require "telescope.builtin"
                builtin.find_files()
            end,
            desc = "Telescope find file",
        },
        {
            "<leader>/",
            function()
                local builtin = require "telescope.builtin"
                builtin.live_grep()
            end,
            desc = "Telescope search word",
        },
        {
            "<leader>s",
            function()
                local builtin = require "telescope.builtin"
                builtin.symbols()
            end,
            desc = "Telescope symbols",
        },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "^%.git[/\\]", "[/\\]%.git[/\\]" },
            path_display = { "truncate" },
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = { prompt_position = "top", preview_width = 0.55 },
                vertical = { mirror = false },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            -- other defaults configuration here
        },
    },
    config = function()
        require("telescope").load_extension "lsp_handlers"
    end,
}
