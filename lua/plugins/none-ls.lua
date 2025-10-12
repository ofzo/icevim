return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
        debug = false,
    },
    config = function(_, opts)
        local null_ls = require "null-ls"
        local formatting = null_ls.builtins.formatting

        local sources = {}
        local configure = require "lsp_configure"
        for _, config in pairs(configure) do
            if config.formatter then
                local source = formatting[config.formatter]
                sources[#sources + 1] = source
            end
        end

        null_ls.setup(vim.tbl_deep_extend("keep", opts, { sources = sources }))
        -- 保存时自动格式化（全局生效）
        vim.api.nvim_create_autocmd({ "FocusLost" }, {
            pattern = "*",
            callback = function()
                -- 执行格式化（使用 null-ls）
                vim.lsp.buf.format {
                    async = false, -- 必须同步执行，否则保存可能发生在格式化完成前
                    filter = function(client)
                        -- 仅使用 null-ls 进行格式化（避免与其他 LSP 冲突）
                        return client.name == "null-ls"
                    end,
                }
            end,
        })
    end,
}
