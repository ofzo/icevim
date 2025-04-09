vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local color = require "palette"

        local mode = vim.api.nvim_get_mode()
        local str = string.format("%s", mode.mode)
        -- print("mode", str);
        local background = {
            i = { bg = color.green100 }, -- Insert mode
            r = { bg = color.green100 }, -- Replace mode
            ci = { bg = color.green100 }, -- Command-line Insert mode
            cr = { bg = color.green100 }, -- Command-line Replace mode
            n = { bg = color.sky100 }, -- Normal mode
            sm = { bg = color.sky100 }, -- showmatch in Insert mode
            v = { bg = color.sky100 }, -- Visual mode
            ve = { bg = color.sky100 }, -- Visual mode with 'selection' "exclusive" (same as 'v', if not specified)
            V = { bg = color.sky100 }, --  Visual Line mode
            c = { bg = color.white }, -- Command-line Normal (append) mode
            o = { bg = color.white }, -- Operator-pending mode
            no = { bg = color.white },
            ["^V"] = { bg = color.violet100 },
        }
        -- print("color = ", background[mode.mode])
        vim.api.nvim_set_hl(0, "CursorLine", background[mode.mode] or background.n)
        -- vim.api.nvim_set_hl(0, "CursorLineNr", background[mode.mode] or background.n)
        -- vim.api.nvim_set_hl(0, "CursorLineSign", background[mode.mode] or background.n)
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.sjs",
    callback = function()
        vim.bo.filetype = "javascriptreact"
        vim.bo.syntax = "javascript" -- 强制语法高亮
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.axml",
    callback = function()
        vim.bo.filetype = "html"
        vim.bo.syntax = "html" -- 强制语法高亮
    end,
})
