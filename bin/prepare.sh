#! /usr/bin/env bash

set -x

rm -rf ~/.local/.profile

mkdir ~/.local/
mkdir ~/.local/bin

git clone https://github.com/ilyanadelyaev/_profile.git ~/.local/.profile
rm -rf ~/.local/.profile/.git

ln -sf ~/.local/.profile/.bash_local.rambler ~/.bash_local
ln -sf ~/.local/.profile/.bash_profile ~/.bash_profile
ln -sf ~/.local/.profile/.bashrc ~/.bashrc
ln -sf ~/.local/.profile/.git-completion.bash ~/.git-completion.bash
ln -sf ~/.local/.profile/.inputrc ~/.inputrc
ln -sf ~/.local/.profile/.python_startup ~/.python_startup
ln -sf ~/.local/.profile/.screenrc ~/.screenrc
ln -sf ~/.local/.profile/.tmux.conf ~/.tmux.conf
ln -sf ~/.local/.profile/.vim/ ~/.vim
ln -sf ~/.local/.profile/.vimrc ~/.vimrc

#ln -sf ~/.local/.profile/bin/add_rsa_keys ~/.local/bin/add_rsa_keys
ln -sf ~/.local/.profile/bin/grab_ssh_agent ~/.local/bin/grab_ssh_agent
