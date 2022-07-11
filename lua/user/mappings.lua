local n_keymap = function(key, command)
    vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
end

-- DOC: n_keymap('<C-s>', 'sim')
-- NOTE: vim_default_modes = { 'n', 'v', 's', 'x', 'o', '!', 'i', 'l', 'c', 't' }

n_keymap('<c-b>', ':NvimTreeToggle<cr>')
n_keymap('<silent>[b', ':BufferLineCycleNext')
n_keymap('<silent>b]', ':BufferLineCyclePrev')
