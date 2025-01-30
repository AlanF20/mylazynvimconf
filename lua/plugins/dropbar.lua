return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  opts = function()
    require('dropbar').setup({
      symbols = {
        icon = {
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
      }
    })

    local dropbar_api = require('dropbar.api')
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
  end
}
