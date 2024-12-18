return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Opcional, para los íconos
    'lewis6991/gitsigns.nvim', -- Opcional, para mostrar cambios git
  },
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Navegación entre buffers
    map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)

    -- Reordenar buffers
    map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

    -- Ir a una posición específica de buffer
    for i = 1, 9 do
      map('n', string.format('<leader>%d', i), string.format('<Cmd>BufferGoto %d<CR>', i), opts)
    end

    -- Cerrar buffer actual
    map('n', '<C-w>', '<Cmd>bd<CR>', opts)

    -- Configuración de Barbar
    require('barbar').setup {
      animation = true,
      tabpages = true,
      clickable = true,
      icons = {
        buffer_index = false,
        buffer_number = false,
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
      },
			name_formatter = function(buf)  -- Cambia el nombre de la pestaña
        local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
    		local parent = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":h:t")
    		return parent .. "/" .. bufname
      end,
    }
  end
}

