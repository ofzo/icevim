-- 判断光标下是否有非空白字符
local function has_char_under_cursor()
    -- 获取光标位置（行号从 1 开始，列号从 1 开始）
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line() -- 获取当前行内容

    -- 转换为 Lua 字符串索引（Lua 字符串从 1 开始）
    local char_pos = col

    -- 检查列号是否超出字符串长度
    if char_pos > #line then
        return false
    end

    -- 获取光标下的字符并检查
    local char = line:sub(char_pos, char_pos)
    return char:match "%S" ~= nil -- 使用正则匹配非空白字符
end

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
            num_shortcut = true,
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
            virtual_text = true,
            sign_priority = 20,
            -- 自定义图标位置
            update_in_insert = false,
            enable_in_insert = true,
        },
        diagnostic = {
            diagnostic_only_current = false,
            virtual_text = true,
            keys = {
                quit = { "q", "<ESC>" },
            },
        },
        rename = {
            keys = {
                quit = { "<ESC>" },
            },
        },
    },
    keys = {
        -- leader key
        {
            "<leader>r",
            function()
                if has_char_under_cursor() then
                    vim.cmd "Lspsaga rename"
                end
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
                vim.cmd "Lspsaga show_line_diagnostics"
            end,
            desc = "Show current line diagnostic",
        },
        {
            "<leader>k",
            function()
                vim.cmd "Lspsaga show_buf_diagnostics"
            end,
            desc = "Show current buffer diagnostic",
        },
        {
            "<leader>D",
            function()
                vim.cmd "Lspsaga show_workspace_diagnostics ++float"
            end,
            desc = "Show workspace diagnostic",
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

        vim.diagnostic.config {
            virtual_text = false,
            signs = false,
        }
    end,
}
