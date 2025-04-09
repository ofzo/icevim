return {
    "brenton-leighton/multiple-cursors.nvim",
    event = "VeryLazy",
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
        { "<S-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x", "i" }, desc = "Add cursor and move down" },
        { "<S-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x", "i" }, desc = "Add cursor and move up" },
    },
}
