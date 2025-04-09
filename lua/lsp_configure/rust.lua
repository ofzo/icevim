return {
    ["rust-analyzer"] = {
        auto = true,
        name = "rust_analyzer",
        setup = {
            setting = {
                diagnostics = {
                    enable = false,
                },
            },
        },
    },
    taplo = {
        auto = true,
    },
}
