" --- Plugins --- "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/clever-f.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool' " disables search highlighting after cursor movement
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " enables use of :Gbrowse to open files in GitHub 
Plug 'sainnhe/gruvbox-material'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-sleuth' " automated indention
Plug 'hashivim/vim-terraform'
call plug#end()


" --- Vim defaults --- "
set number
set backspace=indent,eol,start
set showcmd  " Display incomplete commands
set scrolloff=5
set clipboard=unnamedplus " Yank to system clipboard
set directory^=$HOME/.vim/swapfiles// " Centralize swap files
set tags=./tags,tags;$HOME
set cursorline

set ignorecase
set incsearch
set smartcase

set showmode " Shows paste mode


" --- Keyboard mappings --- "
inoremap <C-l> <Esc>
inoremap kj <Esc>
nnoremap ; :

" remap split movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly edit vimrc
nnoremap cv :e ~/.vimrc<CR>

" Move line up/down
nnoremap _ ddp
nnoremap - dd2kp

" Switching buffers
let mapleader = (' ')
nnoremap <leader>b :ls<cr>:b<space>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :BD<cr>
set hidden "Allow for buffer switching without saves

" close quickfix list
nnoremap <leader>c :cclose<CR>

nnoremap <silent> <F5> :source ~/.vimrc<CR>


" --- fzf --- "
nmap <leader>; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>t :Tags<CR>

"don't search filenames in ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"


" --- Markdown preview --- "
nmap <C-s> <Plug>MarkdownPreview


" --- vim-go --- " 
autocmd Filetype go nmap <C-v> <plug>(go-vet)
autocmd Filetype go nmap <C-c> <plug>(go-test)
autocmd Filetype go nmap <leader>r <plug>(go-fill-struct)
let g:go_test_show_name=1
let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1
let g:go_auto_type_info = 1
set updatetime=500 " show GoInfo after 500 ms
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>


" --- Clever F --- "
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
let g:clever_f_mark_char_color = 'Visual'


" --- coc-nvim --- "
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes

nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Close window once autocompleted
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" --- vim-terraform --- "
let g:terraform_fmt_on_save=1


" --- gutentags --- "
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]


" --- Aesthetics --- "
if (has("termguicolors"))
    set termguicolors
endif

" Make colors match while in tmux
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"vim-airline / theme settings
autocmd ColorScheme * highlight! link SignColumn LineNr
let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts=1
set background=dark
colorscheme gruvbox-material
