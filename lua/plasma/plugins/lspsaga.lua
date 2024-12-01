return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        finder_action_keys = {
            open = "<CR>",
            vsplit = "s",
            split = "i",
            quit = "<ESC>",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },
        code_action_keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
        rename_action_keys = {
            quit = "<ESC>",
            exec = "<CR>",
        },
    },
    config = function (_, opts)
        require("lspsaga").setup(opts)
    end
}
