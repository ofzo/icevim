return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        {
            "<leader>e",
            function()
                vim.cmd [[ Neotree left reveal ]]
            end,
            desc = "Toggle Explorer Focus",
        },
        {
            "<leader>E",
            function()
                vim.cmd [[ Neotree float reveal ]]
            end,
            desc = "Toggle Float Explorer Focus",
        },
        {
            "<leader>g",
            function()
                vim.cmd [[ Neotree float git_status ]]
            end,
            desc = "Show Git Status",
        },
    },
    opts = function()
        local symbols = require "symbols"
        return {
            auto_clean_after_session_restore = true,
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            -- sources = { "filesystem", "git_status" },
            -- source_selector = {
            --     winbar = true,
            --     content_layout = "center",
            --     sources = {
            --         { source = "filesystem", display_name = symbols.("FolderClosed", 1, true) .. "File" },
            --         -- { source = "buffers", display_name = symbols.("DefaultFile", 1, true) .. "Bufs" },
            --         { source = "git_status", display_name = symbols.("Git", 1, true) .. "Git" },
            --         -- { source = "diagnostics", display_name = symbols.("Diagnostic", 1, true) .. "Diagnostic" },
            --     },
            -- },
            window = {
                position = "left",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"] = "none", -- 禁用默认展开键
                    ["f"] = function()
                        local builtin = require "telescope.builtin"
                        builtin.find_files()
                    end,
                    ["<leader>f"] = function()
                        local builtin = require "telescope.builtin"
                        builtin.find_files()
                    end,
                },
            },
            filesystem = {
                -- hijack_netrw_behavior = "open_current", -- 接管 netrw
                use_libuv_file_watcher = true, -- 使用 libuv 文件监视（推荐）
                filtered_items = {
                    hide_by_name = {
                        "node_modules",
                    },
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    never_show = { ".DS_Store" },
                },
                follow_current_file = { enable = true },
            },
            default_component_configs = {
                indent = {
                    padding = 0,
                    -- indent_marker = " ",
                    with_markers = false,
                    expander_collapsed = " ",
                    expander_expanded = " ",
                },
                icon = {
                    folder_closed = symbols.FolderClos,
                    folder_open = symbols.FolderOpen,
                    folder_empty = symbols.FolderEmpty,
                    folder_empty_open = symbols.FolderEmpty,
                    default = symbols.DefaultFile,
                },
                modified = { symbol = symbols.FileModified },
                git_status = {
                    symbols = {
                        added = " ", -- symbols.GitAdd,
                        deleted = " ", --  symbols.GitDelete,
                        modified = " ", --symbols.GitChange,
                        renamed = " ", -- symbols.GitRenamed,
                        untracked = " ", -- symbols.GitUntracked,
                        ignored = " ", -- symbols.GitIgnored,
                        unstaged = " ", -- symbols.GitUnstaged,
                        staged = " ", --symbols.GitStaged,
                        conflict = " ", -- symbols.GitConflict,
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        local symbols = require "symbols"
        vim.diagnostic.config {
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = symbols.DiagnosticError,
                    [vim.diagnostic.severity.WARN] = symbols.DiagnosticWarn,
                    [vim.diagnostic.severity.INFO] = symbols.DiagnosticInfo,
                    [vim.diagnostic.severity.HINT] = symbols.DiagnosticHint,
                },
            },
        }

        require("neo-tree").setup(opts)
        -- 检查参数数量是否为1（排除 Neovim 自身参数）
        if vim.fn.argc() == 1 then
            -- 转换为绝对路径并检查是否为目录
            local arg = tostring(vim.fn.argv(0)) -- 转换为 Lua 字符串
            local dir_path = vim.fn.fnamemodify(arg, ":p")
            if vim.fn.isdirectory(dir_path) == 1 then
                -- 安全转义路径中的特殊字符
                local safe_dir = vim.fn.fnameescape(dir_path)
                -- 打开 NeoTree 并聚焦
                vim.cmd [[ Neotree show ]]
                vim.defer_fn(function()
                    vim.cmd [[ Neotree focus ]]
                end, 300)
            end
        end
    end,
}
