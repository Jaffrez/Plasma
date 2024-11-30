-- check for neovim
if vim.g.neovide then
    vim.opt.guifont = "JetbrainsMono Nerd Font: h14"
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 240
    vim.g.neovide_refresh_rare_idle = 30
end
