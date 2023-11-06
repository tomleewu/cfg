# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:~/.local/bin:$PATH:$HOME/.npm/bin:/opt/homebrew/bin

# Path to your oh-my-zsh installation.
# export ZSH=/Users/tomleewu/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="common"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux kubectl zsh-autosuggestions vi-mode fzf docker fast-syntax-highlighting)

# Configure tmux plugin
export ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

if _has zoxide; then
  eval "$(zoxide init zsh)"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Set alias for setting up dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias lg='lazygit'

# fzf + rg configuration
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore-vcs -g "!{node_modules,.git}" --files'
  export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --color=fg+:#000000,bg+:#D8D5C7,hl:#216609,hl+:#216609,gutter:-1"
  export FZF_CTRL_T_COMMAND='fd --type file --hidden --no-ignore'
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

export EDITOR='/usr/bin/vim'
if _has nvim; then
  alias vim='nvim'
  export EDITOR='/opt/homebrew/bin/nvim'
fi

export BAT_THEME="ansi"

# Go environment vars
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export GPG_TTY=$(tty)

export KEYTIMEOUT=30
bindkey "kj" vi-cmd-mode

# change cursor shape for different vi modes
# https://unix.stackexchange.com/questions/433273/changing-cursor-style-based-on-mode-in-both-zsh-and-vim
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  echo -ne '\e[6 q'
}

# Fix weird directory colors from ls
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd


if _has eza; then
  alias ls='eza'
fi

# Use pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
