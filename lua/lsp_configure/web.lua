return {
    -- ["eslint-lsp"] = {
    --     auto = true,
    -- },
    ["emmet-ls"] = {
        name = "emmet_ls",
        setup = {
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        },
    },
    ["html-lsp"] = {
        formatter = "prettier",
        name = "html",
    },
    ["json-lsp"] = {
        formatter = "prettier",
        name = "jsonls",
    },
    ["css-lsp"] = {
        formatter = "prettier",
        name = "cssls",
        setup = {
            settings = {
                css = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore",
                    },
                },
                less = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore",
                    },
                },
                scss = {
                    validate = true,
                    lint = {
                        unknownAtRules = "ignore",
                    },
                },
            },
        },
    },
    ["css_variables-language-server"] = {},
    ["stylelint_lsp"] = {},
    ["typescript-language-server"] = {
        formatter = "prettier",
        name = "ts_ls",
        setup = {
            single_file_support = true,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all", -- 参数名
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true, -- 函数参数类型
                        includeInlayVariableTypeHints = true, -- 变量类型
                    },
                },
            },
            on_attach = function(client)
                if #vim.lsp.get_clients { name = "denols" } > 0 then
                    client.stop()
                end
            end,
        },
    },
}
