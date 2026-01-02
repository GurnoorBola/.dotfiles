return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require('neo-tree').setup {
      -- Add configuration if necessary from docs
    }
    vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
    vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { noremap = true, silent = true }) -- focus file explorer
    vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', { noremap = true, silent = true }) -- open git status window
  end,
}
