export TERM=xterm-256color

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zoxide
eval "$(zoxide init zsh)"
#


# ghcup
# [ -f "/home/tom/.ghcup/env" ] && source "/home/tom/.ghcup/env" # ghcup-env

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
. "$HOME/.local/bin/env"

