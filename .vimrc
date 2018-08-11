set number
imap jj <C-[>

set showcmd "Display incomplete commands
set scrolloff=5

" Search within what's being displayed on the screen
nnoremap <silent> z/ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=5<CR>``/\%V

" Clear search with :C
:command C let @/=""

" Centralize swap files
set directory^=$HOME/.vim/swapfiles//

" Copy paste
set clipboard=unnamed
vmap <C-c> :w !pbcopy<CR><CR>
map <C-x> :!pbcopy<CR>

" Tags
set tags=tags;/

" Python settings
set autoindent
set expandtab
autocmd FileType python setlocal commentstring=#\ %s ts=4 sts=4 sw=4 "supports commenting

" Set spacing in frontend
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

" VimCompletesMe setup
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Vim Markdown Plugin 
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'

" Switching buffers
let mapleader = (' ')
nnoremap <leader>b :ls<cr>:b<space>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>
set hidden "Allow for buffer switching without saves

" Searching settings
set ignorecase
set hlsearch
set smartcase

" Pasting settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Speeding up CTRLP plugin
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_by_filename = 1

" Searching using Ag
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Plug (install if necessary)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
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

" vim-airline / theme settings
let g:onedark_termcolors=16
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
colorscheme onedark
