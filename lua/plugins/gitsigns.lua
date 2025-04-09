return {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable "git" == 1,
    event = "VeryLazy",
    opts = {
        signs_staged_enable = true,
        auto_attach = true,
        signcolumn = true,
        current_line_blame = true,
        current_line_blame_formatter = "<author_time:%R> @<author> <summary>",
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
        },
    },
}
