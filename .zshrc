# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='agnoster'

HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# -----------------------------
# エイリアス
# -----------------------------
alias ga='git add ./'
alias gcm='git commit -m'
alias gp='git push'
alias gs='git switch'
alias gpl='git pull'

alias n='nano'
alias v='vim'
alias nano='nano -l'
alias zshrc='nano ~/.zshrc; source ~/.zshrc'
alias nanorc='nano ~/.nanorc'

alias la='ls -a'
alias ll='ls -lh'
alias l='ls'
alias c='cat'
alias h='history'
alias rm="rm -i"
alias so="source"
alias ...="cd ../.."
alias fuck="echo FUCK"
alias dotfiles='cd ~/dotfiles'
alias xmap='xmodmap ~/.Xmodmap'

if [[ $(command -v exa) ]]; then
    alias e='exa --icons --git'
    alias l=e
    alias ls=e
    alias ea='exa -a --icons --git'
    alias la=ea
    alias ee='exa -aahl --icons --git'
    alias ll=ee
    alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias lt=et
    alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
    alias lta=eta
    alias l='clear && ls'
fi

if [[ $(command -v bat) ]]; then
    alias cat='bat'
fi

if [[ $(command -v fd) ]]; then
	alias find='fd'
fi

# -----------------------------
# オプション
# -----------------------------

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# コマンドのスペルミスを指摘
setopt correct

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

# 同時に起動しているzshの間でhistoryを共有する
setopt share_history

# cdの後にlsを実行
chpwd() { ls }

# ビープ音停止
setopt no_beep
setopt nolistbeep

# エディタ
export EDITOR='nano'

# ヒストリ
setopt auto_pushd
setopt pushd_ignore_dups
HISTSIZE=10000
SAVEHIST=10000

# # コマンドの実行ごとに改行
# function precmd() {
#     # Print a newline before the prompt, unless it's the
#     # first prompt in the process.
#     if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
#         NEW_LINE_BEFORE_PROMPT=1
#     elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
#         echo ""
#     fi
# }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sekaken/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sekaken/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sekaken/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sekaken/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

