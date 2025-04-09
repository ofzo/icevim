return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        completion = {
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = true,
                show_with_menu = false, -- only show when menu is closed
            },
        },
        keymap = {
            preset = "enter",
        },
        cmdline = {
            completion = {
                menu = { auto_show = true },
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
            default = { "path", "snippets", "buffer", "lsp" },
        },
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
