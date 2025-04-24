-- https://nvimdev.github.io/lspsaga/
return {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    cmd = "Lspsaga",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
        finder = {
            max_height = 0.6,
            left_width = 0.3,
            silent = false,
            keys = {
                toggle_or_open = "<CR>",
                quit = "<ESC>",
            },
        },
        ui = {
            winbar = false, -- 直接关闭整个 winbar 功能
            code_action = "",
            title = false,
            expand = "",
            collapse = "",
            lines = { "╰", "├", "│", "─", "╭" },
        },
        symbol_in_winbar = {
            enable = false,
        },
        code_action = {
            num_shortcut = false,
            show_server_name = true,
            extend_gitsigns = false,
            only_in_cursor = true,
            keys = {
                quit = "<ESC>",
            },
        },
        outline = {
            close_after_jump = true,
            keys = {
                toggle_or_jump = "<CR>",
                quit = "<ESC>",
            },
        },
        callhierarchy = {
            keys = {
                quit = "<ESC>",
                edit = "<CR>",
            },
        },
        hover = {
            max_width = 0.5,
            max_height = 0.4,
            in_select = false,
            auto_save = true,
        },
        lightbulb = {
            enable = true,
            -- 位置控制
            sign = false,
            virtual_text = false,
            sign_priority = 20,
            -- 自定义图标位置
            update_in_insert = false,
            enable_in_insert = true,
        },
    },
    keys = {
        -- leader key
        {
            "<leader>r",
            function()
                vim.cmd "Lspsaga rename"
            end,
            desc = "Rename symbol",
        },
        {
            "<leader>a",
            function()
                vim.cmd "Lspsaga code_action"
            end,
            desc = "Code action",
        },
        {
            "<leader>d",
            function()
                vim.cmd "Lspsaga diagnostic_jump_next"
            end,
            desc = "Show current or next diagnostic",
        },
        {
            "<leader><leader>",
            function()
                vim.cmd "Lspsaga hover_doc"
            end,
            desc = "Hove document",
        },
        {
            "<A-k>",
            function()
                vim.cmd "Lspsaga hover_doc"
            end,
            desc = "Hove document",
            mode = { "i" },
        },
        {
            "<A-K>",
            function()
                vim.cmd "Lspsaga hover_doc ++keep"
            end,
            desc = "Hove document",
            mode = { "i" },
        },
        {
            "<leader>o",
            function()
                vim.cmd "Lspsaga outline"
            end,
            desc = "Outline",
        },
        {
            "co",
            function()
                vim.cmd "Lspsaga outgoing_calls"
            end,
            desc = "Outgoing calls",
        },
        {
            "ci",
            function()
                vim.cmd "Lspsaga incoming_calls"
            end,
            desc = "Incoming calls",
        },

        -- g key ---
        {
            "gd",
            function()
                vim.cmd "Lspsaga goto_definition"
            end,
            desc = "Goto definition",
        },
        {
            "gr",
            function()
                vim.cmd "Lspsaga finder ref"
            end,
            desc = "Find references",
        },
        {
            "gi",
            function()
                vim.cmd "Lspsaga finder imp"
            end,
            desc = "Find implementation",
        },

        {
            "K",
            function()
                vim.cmd [[ Lspsaga hover_doc ++keep ]]
            end,
        },
    },
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end,
}
