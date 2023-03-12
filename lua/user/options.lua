local set = vim.opt
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[set fcs=eob:\ ]]
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- See whether it's using tabs or spaces.
set.list = true
set.listchars = "tab:» ,trail:·"

set.number = true
set.mouse = 'a'
set.clipboard = 'unnamedplus'

vim.notify = require("notify")
