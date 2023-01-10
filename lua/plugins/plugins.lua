local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct


local function config_module(path)
	local module_status_ok, module = pcall(require, path)
	if module_status_ok then
		return module
	else
		return nil
	end
end

require('lazy').setup({
	{
	 'andweeb/presence.nvim',
	 config = function ()
		config_module 'plugins.config.presence'
	end,
	},
	-- UI Configuration
	"ellisonleao/gruvbox.nvim",
	{
	 'folke/todo-comments.nvim',
	 config = function()
		config_module 'plugins.config.todo-comments'
	 end
	},
	{
	 'nvim-lualine/lualine.nvim',
	 dependencies = 'kyazdani42/nvim-web-devicons',
	 config = function ()
		config_module('plugins.config.lualine')
	end,
	},
	{
	 'akinsho/bufferline.nvim',
	 dependencies = {'kyazdani42/nvim-web-devicons'},
	 version = "v2.*",
	 config  = function()
		config_module 'plugins.config.bufferline'
	 end,
	},
	{
	 'nvim-treesitter/nvim-treesitter',
	 config = function()
		config_module 'plugins.config.treesitter'
	end,
	 build = ':TSUpdate'
	},

	-- Workflow helpers
	'mattn/emmet-vim',
	'editorconfig/editorconfig-vim',
	'fatih/vim-go',
	'manzeloth/live-server',

	{
	 'nvim-telescope/telescope.nvim',
	 dependencies = 'nvim-lua/plenary.nvim',
	},

	{
	 "windwp/nvim-autopairs",
	 config = function()
		config_module 'plugins.config.autopairs'
	end
	},

	{
	 'kyazdani42/nvim-tree.lua',
	 dependencies = {'kyazdani42/nvim-web-devicons'},
	 version = 'nightly',
	 config = config_module 'plugins.config.nvimtree',
	},

	{
	 'lewis6991/gitsigns.nvim',
	 config = function()
		config_module 'plugins.config.gitsigns'
	end
	},

	-- LSP And related
	{
	 'neovim/nvim-lspconfig',
	 config = function()
		config_module 'plugins.config.lspconfig'
	end
	},

	-- Autocomplete
	'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
	'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
	'ray-x/lsp_signature.nvim', -- Function args above of them.


	{
	 'hrsh7th/nvim-cmp',
	 config = function()
		config_module 'plugins.config.autocomplete'
	end
	}, -- Autocompletion plugin

	{
	 'L3MON4D3/LuaSnip',
	 dependencies = 'rafamadriz/friendly-snippets',
	 config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	 end
	}, -- Snippets plugin
})
