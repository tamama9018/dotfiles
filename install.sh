#!/bin/bash

# Detect OS
OS="Linux"
if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
fi
echo $OS

DOTPATH=~/.dotfiles
OHMYPATH=~/.oh-my-zsh/oh-my-zsh.sh
GITHUB_URL=https://github.com/tamama9018/dotfiles

# Install zsh
if type "zsh" > /dev/null 2>&1; then
    echo 'zsh is installed'
else
    if [ "$OS" == 'Mac' ]; then
        brew install zsh
    else
        # Install ncurses
        mkdir -p ~/.local/ncurses
        curl -L https://ftp.gnu.org/gnu/ncurses/ncurses-6.3.tar.gz > ncurses-6.3.tar.gz
        tar -zxvf ncurses-6.3.tar.gz
        rm ncurses-6.3.tar.gz
        chmod 777 -R ncurses-6.3
        cd ncurses-6.3
        ./configure \
        --prefix=~/.local/ncurses \
        --without-cxx-binding \
        --with-shared \
        --enable-widec
        make; make install

        # Install zsh
        cd ~/.local
        curl -L https://sourceforge.net/projects/zsh/files/zsh/5.7.1/zsh-5.7.1.tar.xz > zsh-5.7.1.tar.xz
        xz -dc zsh-5.7.1.tar.xz | tar xfv -
        mkdir ~/.local/zsh
        cd zsh-5.7.1
        ./configure \
        --prefix=~/.local/zsh \
        --enable-cflags="-I ~/.local/ncurses/include" \
        --enable-cppflags="-I ~/.local/ncurses/include" \
        --enable-ldflags="-L ~/.local/ncurses/lib" \
        --enable-multibyte \
        --enable-locale \
        --with-tcsetpgrp
        make; make install
    fi
fi

# Install oh-my-zsh
if [ ! -e $OHMYPATH ]; then
    echo "oh-my-zsh is not installed"
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo "oh-my-zsh is installed"
fi

# Install cargo
if type "cargo" > /dev/null 2>&1; then
    echo 'cargo is installed'
else 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
fi

# Install exa
if type "exa" > /dev/null 2>&1; then
    echo 'exa is installed'
else 
    cargo install exa
fi

# Install bat
if type "bat" > /dev/null 2>&1; then
    echo 'bat is installed'
else
    cargo install bat
fi

# Install fd
if type "fd" > /dev/null 2>&1; then
    echo 'fd is installed'
else
    cargo install fd-find
fi

# Get dotfile
## git が使えるなら git
if type "git" > /dev/null 2>&1; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

## 使えない場合は curl か wget を使用する
elif type "curl" > /dev/null 2>&1 || type "wget" > /dev/null 2>&1; then
    tarball="https://github.com/tamama9018/dotfiles/archive/refs/heads/main.tar.gz"

    ## どっちかでダウンロードして，tar に流す
    if type "curl" > /dev/null 2>&1; then
        curl -L "$tarball"

    elif type "wget" > /dev?null 2>&1; then
        wget -O - "$tarball"

    fi | tar zxv

    ## 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd $DOTPATH
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# Make Synbolic Links
for f in .??*
do
    [[ "$f" == ".git"* ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv "$DOTPATH/$f" "~"/"$f"
    echo "$f"
done
