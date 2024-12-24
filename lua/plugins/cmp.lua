return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'windwp/nvim-autopairs',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind.nvim', -- Asegúrate de incluir lspkind como dependencia
	},
	event = 'InsertEnter',
	config = function()
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		local lspkind = require('lspkind')

		cmp.setup({
			mapping = {
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-e>'] = cmp.mapping.abort(),
				['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
				['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
				['<C-p>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item({ behavior = 'insert' })
					else
						cmp.complete()
					end
				end),
				['<C-n>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item({ behavior = 'insert' })
					else
						cmp.complete()
					end
				end),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			confirmation = { completeopt = 'menu,menuone,noinsert' }
		})

		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
