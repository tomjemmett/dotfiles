#!/bin/sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install awesome vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# copy in custom configs
mv my_configs.vim ~/.vim_runtime
mv zshrc .zshrc

# install plugins
git clone --depth=1 https://github.com/rafi/awesome-vim-colorschemes .vim_runtime/my_plugins

