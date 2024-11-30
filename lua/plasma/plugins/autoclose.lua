return {
    "m4xshen/autoclose.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    config = function()
        require("autoclose").setup({})
    end
}
