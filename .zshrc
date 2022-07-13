# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME='agnoster'

alias hoge='(){cat > $1.py}'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "bira" "frontcube")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.

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
alias mkdir='(){mkdir $1;cd $1}'
alias dotfiles='cd ~/dotfiles'
alias xmap='xmodmap ~/.Xmodmap'

alias dev1='ssh yuki-kimura@192.168.10.16'
alias dev2='ssh yuki-kimura@192.168.10.15'

alias dotfiles='cd ~/dotfiles'
alias algo='cd /Users/Yutyo/Documents/Programs/atcoder/atcoder'

alias acnn='acc new --template py'
alias acn='(){acnn $1;cd $1;code .}'
alias acta="oj t -c 'pypy3 main.py' -d tests"
alias act='(){pypy3 main.py < tests/sample-$1.in}'
alias acs="acc s main.py -- --guess-python-interpreter pypy"
alias maketest='(){echo input;cat > tests/sample-$1.in;echo output;cat > tests/sample-$1.out}'
alias trytest='echo input;cat | pypy3 main.py'
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

