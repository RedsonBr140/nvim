local function config_module(path)
    local module_status_ok, module = pcall(require, path)

    if module_status_ok then
        return module
    else
        return nil
    end
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  config_module 'plugins.config.presence'
  
  use {
    'andweeb/presence.nvim'
  }
  -- UI Configuration
  use 'chriskempson/base16-vim'

  use { 
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = config_module 'plugins.config.lualine',
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    tag = "v2.*",
    config = config_module 'plugins.config.bufferline',
  }

  -- Workflow helpers
  use 'mattn/emmet-vim'

  use {
    "windwp/nvim-autopairs",
    config = config_module 'plugins.config.autopairs'
  }
  use { 
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    tag = 'nightly',
    config = config_module 'plugins.config.nvimtree',
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = config_module 'plugins.config.gitsigns'
  }

  use { 
    'neoclide/coc.nvim',
    branch = 'release'
  }


end)

