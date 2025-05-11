return {
    ["rust-analyzer"] = {
        auto = true,
        name = "rust_analyzer",
        setup = {
            setting = {
                diagnostics = {
                    enable = true,
                },
            },
        },
    },
    taplo = {
        auto = true,
    },
}
