#!/bin/bash

declare OS="unsupported os"
declare linux="unknown"
if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='Linux'
    RELEASE_FILE=/etc/os-release
    if grep '^NAME="CentOS' "${RELEASE_FILE}" >/dev/null; then
        linux='CentOS'
    elif grep '^NAME="Amazon' "${RELEASE_FILE}" >/dev/null; then
        linux="Amazon Linux"
    elif grep '^NAME="Ubuntu' "${RELEASE_FILE}" >/dev/null; then
        linux=Ubuntu
    else
        echo "Your platform is not supported."
        uname -a
        exit 1
    fi
elif [ "$(expr substr $(uname -s) 1 6)" == 'CYGWIN' ]; then
    OS='Linux'
else
    echo "Your platform is not supported."
    uname -a
    exit 1
fi
echo $OS

DOTPATH=~/dotfiles
OHMYPATH=~/.oh-my-zsh/oh-my-zsh.sh
GITHUB_URL=https://github.com/tamama9018/dotfiles

# linuxでfnキーを有効に
if [ "$OS" == 'Linux' ]; then
    echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
fi

# zsh-syntax-highlighting
if [ "$OS" == 'Mac' ]; then
    sudo brew install zsh-syntax-highlighting
else
    sudo apt-get install zsh-syntax-highlighting
fi

# oh-my-zsh
if [ ! -e $OHMYPATH ]; then
    echo "oh-my-zsh is not installed"
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo "oh-my-zsh is installed"
fi

# exa
if type "exa" > /dev/null 2>&1; then
    echo 'exa is installed'
else 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    cargo install exa
fi

# bat
if type "bat" > /dev/null 2>&1; then
    echo 'bat is installed'
else
    if [ "$OS" == 'Mac' ]; then
        brew install bat
    else
        curl -LJO https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb
        sudo dpkg -i bat_0.9.0_amd64.deb
    fi
fi

# fd
if type "fd" > /dev/null 2>&1; then
    echo 'fd is installed'
else
    if [ "$OS" == 'Mac' ]; then
        brew install fd
    else
        cargo install fd-find
    fi
fi

# guake
if [ "$OS" == 'Mac' ]; then
	echo 'mac cant install guake'
else
	sudo apt install guake
fi

# 導入
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

sh $DOTPATH/install_nerdfont.sh
