local function config_module(path)
			local module_status_ok, module = pcall(require, path)

			if module_status_ok then
					return module
			else
					return nil
			end
	end
local use = require('packer').use
	return require('packer').startup(function()
		use 'wbthomason/packer.nvim'

		use {
			'andweeb/presence.nvim',
			config = config_module 'plugins.config.presence'
		}
		-- UI Configuration
		use {
			'folke/todo-comments.nvim',
			config = config_module 'plugins.config.todo-comments'
		}
		use { 'catppuccin/nvim', as = "catppuccin", config = config_module 'plugins.config.catppuccin'}

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
		use 'editorconfig/editorconfig-vim'
		use 'fatih/vim-go'
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} },
		}
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

		-- LSP And related
		use {
			'neovim/nvim-lspconfig',
			config = config_module 'plugins.config.lspconfig'
		}
		-- Autocomplete
	use {
		'hrsh7th/nvim-cmp',
		config = config_module 'plugins.config.autocomplete'
	} -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use {
		'L3MON4D3/LuaSnip',
		config = require("luasnip.loaders.from_vscode").lazy_load(),
		requires = 'rafamadriz/friendly-snippets'
	} -- Snippets plugin

end)

