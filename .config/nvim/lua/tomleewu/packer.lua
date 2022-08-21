local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'rhysd/clever-f.vim'
  -- use 'sheerun/vim-polyglot'
  use 'tpope/vim-commentary'
  use 'Townk/vim-autoclose'
  -- disables search highlighting after cursor movement
  use 'romainl/vim-cool'
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  -- open files in github
  use { 'tpope/vim-rhubarb', requires = { { 'tpope/vim-fugitive' } }}
  use 'alexghergh/nvim-tmux-navigation'
  -- automated indention, replace me
  use 'tpope/vim-sleuth'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'ggandor/leap.nvim', config = function() require'leap'.set_default_keymaps() end }
  -- colorscheme
  use 'tomleewu/vim-paper'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function() require'nvim-surround'.setup() end
  }

  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
  use 'lewis6991/impatient.nvim'

  -- requires ripgrep
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
