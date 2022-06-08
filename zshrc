/opt/shell-color-scripts/colorscript.sh -r

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"

plugins=(git azcli conda fzf gh vi-mode)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
command -v htop > /dev/null && alias top='htop'
alias cat=batcat
alias bat=batcat
alias python=python3
alias vim=nvim

alias R='R --no-save'
alias r="radian"

export EDITOR=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tom/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tom/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tom/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tom/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64

export PATH="$HOME/.local/bin:${CUDA_HOME}/bin:$PATH"

