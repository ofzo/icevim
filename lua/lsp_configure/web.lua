
local filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" }


return {
    eslint = {
        setup = {
            filetypes = filetypes
        }
    },
    ["emmet-ls"] = {
        setup = {
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        },
    },
    ["html-lsp"] = {
        formatter = "prettier",
    },
    ["json-lsp"] = {
        formatter = "prettier",
    },
    ["css-lsp"] = {
        formatter = "prettier",
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
    ["typescript-language-server"] = {
        formatter = "prettier",
        setup = {
            single_file_support = true,
            filetypes = filetypes,
            on_attach = function(client)
                if #vim.lsp.get_clients { name = "denols" } > 0 then
                    client.stop()
                end
            end,
        },
    }
}
