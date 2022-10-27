require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	-- A list of parser names, or "all"
	ensure_installed = { "go", "gomod", "lua", "vue" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

	-- Automatically install missing parsers when entering buffer
  auto_install = true,

}

