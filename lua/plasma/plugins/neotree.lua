return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    keys = {
        { "<leader>mf", ":Neotree<CR>", desc = "Open neotree" },
    },
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
            desc = "Start Neo-tree with directory",
            once = true,
            callback = function()
                if package.loaded["neo-tree"] then
                    return
                else
                    local stats = vim.uv.fs_stat(vim.fn.argv(0))
                    if stats and stats.type == "directory" then
                        require("neo-tree")
                    end
                end
            end,
        })
    end,
    opts = {
        close_if_last_window = false,
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        window = {
            mappings = {
                ["<ESC>"] = "cancel",
            },
            width = 35,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        }
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    }
}
