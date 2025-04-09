-- You can disable default plugins as follows:
local plugins = {
    "vuki656/package-info.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "saadparwaiz1/cmp_luasnip",
    "stevearc/aerial.nvim",
    "L3MON4D3/LuaSnip",
    "lukas-reineke/indent-blankline.nvim",
    "rcarriga/nvim-notify",
    "max397574/better-escape.nvim",
    "RRethy/vim-illuminate",
    "hrsh7th/cmp-buffer",
    "folke/neoconf.nvim",
    -- "folke/which-key.nvim",
}

local expose = {}

for i = 1, #plugins do
    table.insert(expose, {
        plugins[i],
        enabled = false,
    })
end

return expose
