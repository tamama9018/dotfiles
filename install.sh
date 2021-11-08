#!/bin/bash

DOTPATH=~/dotfiles
OHMYPATH=~/.oh-my-zsh/oh-my-zsh.sh
GITHUB_URL=https://github.com/tamama9018/dotfiles

sudo apt-get install zsh-syntax-highlighting
sudo brew install zsh-syntax-highlighting

if [ ! -e $OHMYPATH ]; then
    echo "oh-my-zsh is not installed"
    sudo apt install powerline fonts-powerline
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo "oh-my-zsh is installed"
fi


# git が使えるなら git
if type "git" > /dev/null 2>&1; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif type "curl" > /dev/null 2>&1 || type "wget" > /dev/null 2>&1; then
    tarball="https://github.com/tamama9018/dotfiles/archive/refs/heads/main.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if type "curl" > /dev/null 2>&1; then
        curl -L "$tarball"

    elif type "wget" > /dev?null 2>&1; then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd ~/dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
    echo "$f"
done

