return {
    "nvimtools/none-ls.nvim",
    event = "LspAttach",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local null = require("null-ls")
        null.setup({
            null.builtins.formatting.stylua,
            null.builtins.completion.spell,
        })
    end,
    init = function()
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf()")
    end,
}
