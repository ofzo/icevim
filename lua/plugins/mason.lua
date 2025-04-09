return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            border = "rounded",
            ---@since 1.0.0
            -- Width of the window. Accepts:
            -- - Integer greater than 1 for fixed width.
            -- - Float in the range of 0-1 for a percentage of screen width.
            width = 0.8,

            ---@since 1.0.0
            -- Height of the window. Accepts:
            -- - Integer greater than 1 for fixed height.
            -- - Float in the range of 0-1 for a percentage of screen height.
            height = 0.9,
        },
    },
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function(config, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local function install(package)
            local s, p = pcall(registry.get_package, package)
            if s and not p:is_installed() then
                p:install()
            end
        end

        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

        config.on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        local lspconfig = require "lspconfig"
        local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
        local installed_packages = registry.get_installed_package_names()

        local configure = require "lsp_configure"
        for lsp, cfg in pairs(configure) do
            if not cfg.enabled then
                goto continue
            end

            local formatter = cfg.formatter
            install(lsp)
            install(formatter)

            if not vim.tbl_contains(installed_packages, lsp) then
                goto continue
            end

            lsp = package_to_lspconfig[lsp]
            if not cfg.managed_by_plugin and lspconfig[lsp] ~= nil then
                local setup = cfg.setup
                if type(setup) == "function" then
                    setup = setup()
                elseif setup == nil then
                    setup = {}
                end

                setup = vim.tbl_deep_extend("force", setup, {
                    capabilities = require("blink.cmp").get_lsp_capabilities(),
                })

                lspconfig[lsp].setup(setup)
            end
            ::continue::
        end

        vim.cmd "LspStart"
    end,
}
