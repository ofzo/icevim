require "opt"
require "keymap"
require "autocmd"
require "command"
require "lazy_setup"

if vim.fn.argc() == 1 then
    -- 转换为绝对路径并检查是否为目录
    local arg = tostring(vim.fn.argv(0)) -- 转换为 Lua 字符串
    local dir_path = vim.fn.fnamemodify(arg, ":p")
    if vim.fn.isdirectory(dir_path) == 1 then
        local safe_dir = vim.fn.fnameescape(dir_path)
        vim.cmd [[ Neotree show ]]
        vim.defer_fn(function()
            Snacks.picker.smart()
        end, 300)
    end
end
