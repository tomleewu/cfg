" Plug (install if necessary)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-rhubarb'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set number
inoremap <C-l> <Esc>
inoremap kj <Esc>
nnoremap ; :

" remap split movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set showcmd "Display incomplete commands
set scrolloff=5

" Quickly edit vimrc
nnoremap cv :e $MYVIMRC<CR>

" Yank to system clipboard
set clipboard=unnamedplus

" Centralize swap files
set directory^=$HOME/.vim/swapfiles//

" Move line up/down
nnoremap _ ddp
nnoremap - dd2kp

" Netrw settings
let g:netrw_banner = 0

" Tags
set tags=./tags,tags;$HOME

" Vim autocomplete
set complete-=i

" Gutentags
set tags+=$HOME/.vim/ctags/
let g:gutentags_cache_dir='~/.vim/ctags/'
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
set statusline+=%{gutentags#statusline()}

" vim-go
nnoremap <silent> <C-v> :GoVet<CR>
nnoremap <silent> <C-c> :GoTestCompile<CR>
let g:go_test_show_name=1

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Python settings
autocmd FileType python setlocal commentstring=#\ %s ts=4 sts=4 sw=4 "supports commenting

" Set spacing in frontend
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

" Switching buffers
let mapleader = (' ')
nnoremap <leader>b :ls<cr>:b<space>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :BD<cr>
set hidden "Allow for buffer switching without saves

" fzf shortcuts
nmap <leader>; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>t :Tags<CR>
" don't search filenames
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
let g:go_fmt_command = "goimports"

" Searching settings
set ignorecase
set incsearch
set smartcase

" Markdown preview
nmap <C-m> <Plug>MarkdownPreview

" Pasting settings
nnoremap <C-o> :set invpaste paste?<CR>
set pastetoggle=<C-o>
set showmode

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" COC settigs
set nobackup
set nowritebackup
set cmdheight=2
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Close window once autocompleted
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Apply fix to line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)

" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
let g:clipboard = {
      \   'name': 'wayland-strip-carriage',
      \   'copy': {
      \      '+': 'wl-copy --foreground --type text/plain',
      \      '*': 'wl-copy --foreground --type text/plain --primary',
      \    },
      \   'paste': {
      \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
      \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
      \   },
      \   'cache_enabled': 1,
      \ }

" Make colors match while in tmux
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"vim-airline / theme settings
let g:gitgutter_override_sign_column_highlight=1
let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts=1
set background=dark
colorscheme gruvbox-material
