#########################################################################
# Author:     冯岳松（yuesong-feng@foxmail.com）
# Created Time: Tue Jun 11 16:44:48 2022
#########################################################################
#!/bin/bash

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    rm ~/.vimrc
fi
cp .vimrc ~/.vimrc

if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi
cp -r .vim ~/.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

echo "Finish install EasyVim!!!"