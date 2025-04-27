return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'windwp/nvim-autopairs',
		'L3MON4D3/LuaSnip',
		'onsails/lspkind.nvim',
	},
	event = 'InsertEnter',
	config = function()
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		local lspkind = require('lspkind')
		local tailwind_formatter = require('tailwindcss-colorizer-cmp').formatter

		lspkind.init({
			mode = 'symbol',
			preset = 'default',
			symbol_map = {
				Text = ' ',
				Method = ' ',
				Function = ' ',
				Constructor = ' ',
				Field = ' ',
				Variable = ' ',
				Class = ' ',
				Interface = ' ',
				Module = ' ',
				Property = ' ',
				Unit = ' ',
				Value = ' ',
				Enum = ' ',
				Keyword = ' ',
				Snippet = ' ',
				Color = ' ',
				File = ' ',
				Reference = ' ',
				Folder = ' ',
				EnumMember = ' ',
				Constant = ' ',
				Struct = ' ',
				Event = ' ',
				Operator = ' ',
				TypeParameter = ' ',
				Supermaven = "",
			}
		})

		local function truncate_text(text, max_length)
			if #text > max_length then
				return text:sub(1, max_length) .. '...'
			else
				return text
			end
		end

		cmp.setup({
			formatting = {
				fields = { 'kind', 'abbr' },
				format = function(entry, vim_item)
					-- 1. Aplicar lspkind
					vim_item.kind = lspkind.symbol_map[vim_item.kind] or ''

					-- 2. Truncar texto (opcional, si todavía lo quieres)
					local max_length = 20 -- Ajusta la longitud máxima
					vim_item.abbr = truncate_text(vim_item.abbr, max_length)

					-- 3. Aplicar el formateador de tailwindcss-colorizer-cmp
					--    Lo llamamos DESPUÉS de modificar kind y abbr
					vim_item = tailwind_formatter(entry, vim_item)

					return vim_item
				end,
			},
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
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'luasnip' },
			}),
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
		cmp.setup.cmdline(':', {
			sources = cmp.config.sources({
				{ name = 'cmdline' }
			})
		})
		cmp.config.formatting = {
			format = require('tailwindcss-colorizer-cmp').formatter
		}
		require('nvim-autopairs').setup({})
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
