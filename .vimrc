let g:onedark_termcolors=16

set number
imap jj <C-[>

set showcmd "Display incomplete commands
set scrolloff=5

" Copy paste
set clipboard=unnamed
vmap <C-c> :w !pbcopy<CR><CR>
map <C-x> :!pbcopy<CR>

" Python settings
set autoindent
set expandtab
filetype indent on
syntax on
autocmd FileType python setlocal commentstring=#\ %s ts=4 sts=4 sw=4 "supports commenting

" Set spacing in frontend
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

" Vim Markdown Plugin 
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'

" Switching buffers
let mapleader = ";"
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>

" Searching settings
set ignorecase
set hlsearch
set smartcase

set foldmethod=indent

" Pasting settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Speeding up CTRLP plugin
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_by_filename = 1

" Plug
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
call plug#end()

" Pathogen support
" execute pathogen#infect()

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

