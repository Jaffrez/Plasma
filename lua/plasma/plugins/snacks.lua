---@diagnostic disable: undefined-global
return {
    "folke/snacks.nvim",
    priority = 100,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        lazygit = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Open lazygit" },
        { "<A-`>", function() Snacks.terminal() end, desc = "Open terminal" },
    },
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    }
}
