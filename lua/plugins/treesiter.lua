return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "c", "lua", "vim", "javascript", "rust", "typescript"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
