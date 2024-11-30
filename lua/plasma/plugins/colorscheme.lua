return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 100,
        config = function()
            vim.cmd.colorscheme("tokyonight-storm")
        end,
    }
}
