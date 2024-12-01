return {
    {
        "Saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        build = "cargo build --release",
        opts = {
            keymap = {
                preset = "default",
                ["<A-k>"] = { "select_prev", "fallback" },
                ["<A-j>"] = { "select_next", "fallback" },
                ["<C-u>"] = { "scroll_documentation_down" },
                ["<C-d>"] = { "scroll_documentation_up" },
                ["<CR>"] = { "accept", "fallback" },
            },
            fuzzy = {
                prebuilt_binaries = {
                    download = false
                }
            },
            completion = {
                documentation = {
                    auto_show = true,
                },
                trigger = {
                    show_on_insert_on_trigger_character = false,
                },
            }
        }
    },
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd" },
                automatic_installation = true,
            })

            local configs = require("plasma.lsp")
            local lsp = require("lspconfig")

            for server, config in pairs(configs) do
                lsp[server].setup(config)
            end

            for server, config in pairs(opts.servers or {}) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lsp[server].setup(config)
            end
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "Saghen/blink.cmp"
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^5',
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        keys = {
            { "<leader>rn", "<cmd>Lspsaga rename<CR>",           desc = "Rename Variable" },
            { "<leader>ca", "<cmd>Lspsaga code_action<CR>",      desc = "Code Action" },
            { "gd",         "<cmd>Lspsaga goto_definition<CR>",  desc = "Go to definition" },
            { "gh",         "<cmd>Lspsaga hover_doc<CR>",        desc = "Show definition" },
            { "gr",         "<cmd>Lspsaga finder<CR>",           desc = "Find reference" },

            { "ff",         "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Code" },
        }
    }
}
