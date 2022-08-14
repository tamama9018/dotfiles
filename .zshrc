# oh-my-zsh
ZSH_THEME='agnoster'
plugins=(git)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# alias
alias ga='git add ./'
alias gcm='git commit -m'
alias gp='git push'
alias gs='git switch'
alias gpl='git pull'
alias gb='git branch'

alias n='nano'
alias v='vim'
alias h='history'
alias c='cat'

alias zshrc='nano ~/.zshrc; source ~/.zshrc'
alias nanorc='nano ~/.nanorc'

alias la='ls -a'
alias ll='ls -lh'
alias l='ls'

alias rm="rm -i"
alias so="source"
alias ...="cd ../.."
alias fuck="echo FUCK"
alias mkdir='(){mkdir $1;cd $1}'
alias dotfiles='cd ~/dotfiles'

alias dev1='ssh yuki-kimura@192.168.10.16'
alias dev2='ssh yuki-kimura@192.168.10.15'


alias acnn='acc new --template py'
alias acn='(){acnn $1;cp -r .vscode $1;cd $1;code .}'
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

# options

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

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"