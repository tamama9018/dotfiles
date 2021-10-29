export HTTP_PROXY="http://192.168.10.105:8080"
export HTTPS_PROXY="http://192.168.10.105:8080"
export http_proxy="http://192.168.10.105:8080"
export https_proxy="http://192.168.10.105:8080"
export no_proxy="alsok.sken,127.0.0.1,localhost"

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

# -----------------------------
# プロンプト
# -----------------------------
# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))
PROMPT='%F{cyan}%T%f:%~#
$ '


# -----------------------------
# エイリアス
# -----------------------------
alias ga='git add ./'
alias gcm='git commit'
alias gp='git push'

alias zsh='nano ~/.zshrc; source ~/.zshrc'

alias la='ls -a'
alias l='ls'

alias rm="rm -i"

alias fuck="echo FUCK"
