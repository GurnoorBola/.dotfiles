return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    local languages = {
      'lua',
      'python',
      'c',
      'cpp',
      'glsl',
      'kotlin',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'dockerfile',
      'json',
      'java',
      'go',
      'gitignore',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'css',
      'html',
    }

    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function()
        -- Enable syntax highlighting
        vim.treesitter.start()

        -- Enable folding
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'

        vim.wo.foldlevel = 99
      end,
    })
  end,
}
