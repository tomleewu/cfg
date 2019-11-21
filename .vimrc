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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Source FZF in Ubuntu
source /usr/share/doc/fzf/examples/fzf.vim

set number
imap jj <C-[>

set showcmd "Display incomplete commands
set scrolloff=5

" Search within what's being displayed on the screen
nnoremap <silent> z/ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=5<CR>``/\%V

" Centralize swap files
set directory^=$HOME/.vim/swapfiles//

" Copy paste
set clipboard=exclude:.*
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
nmap <leader>/ :Rg<CR>

" Searching settings
set ignorecase
set incsearch
set smartcase

" Pasting settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" Enable linters & fixers (ALE)
let g:ale_linters = {
                        \'python':['flake8'],
                        \}

let g:ale_fixers = {
                        \'python':['black'],
                        \'html':['prettier'],
                        \}
let g:ale_fix_on_save = 1

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

"vim-airline / theme settings
let g:onedark_termcolors=16
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
colorscheme onedark
