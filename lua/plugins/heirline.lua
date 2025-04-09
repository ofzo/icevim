return {
    "rebelot/heirline.nvim",
    dependencies = {
        "Zeioth/heirline-components.nvim",
        "ofzo/palette",
    },
    opts = function(_, opts)
        local status = require "heirline-components.all"
        local heirline = require "heirline"
        local color = require "palette"
        local conditions = require "heirline.conditions"
        -- Setup
        status.init.subscribe_to_events()
        heirline.load_colors(status.hl.get_colors())
        opts.winbar = nil
        opts.tabline = nil

        local Git = {
            condition = conditions.is_git_repo,

            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,

            hl = { fg = color.green800 },

            { -- git branch name
                provider = function(self)
                    return "  " .. self.status_dict.head
                end,
                hl = { bold = false },
            },
            -- You could handle delimiters, icons and counts similar to Diagnostics
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = "(",
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
                hl = { fg = color.green600 },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
                hl = { fg = color.red600 },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
                hl = { fg = color.yellow600 },
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = ")",
            },
        }

        opts.statusline = {
            status.component.mode(),
            status.component.git_branch(Git),
            status.component.file_info(),
            status.component.git_diff(),
            status.component.diagnostics(),
            status.component.fill(),
            status.component.lsp(),
            status.component.nav(),
        }
        opts.statuscolumn = {
            init = function(self)
                self.bufnr = vim.api.nvim_get_current_buf()
            end,
            status.component.foldcolumn(),
            status.component.numbercolumn(),
            status.component.signcolumn {
                condition = function()
                    return true
                end,
            },
        }

        heirline.setup(opts)
    end,
}
