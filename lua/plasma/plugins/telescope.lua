return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers" },
        { "<leader>fh", ":Telescope help_tags<CR>", desc = "Find Helps" },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "Find String" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                initial_mode = "insert",
                mappings = {
                    i = {
                        -- 上下移动
                        ["<A-j>"] = "move_selection_next",
                        ["<A-k>"] = "move_selection_previous",
                        -- 历史记录
                        ["<Down>"] = "cycle_history_next",
                        ["<Up>"] = "cycle_history_prev",
                        -- 预览窗口上下滚动
                        ["<A-u>"] = "preview_scrolling_up",
                        ["<A-d>"] = "preview_scrolling_down",
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        })
        require("telescope").load_extension("fzf")
    end
}
