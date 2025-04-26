return {
    "goolord/alpha-nvim",
    -- dependencies = { "echasnovski/mini.icons" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    config = function()
        local startify = require "alpha.themes.startify"
        -- available: devicons, mini, default is mini
        -- if provider not loaded and enabled is true, it will try to use another provider
        startify.file_icons.provider = "devicons"
        require("alpha").setup(startify.config)
        local args = vim.fn.argv()

        -- 场景3: 无参数打开 dashboard
        if #args == 0 then
            require("alpha").start()
            return
        end
    end,
}
