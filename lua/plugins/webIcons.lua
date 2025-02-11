return {
  'nvim-tree/nvim-web-devicons',
  opts = function()
    require('nvim-web-devicons').setup({
      -- override = require('nvim-material-icon').get_icons(),
    })
  end
}
