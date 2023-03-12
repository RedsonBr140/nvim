vim.g.catppuccin_flavour = "mocha"
require('catppuccin').setup({
    integrations = {
        coc_nvim = true,
        telescope = true,
        neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = false
        }
    }
})
