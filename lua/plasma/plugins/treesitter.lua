return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = false,
    event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = vim.fn.argc(-1) == 0,
    config = function()
        vim.opt.foldlevel = 99
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "markdown", "markdown_inline", "rust", "python", "toml", "json", "html", "regex", "yaml" },
            sync_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            }
        })
    end,
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
}
