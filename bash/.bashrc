# ls -> eza
alias ls="eza --icons"
alias ll="ls -lh"
alias la="ls -lah"
alias ldf="ls -lhd .*"
alias lt="ls --tree"

# preferred editor and pager
export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGER=less

# mac stuffs
if [ $(uname) == "Darwin" ]; then
	# Homebrew
	export PATH="/usr/local/sbin:$PATH"
fi

# machine specific stuffs
if [ -a ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

eval "$(starship init bash)"
