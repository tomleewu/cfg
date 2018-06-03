let g:onedark_termcolors=16

set number
imap jj <C-[>

set showcmd "Display incomplete commands
set scrolloff=5

" Python settings
set autoindent
set expandtab
filetype indent on
syntax on
autocmd FileType python setlocal commentstring=#\ %s ts=4 sts=4 sw=4 "supports commenting

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Searching settings
set ignorecase
set hlsearch
set smartcase

set foldmethod=indent

" Pathogen support
 execute pathogen#infect()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
       set termguicolors
    endif
endif

colorscheme onedark

