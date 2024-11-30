return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        local lazy_stats = require("lazy.stats").stats()
        local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
        require("dashboard").setup({
            theme = "doom",
            config = {
                header = {
                    [[]],
                    [[]],
                    [[]],
                    [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                    [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                    [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                    [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                    [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                    [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                    [[]],
                },
                center = {
                    {
                        icon = " ",
                        key = "pp",
                        desc = "Find Projects              ",
                        action = "Telescope projects",
                    },
                    {
                        icon = " ",
                        key = "ff",
                        desc = "Find Files                 ",
                        action = "Telescope find_files",
                    },
                    {
                        icon = " ",
                        key = "tt",
                        desc = "Find Text                  ",
                        action = "Telescope live_grep",
                    },
                    {
                        icon = " ",
                        key = "rr",
                        desc = "Recently Files             ",
                        action = "Telescope oldfiles",
                    },
                    {
                        icon = "󰧹 ",
                        key = "mm",
                        desc = "Find Keymaps               ",
                        action = "Telescope keymaps",
                    },
                    { 
                        icon = " ",
                        key = "cc",
                        desc = "Change Theme               ", 
                        action = "Telescope colorscheme"
                    },
                    {
                        icon = "󰋗 ",
                        key = "pp",
                        desc = "Help                       ",
                        action = "Telescope help_tags",
                    },
                },
                footer = {
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "luzyi   Rust"
                },
            }
        })
    end,
    dependencies = { {"nvim-tree/nvim-web-devicons"}},
}
