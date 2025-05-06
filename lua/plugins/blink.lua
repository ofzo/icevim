return {
    "saghen/blink.cmp",
    -- version = "*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        completion = {
            keyword = { range = "full" },
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                    scrollbar = false,
                    max_width = 120,
                    max_height = 16,
                },
            },
            ghost_text = {
                enabled = true,
                show_with_menu = false, -- only show when menu is closed
            },
            menu = {
                scrollbar = false,
                draw = {
                    columns = { { "kind_icon", gap = 4 }, { "label", "label_description" }, { "kind" } },
                    treesitter = { "lsp" },
                },
            },
        },
        -- signature = {
        --     enabled = true,
        --     trigger = {
        --         enabled = true,
        --         show_on_keyword = false,
        --     },
        --     window = {
        --         border = "rounded",
        --         scrollbar = false,
        --         max_width = 120,
        --         max_height = 16,
        --     },
        -- },
        keymap = {
            preset = "enter",
            -- ["<CR>"] = {
            --     function(cmp)
            --         cmp.select_and_accept()
            --     end,
            --     "fallback",
            -- },
        },
        cmdline = {
            keymap = {
                ["<CR>"] = { "accept", "accept_and_enter", "fallback" },
                ["<Space>"] = { "accept", "fallback" },
                ["<Tab>"] = { "show", "show_and_insert", "select_next" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
            },
            completion = {
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() ~= ":"
                        -- enable for inputs as well, with:
                        -- or vim.fn.getcmdtype() == '@'
                    end,
                    draw = {
                        columns = { { "label", "label_description" } },
                    },
                },
            },
            sources = function()
                local cmd_type = vim.fn.getcmdtype()
                if cmd_type == "/" or cmd_type == "?" then
                    return { "buffer" }
                end
                if cmd_type == ":" then
                    return { "cmdline" }
                end
                return {}
            end,
        },
        sources = {
            default = { "path", "lsp", "snippets", "buffer" },
            min_keyword_length = 1,
            providers = {
                lsp = {
                    min_keyword_length = 0,
                },
            },
        },
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = "prefer_rust",
            prebuilt_binaries = {
                force_version = "1.1.1",
            },
        },
    },
}
