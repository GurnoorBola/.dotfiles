return {
  {
    -- Guess indenting from file
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  {
    -- Plugin to send input to tmux from vim
    'preservim/vimux',
  },
  {
    -- Plugin for seamless tmux navigation
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Plugin to show keybinds
    'folke/which-key.nvim',
  },
  {
    -- Plugin to show git changes
    'lewis6991/gitsigns.nvim',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
