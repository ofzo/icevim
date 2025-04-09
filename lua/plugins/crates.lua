return {
    "saecki/crates.nvim",
    lazy = true,
    event = { "BufRead Cargo.toml" },
    opts = {
        completion = {
            crates = {
                enabled = true,
            },
        },
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },
    },
}
