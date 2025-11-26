# ------------------------------------------------------------------------------
# envars
# ------------------------------------------------------------------------------
export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGER=less
export KITTY_HOST_OS=$(uname)
export SYSTEMD_PAGER=

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------
alias ls="ls --color=auto"

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
    local color_start="\e["
    local color_end="\e[m"
    local green="${color_start}0;32m"
    local blue="${color_start}0;34m"
    local red="${color_start}0;31m"
    local cyan="${color_start}0;36m"
    local purple="${color_start}0;35m"

    
    PROMPT_GIT_BRANCH=""

    # git branch
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        PROMPT_GIT_BRANCH=" ${purple}${branch}${color_end}"
        [[ $(git status -s 2>/dev/null  | wc -l) -ne 0 ]] && PROMPT_GIT_BRANCH+="${red}(!)${color_end}"
    fi


    PS1="\n[${green}\u@\h${color_end}: ${blue}\W${color_end}]"
    # PS1+=' $(ret=$?; echo "($ret)")'
    PS1+=$PROMPT_GIT_BRANCH 
    PS1+='\n\$ '
}

export PROMPT_COMMAND=get_prompt

