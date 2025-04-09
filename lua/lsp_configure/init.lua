-- For instructions on configuration, see official wiki:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local function merge(dest, ...)
    for _, src in ipairs { ... } do
        for key, value in pairs(src) do
            dest[key] = value
        end
    end
    return dest
end
return merge({}, require "lsp_configure.web", require "lsp_configure.lua", require "lsp_configure.rust")
