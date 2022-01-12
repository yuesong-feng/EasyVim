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

echo "Finish install EasyVim!!!"
echo "start vim and run :PlugInstall"
