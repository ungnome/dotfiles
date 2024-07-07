# ls -> exa
alias ls="exa --icons"
alias ll="exa --icons -lh"
alias l="exa --icons -lh"
alias la="exa --icons -lah"
alias ldf="exa --icons -lhd .*"
alias lt="ls --tree"

# dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## Exports
# aws-vault keychain name
export AWS_VAULT_KEYCHAIN_NAME="login"

# set editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGER=less

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# PS1=$'\
# \e[1;34m\w\e[0m\
# \e[1;31m\$\e[m: \
# '

_BOLD=$(tput bold)
_RESET=$(tput sgr0)
_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_RED=$(tput setaf 1)

PS0="\n"
PS1="\n\[${_BOLD}${_BLUE}\]\w\n\[${_RESET}\]\[${_BOLD}${_RED}\]\$\[${_RESET}\]: "

if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
