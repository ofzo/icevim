local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
end

return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    keys = {
        {
            "z<space>",
            function()
                require("ufo").peekFoldedLinesUnderCursor()
            end,
            desc = "Peek Fold or Hover",
        },
    },
    opts = {},
    config = function()
        require("ufo").setup {
            provider_selector = function() -- 优先使用 Treesitter 折叠
                return { "treesitter", "indent" }
            end,
            preview = { -- 折叠预览窗口配置
                win_config = {
                    border = "rounded", -- 圆角边框
                },
            },
            fold_virt_text_handler = handler,
        }
    end,
}
