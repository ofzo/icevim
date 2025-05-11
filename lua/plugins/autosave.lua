return {
    "Pocco81/auto-save.nvim",
    enabled = true,
    config = function()
        require("auto-save").setup {
            enabled = false, -- 默认启用
            trigger_events = { "InsertLeave", "TextChanged", "FocusLost" }, -- 触发事件
            debounce_delay = 500, -- 防抖延迟（毫秒）
            execution_message = {
                message = function()
                    return ""
                end,
            },
            condition = function(buf)
                -- 排除条件（示例）
                local status, filename = pcall(vim.api.nvim_buf_get_name, buf)
                if not status then
                    return false
                end
                return filename:match "COMMIT_EDITMSG"
            end,
        }
    end,
}
