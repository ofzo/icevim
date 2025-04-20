require "lazy_setup"
require "opt"
require "keymap"
require "autocmd"
require "command"

-- 加载目录中的所有 .vim 文件
-- local files = vim.fn.glob("./vimrc/*.vim", true, true)
--
-- for _, file in ipairs(files) do
--     vim.cmd("source " .. file)
-- end

vim.cmd [[ Neotree left ]]
