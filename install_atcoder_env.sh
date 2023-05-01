#!/bin/bash

# for m1 mac

# install oj
pip3 install online-judge-tools
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# install pypy3
curl -O https://downloads.python.org/pypy/pypy3.9-v7.3.11-macos_arm64.tar.bz2
tar -xvzf pypy3.9-v7.3.11-macos_arm64.tar.bz2 
rm pypy3.9-v7.3.11-macos_arm64.tar.bz2
sudo mv pypy3.9-v7.3.11-macos_arm64/ /opt
export PATH="/opt/pypy3.9-v7.3.11-macos_arm64/bin:$PATH"

brew install gnu-time

# install nvm
brew install nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
nvm i v20.0.0

# install atcoder-cli
npm install -g atcoder-cli
acc login # input username and password for atcoder
