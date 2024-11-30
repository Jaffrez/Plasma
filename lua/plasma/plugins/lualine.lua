return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = { extensions = { "lazy" },},
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
            },
        })
    end,
}
