export TERM=xterm-256color

export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
    azure
    cabal
    docker
    fzf
    gh
    git
    github
    gpg-agent
    stack
    tmux
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
#


# ghcup

# aliases
alias cat=/usr/bin/bat
alias ls=lsd
alias vim=nvim
alias R=/usr/bin/R --no-save
alias r=radian
alias cd=z

alias restart-waybar='kill -s SIGUSR1 $(pgrep waybar)'

# variables
export EDITOR='nvim'

killport () {
    ss -lptn "sport = :$1" | awk -F " " '{printf $6}' | sed 's/.\+pid=\([0-9]\+\).\+/\1/g' | xargs kill
}
spawn() {
    "$@" >/dev/null 2>&1 &
    disown
}

. "$HOME/.local/bin/env"


[ -f "/home/tom/.ghcup/env" ] && . "/home/tom/.ghcup/env" # ghcup-env

# opencode
export PATH=/home/tom/.opencode/bin:$PATH

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
