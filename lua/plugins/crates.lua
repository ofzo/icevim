return {
    "Saecki/crates.nvim",
    lazy = true,
    opts = {
        completion = {
            cmp = { enabled = true },
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
