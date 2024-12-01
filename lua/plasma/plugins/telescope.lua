return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fb", ":Telescope buffers<CR>",    desc = "Find Buffers" },
        { "<leader>fh", ":Telescope help_tags<CR>",  desc = "Find Helps" },
        { "<leader>fg", ":Telescope live_grep<CR>",  desc = "Find String" },
        { "<leader>fk", ":Telescope keymaps<CR>",    desc = "Find Keymaps" },
        { "<leader>fp", ":Telescope projects<CR>",   desc = "Find Projects" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
        "nvim-telescope/telescope-project.nvim",
        "ahmedkhalf/project.nvim",
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
                        ["<C-k>"] = "preview_scrolling_up",
                        ["<C-j>"] = "preview_scrolling_down",
                        ["<C-h>"] = "preview_scrolling_left",
                        ["<C-l>"] = "preview_scrolling_right"
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
        require("telescope").load_extension("project")
    end
}
