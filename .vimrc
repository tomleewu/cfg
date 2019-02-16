set number
imap jj <C-[>

set showcmd "Display incomplete commands
set scrolloff=5

" Search within what's being displayed on the screen
nnoremap <silent> z/ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=5<CR>``/\%V

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

" fzf shortcuts
nmap <leader>; :Buffers<CR>
nmap <leader>f :Files<CR>

" Searching settings
set ignorecase
set incsearch
set smartcase

" Pasting settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

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
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Enable linters & fixers (ALE)
let g:ale_linters = {
                        \'python':['flake8'],
                        \}

let g:ale_fixers = {
                        \'python':['black'],
                        \'html':['prettier'],
                        \}
let g:ale_fix_on_save = 1

"vim-airline / theme settings
let g:onedark_termcolors=16
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
colorscheme onedark
