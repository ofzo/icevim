-- Customize Treesitter

return {
    "nvim-treesitter/nvim-treesitter",
    opts = {},
    config = function()
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "javascript",
                "rust",
                "css",
                "html",
                "json",
                "toml",
                "typescript",
                "xml",
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["mf"] = "@function.outer",
                        ["mc"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["mF"] = "@function.outer",
                        ["mC"] = "@class.outer",
                    },
                },
                select = {
                    enable = true,
                    keymaps = {
                        ["msF"] = "@function.outer",
                        ["msf"] = "@function.inner",
                        ["msC"] = "@function.outer",
                        ["msc"] = "@function.inner",
                    },
                },
            },
        }
        vim.wo.foldmethod = "expr"
        vim.opt.foldlevel = 99 -- 设置折叠层级为最高（全部展开）
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
}
