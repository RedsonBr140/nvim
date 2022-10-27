local lspcfg = require'lspconfig'

lspcfg.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspcfg.gopls.setup{}

lspcfg.vuels.setup{
	settings = {
		vetur = {
			completion = {
				autoImport = true,
				useScaffoldSnippets = true
			},
			format = {
				defaultFormatter = {
					html = "none",
					js = "prettier",
					css = "prettier"
				}
			},
			validation = {
				script = true,
				style = true,
				template = true
			}
		}
	}
}

lspcfg.html.setup{
	cmd = { "vscode-html-languageserver", "--stdio" }
}

lspcfg.rust_analyzer.setup{}

require'lsp_signature'.setup({
	bind = true,
	handler_opts = {
		border = "rounded"
	},
})

