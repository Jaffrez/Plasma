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
                }
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

            for server,config in pairs(configs) do
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
            { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename Variable" },
            { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
            { "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show definition" },
        }
    }
}
