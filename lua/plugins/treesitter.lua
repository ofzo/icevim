-- Customize Treesitter

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = "VeryLazy",
    -- lazy = vim.fn.argc(-1) == 0, -- load treesitter immediately when opening a file from the cmdline
    opts = {},
    keys = {
        {
            "msf",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@function.inner"
            end,
            desc = "Select @function.inner",
        },
        {
            "msF",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@function.outer"
            end,
            desc = "Select @function.outer",
        },
        {
            "msc",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@class.inner"
            end,
            desc = "Select @class.inner",
        },
        {
            "msC",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@class.outer"
            end,
            desc = "Select @class.outer",
        },
        {
            "msb",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@block.inner"
            end,
            desc = "Select @block.inner",
        },
        {
            "msB",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@block.outer"
            end,
            desc = "Select @block.outer",
        },
        {
            "ms/",
            function()
                require("nvim-treesitter.textobjects.select").select_textobject "@comment.outer"
            end,
            desc = "Select @comment.outer",
        },
    },
    config = function()
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "rust",
                "css",
                "html",
                "json",
                "toml",
                "typescript",
                "xml",
                "sql",
                "tsx",
                "scss",
                "vue",
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = vim.fn.executable "git" == 1 and vim.fn.executable "tree-sitter" == 1, -- only enable auto install if `tree-sitter` cli is installed
            indent = { enable = true },
            highlight = { enable = true },
            incremental_selection = { enable = true },
        }
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
}
