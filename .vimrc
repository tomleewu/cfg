" --- Plugins --- "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rhysd/clever-f.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Townk/vim-autoclose'
Plug 'romainl/vim-cool' " disables search highlighting after cursor movement
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " enables use of :Gbrowse to open files in GitHub 
Plug 'sainnhe/gruvbox-material'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sleuth' " automated indention
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/leap.nvim'
Plug 'rose-pine/neovim'
Plug 'tomleewu/vim-paper'
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

set noshowmode

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set autoread " Automatically read changed files

tnoremap <C-t> <C-\><C-n> " Exit terminal mode using ctrl + t


" --- Keyboard mappings --- "
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
map <leader>d :BD<cr>
set hidden "Allow for buffer switching without saves

" Reload vimrc
nnoremap <silent> <F5> :source ~/.vimrc<CR>


" --- fzf --- "
nmap <leader>; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>/ :Rg<CR>
nmap <leader>t :Tags<CR>
nmap <leader>h :History<CR>


"don't search filenames in ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --no-ignore-vcs --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }


" --- Markdown preview --- "
nmap <C-s> <Plug>MarkdownPreview


" --- vim-go --- " 
autocmd Filetype go nmap <C-v> <plug>(go-vet)
autocmd Filetype go nmap <C-c> <plug>(go-test-func)
autocmd Filetype go nmap <Leader>i :GoFillStruct<cr>
autocmd Filetype go nmap <Leader>r :GoRename<cr>
autocmd Filetype go nmap <Leader>t :GoAddTags<cr>
"debug
nmap <leader>dt :GoDebugTestFunc<cr>
nmap <leader>ds :GoDebugStop<cr>
nmap <Leader>dn :GoDebugBreakpoint<cr>
nmap <Leader>dr :GoDebugRestart<cr>
let g:go_debug_mappings = {
      \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
      \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
      \ '(go-debug-stop)': {'key': 'q'},
      \ '(go-debug-step)': {'key': 's'},
      \ '(go-debug-print)': {'key': 'p'},
  \}
let g:go_debug_windows = {
      \ 'vars':       'leftabove 50vnew',
      \ 'stack':      'leftabove 10new',
      \ }
let g:go_test_show_name=1
let g:go_test_timeout='60s'
let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1
let g:go_auto_type_info = 0
set updatetime=500 " show GoInfo after 500 ms
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
let g:go_gopls_enabled = 1
let g:go_gopls_options = ['-remote=auto']
let g:go_code_completion_enabled = 1
let g:go_auto_sameids = 0
let g:go_diagnostics_enabled = 0
let g:go_echo_go_info = 0
let g:go_metalinter_enabled = 0
" coc-go
autocmd FileType go nmap gtd :CocCommand go.gopls.tidy<cr>


" --- Fugitive --- "
nmap <leader>gs :Git<CR>


" --- Clever F --- "
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
let g:clever_f_mark_char_color = 'Visual'


" --- coc-nvim --- "
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

set updatetime=300
set shortmess+=c
set signcolumn=yes

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition) Prefer to use vim-go go_def which
" jumps back to where go_def was triggered
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
 if (index([‘vim’,’help’], &filetype) >= 0)
 execute ‘h ‘.expand(‘<cword>’)
 else
 call CocAction(‘doHover’)
 endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Open diagnostics window
nnoremap <silent> <leader>cd :CocDiagnostics<cr>
nnoremap <silent> <leader>n :lnext<cr>
nnoremap <silent> <leader>p :lprev<cr>


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

" theme settings
autocmd ColorScheme * highlight! link SignColumn LineNr
