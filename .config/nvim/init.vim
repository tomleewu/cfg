set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


lua << EOF
require('leap').set_default_keymaps()
EOF
