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
            extend_gitsigns = true,
            only_in_cursor = true,
            keys = {
                quit = "<ESC>",
            },
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
            desc = "Diagnostic",
        },
        {
            "<leader><leader>",
            function()
                vim.cmd "Lspsaga hover_doc"
            end,
            desc = "Hove document",
        },
        {
            "<leader>t",
            function()
                vim.cmd "Lspsaga term_toggle"
            end,
            desc = "Float Terminal",
        },
        {
            "<leader>o",
            function()
                vim.cmd "Lspsaga outline"
            end,
            desc = "Outline",
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
    },
    config = function(_, opts)
        require("lspsaga").setup(opts)
    end,
}
