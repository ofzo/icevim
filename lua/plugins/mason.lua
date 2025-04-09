return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            border = "rounded",
            width = 0.6,
            height = 0.6,
        },
        ensure_installed = { "prettier" },
        registries = {
            "github:mason-org/mason-registry",
        },
        github = {
            ---@since 1.0.0
            -- The template URL to use when downloading assets from GitHub.
            -- The placeholders are the following (in order):
            -- 1. The repository (e.g. "rust-lang/rust-analyzer")
            -- 2. The release version (e.g. "v0.3.0")
            -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
            download_url_template = "https://goppx.com/https://github.com/%s/releases/download/%s/%s",
        },
    },
    config = function(config, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local function install(package)
            local s, p = pcall(registry.get_package, package)
            if s and not p:is_installed() then
                print(string.format("%s: %s", "[Mason] Installing", package))
                p:install()
            end
        end

        -- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

        config.on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        local lspconfig = require "lspconfig"
        local package_to_lspconfig = require("mason-lspconfig.mappings.server").package_to_lspconfig
        local installed_packages = registry.get_installed_package_names()

        local configure = require "lsp_configure"
        for name, cfg in pairs(configure) do
            -- if not cfg.enabled then
            --     goto continue
            -- end

            local formatter = cfg.formatter
            install(name)
            if cfg.formatter then
                install(cfg.formatter)
            end

            if not vim.tbl_contains(installed_packages, name) then
                goto continue
            end

            local lsp_name = package_to_lspconfig[name]

            local setup = cfg.setup
            if type(setup) == "function" then
                setup = setup()
            elseif setup == nil then
                setup = {}
            end

            setup = vim.tbl_deep_extend("force", setup, {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                inlay_hints = {
                    enabled = true,
                },
            })

            if cfg.name ~= nil then
                lspconfig[cfg.name].setup(setup)
                goto continue
            end

            if lspconfig[name] ~= nil then
                lspconfig[name].setup(setup)
            elseif lspconfig[lsp_name] ~= nil then
                lspconfig[lsp_name].setup(setup)
            else
                print("lsp not found: " .. name)
            end
            ::continue::
        end
        vim.diagnostic.config {
            update_in_insert = true,
            severity_sort = true, -- necessary for lspsaga's show_line_diagnostics to work
            virtual_text = true,
        }

        vim.cmd "LspStart"
    end,
}
