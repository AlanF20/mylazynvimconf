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
		'onsails/lspkind.nvim',
	},
	event = 'InsertEnter',
	config = function()
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		local lspkind = require('lspkind')

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
					local max_length = 20 -- Ajusta la longitud máxima según tus necesidades
					vim_item.abbr = truncate_text(vim_item.abbr, max_length)
					vim_item.kind = lspkind.symbol_map[vim_item.kind] or ''
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
				{ name = 'vsnip' },
			}),
			window = {
				completion = {
					border = 'rounded',
					winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
					col_offset = -3,
					side_padding = 0,
					max_height = 5, -- Ajusta la altura máxima del menú
				},
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
