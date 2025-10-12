local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8) -- 减 4 保留状态栏/命令行空间

-- 计算居中位置
local col = (vim.o.columns - width) / 2
local row = (vim.o.lines - height) / 2

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
            "<esc>",
            function()
                vim.cmd "startinsert!"
            end,
            mode = { "t" },
        },
        {
            "<leader>`",
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
                    auto_scroll = true, -- 自动滚动到底部以显示终端输出
                    float_opts = {
                        border = "rounded",
                        relative = "editor",
                        width = width,
                        height = height,
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
                local color = require "palette"
                local lazygit = Terminal:new {
                    cmd = "lazygit",
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "rounded",
                        relative = "editor",
                        width = width,
                        height = height,
                        title = "LazyGit",
                    },
                    highlights = {
                        FloatBorder = {
                            guifg = color.green600,
                            guibg = color.white,
                        },
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
                local color = require "palette"
                local cmd = Terminal:new {
                    cmd = "serpl",
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "rounded",
                        relative = "editor",
                        width = width,
                        height = height,
                    },
                    highlights = {
                        FloatBorder = {
                            guifg = color.purple600,
                            guibg = color.white,
                        },
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
        {
            "<leader>z",
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                local color = require "palette"
                local yazi = Terminal:new {
                    cmd = "yazi",
                    hidden = true,
                    direction = "float",
                    float_opts = {
                        border = "rounded",
                        relative = "editor",
                        width = width,
                        height = height,
                    },
                    highlights = {
                        FloatBorder = {
                            guifg = color.yellow600,
                            guibg = color.white,
                        },
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
                    end,
                    winbar = {
                        enabled = true,
                        name_formatter = function(term) --  term: Terminal
                            return term.name
                        end,
                    },
                }
                yazi:toggle()
            end,
            desc = "Toggle yazi",
        },
    },
}
