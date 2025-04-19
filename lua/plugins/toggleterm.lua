return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    event = "VeryLazy",
    cmd = "ToggleTerm", -- 输入命令时加载
    opts = {
        --[[ things you want to change go here]]
    },
    keys = {
        {
            "<leader>b",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local term = Terminal:new {
                    hidden = true,
                    direction = "horizontal",
                    on_open = function(term)
                        vim.cmd "startinsert!"
                    end,
                }
                term:toggle()
            end,
            desc = "Toggle bottom terminal",
        },
        {
            "<leader>t",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local color = require "palette"
                local term = Terminal:new {
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "rounded",
                        width = 120,
                        height = 25,
                    },
                    highlights = {
                        FloatBorder = {
                            guifg = color.red600,
                            guibg = color.white,
                        },
                    },
                    on_open = function(term)
                        vim.cmd "startinsert!"
                    end,
                }
                term:toggle()
            end,
            desc = "Toggle float terminal",
        },
        {
            "<leader>G",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local lazygit = Terminal:new {
                    cmd = "lazygit",
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "none",
                    },
                    on_open = function(term)
                        vim.api.nvim_buf_set_keymap(
                            term.bufnr,
                            "n",
                            "<ESC>",
                            "<cmd>close<CR>",
                            { noremap = true, silent = true }
                        )
                    end,
                    -- function to run on closing the terminal
                    on_close = function(term)
                        vim.cmd [[ Neotree refresh ]]
                        vim.cmd "startinsert!"
                    end,
                    winbar = {
                        enabled = true,
                        name_formatter = function(term) --  term: Terminal
                            return term.name
                        end,
                    },
                }
                lazygit:toggle()
            end,
            desc = "Toggle lazygit",
        },
        {
            "<leader>R",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local cmd = Terminal:new {
                    cmd = "serpl",
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "none",
                    },
                    on_open = function(term)
                        vim.cmd "startinsert!"
                        vim.api.nvim_buf_set_keymap(
                            term.bufnr,
                            "n",
                            "q",
                            "<cmd>close<CR>",
                            { noremap = true, silent = true }
                        )
                    end,
                    -- function to run on closing the terminal
                    on_close = function(term)
                        vim.cmd "startinsert!"
                    end,
                    winbar = {
                        enabled = true,
                        name_formatter = function(term) --  term: Terminal
                            return term.name
                        end,
                    },
                }
                cmd:toggle()
            end,
            desc = "Search & Replace",
        },
    },
}
