# If not running interactively, don't do anything
# credit: https://github.com/bahamas10/dotfiles/blob/master/bashrc
[[ -n $PS1 ]] || return

# ------------------------------------------------------------------------------
# envars
# ------------------------------------------------------------------------------
export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGER=less
export KITTY_HOST_OS=$(uname)
export SYSTEMD_PAGER=

# ------------------------------------------------------------------------------
# aliases
# ------------------------------------------------------------------------------
alias ls="ls --color=auto"
alias gsc="git commit -S -m"

# ------------------------------------------------------------------------------
# mac 
# ------------------------------------------------------------------------------
if [[ $(uname) == "Darwin" ]]; then
    # homebrew bin pah
	export PATH="/usr/local/sbin:$PATH"

    # source completions
    if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
        source "/usr/local/etc/profile.d/bash_completion.sh"
    fi
fi

# ------------------------------------------------------------------------------
# additional configs 
# ------------------------------------------------------------------------------
if [[ -d "${HOME}/.bashrc.d" ]]; then
    for file in "${HOME}/.bashrc.d/*";
    do source $file
    done
fi


# ------------------------------------------------------------------------------
# pompt
# ------------------------------------------------------------------------------
get_prompt() {
    local RED="\e[0;31m"
    local GREEN="\e[0;32m"
    local YELLOW="\e[0;33m"
    local BLUE="\e[0;34m"
    local PURPLE="\e[0;35m"
    local CYAN="\e[0;36m"
    local RESET="\e[0m"

    PS1="\n[${GREEN}\u@\h${RESET}: ${BLUE}\W${RESET}]"


    # git branch
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    local branch_status=$(git status -s 2>/dev/null)
    [[ -n $branch ]] && PS1+=" ${PURPLE}${branch}${RESET}"
    [[ -n $branch_status ]] && PS1+="${RED}(!)${RESET}"
    
    # aws-vault profile
    [[ -n $AWS_VAULT ]] && PS1+=" ${YELLOW}(aws: ${AWS_VAULT})${RESET}"

    # python venv
    [[ -n $VIRTUAL_ENV_PROMPT ]] && PS1+=" ${YELLOW}(pyenv: ${VIRTUAL_ENV_PROMPT})${RESET}"

    PS1+="\n\$${RESET} "
}

export PROMPT_COMMAND=get_prompt

