return {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    keys = {
        { "<leader>pp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        { "<A-n>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<A-m>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
        options = {
            always_show_bufferline = false,
        }
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end,
}
