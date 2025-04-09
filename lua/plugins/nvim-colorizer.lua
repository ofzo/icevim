return {
    "NvChad/nvim-colorizer.lua",
    opts = {
        user_default_options = {
            virtualtext = "●",
            mode = "virtualtext",
            -- mode = "foreground",
            virtual_symbol_position = "inline",
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            names = true, -- "Name" codes like Blue or blue
            RRGGBBAA = true, -- #RRGGBBAA hex codes
            sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
            tailwind = true, -- Enable tailwind colors
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        },
    },
}
