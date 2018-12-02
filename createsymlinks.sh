#! /bin/bash

[ -z "$LOCATION" ] && echo "LOCATION must be set before running this script" && exit 1;

#if [[ "$OSTYPE" == "linux-gnu" ]]; then
if [[ "$OSTYPE" == "darwin"* ]]; then
    karabinerdir=~/.config/karabiner
    [ ! -d "$karabinerdir" ] && mkdir -p "$karabinerdir";
    ln -s $(pwd)/karabiner.json "$karabinerdir"/karabiner.json
fi

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.termrc ~/.config/termrc
ln -s $(pwd)/.emacs.d/mine/ ~/.emacs.d/
ln -s $(pwd)/.emacs.d/init.el ~/.emacs.d/init.el
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

if [ "$LOCATION" != "work" ]; then
    ln -s $(pwd)/.zshrc ~/.zshrc
    ln -s $(pwd)/.profile ~/.profile
    ln -s $(pwd)/newsbeuter/ ~/.newsbeuter
    ln -s $(pwd)/.stumpwmrc ~/.stumpwmrc
    ln -s $(pwd)/stumpwm/ ~/
    ln -s $(pwd)/i3-config ~/.config/i3/config
    ln -s $(pwd)/.ctags ~/.ctags
    ln -s $(pwd)/.xmodmaprc ~/.xmodmaprc
    ln -s $(pwd)/.Xresources ~/.Xresources
    ln -s $(pwd)/.startup.sh ~/.startup.sh

    asdfdir=~/.config/common-lisp/source-registry.conf.d
    if [ ! -d "$asdfdir" ]; then
	mkdir -p "$asdfdir"
    fi

    ln -s $(pwd)/asdf.conf "$asdfdir"/projects.conf
    sudo ln -s $(pwd)/enpass /usr/bin/enpass 
fi
    
   


