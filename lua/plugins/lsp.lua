return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'VonHeikemen/lsp-zero.nvim' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
		{ 'Issafalcon/lsp-overloads.nvim' },
		{ 'lukas-reineke/lsp-format.nvim' }, -- Agregar lsp-format.nvim
	},
	config = function()
		local lsp_zero = require('lsp-zero')
		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			if client.server_capabilities then
				print("Server capabilities detected for " .. client.name)
				if client.server_capabilities.signatureHelpProvider then
					print("Signature help available for " .. client.name)
					require('lsp-overloads').setup(client, {})
				end
			else
				print("Warning: server_capabilities is nil for " .. client.name)
			end
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = { 'ts_ls', 'rust_analyzer' },
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
			},
		})

		require('lspconfig').ts_ls.setup {
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				"vue",
			},
		}

		-- Configurar lsp-format
		require("lsp-format").setup {}

		-- Configurar gopls con lsp-format
		require('lspconfig').gopls.setup {
			on_attach = function(client, bufnr)
				require("lsp-format").on_attach(client, bufnr)
				lsp_zero.on_attach(client, bufnr)
			end
		}
	end,
}
