return {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
        "ofzo/palette",
    },
    opts = {
        -- configuration options...
        flavour = "auto",
        -- color_overrides = {
        --     all = {
        --         text = "#1f2937",
        --     },
        -- },
        transparent_background = true,
        custom_highlights = function()
            local color = require "palette"
            return {
                Normal = { fg = color.black },
                NeoTreeRootName = { fg = color.gray300 },
                NeoTreeWinSeparator = { fg = color.white },
                NeoTreeDirectoryName = { fg = color.gray800 },
                NeotreeFileName = { fg = color.black },
                NotifyBackground = { bg = color.gray300 },
                CursorLineNr = { fg = color.fuchsia500, style = { "bold" } },
                CursorLine = { bg = color.sky100 },
                -- CursorLineSign = { bg = color.sky100 },
                Pmenu = { bg = color.white, fg = color.gray800 },
                PmenuSel = { bg = color.sky100, fg = color.red600 },
                Visual = { bg = color.red100, style = {} },
                LspReferenceRead = { bg = color.lime100 },
                UfoFoldedEllipsis = { fg = color.lime600, bg = color.lime100 },
                Function = { fg = color.violet600 },
                Include = { fg = color.fuchsia600, style = {} },
                IndentLineCurrent = { fg = color.gray200 },
                IndentLine = { fg = color.gray200 },

                TodoBgFIX = { bg = color.white },
                TodoBgNOTE = { bg = color.white },
                TodoBgHACK = { bg = color.white },
                TodoBgTODO = { bg = color.white },
                TodoBgWARN = { bg = color.white },
                TodoBgPERF = { bg = color.white },
                TodoBgTEST = { bg = color.white },

                Cursor = { bg = color.sky200, style = {} },
                lCursor = { bg = color.sky200, style = {} },
                CursorIM = { bg = color.sky200 },
                ----

                DiagnosticUnderlineError = { bg = color.red50, style = {} },
                DiagnosticUnderlineWraning = { bg = color.yellow50, style = {} },

                Special = { fg = color.fuchsia600 },
                ["@field"] = { fg = color.rose600 },
                ["@property"] = { fg = color.red600 },
                ["@number"] = { fg = color.fuchsia600, style = { "bold" } },
                ["@boolean"] = { fg = color.fuchsia600 },
                ["@keyword"] = { fg = color.fuchsia600, style = {} },
                ["@keyword.function"] = {
                    fg = color.purple600,
                    style = { "italic" },
                },
                ["@function.macro"] = {
                    fg = color.rose600,
                    style = { "italic" },
                },
                ["@function.builtin.lua"] = { fg = color.purple600, style = { "italic" } },
                ["@keyword.coroutine.rust"] = {
                    fg = color.fuchsia600,
                },
                ["@variable.member"] = { fg = color.gray800 },
                ["@method.call"] = { style = { "italic" } },
                ["@module"] = { fg = color.gray800 },

                rustCommentLineDoc = { fg = color.gray400 },
                cssMedia = { fg = color.violet800 },
                WhichKeyDesc = { fg = color.gray800 },

                BlinkCmpMenu = { bg = color.rose100 },
                BlinkCmpDoc = { bg = color.white },
                BlinkCmpMenuBorder = { fg = color.purple600 },
                BlinkCmpMenuSelection = { fg = color.white, bg = color.rose600 },
                FloatBorder = { fg = color.red600 },
                SagaBorder = { fg = color.red600 },

                CodeActionText = { fg = color.gray800 },
                CodeActionNumber = { fg = color.gray800 },
                CodeActionCursorLine = { fg = color.red100, bg = color.red100 },
                UfoFoldedBg = { bg = color.green200 },
                MoreMsg = { bg = color.lime100 },

                MultiCursor = { bg = color.rose100 },
                MultiCursorMain = { bg = color.rose200 },
            }
        end,
        integrations = {
            notify = false,
            cmp = false,
            blink_cmp = true,
            dap = false,
            dap_ui = false,
            ufo = true,
            dashboard = false,
            alpha = true,
            mini = false,
            neogit = false,
            nvimtree = false,
            semantic_tokens = false,
            treesitter = true,
            treesitter_context = false,
            illuminate = false,
            lsp_saga = true,
            telescope = true,
            which_key = true,
            neotree = {
                enabled = true,
                show_root = true, -- makes the root folder not transparent
                transparent_panel = false, -- make the panel transparent
            },
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        -- load the colorscheme here
        vim.cmd [[colorscheme catppuccin]]
    end,
}
