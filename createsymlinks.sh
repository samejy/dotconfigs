#! /bin/bash

[ -z "$JB_LOCATION" ] && echo "JB_LOCATION must be set before running this script" && exit 1;

#if [[ "$OSTYPE" == "linux-gnu" ]]; then
if [[ "$OSTYPE" == "darwin"* ]]; then
    karabinerdir=~/.config/karabiner
    [ ! -d "$karabinerdir" ] && mkdir -p "$karabinerdir";
    ln -sf $(pwd)/karabiner.json "$karabinerdir"/karabiner.json
fi

ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.termrc ~/.config/termrc
ln -sf $(pwd)/.emacs.d/mine/ ~/.emacs.d/
ln -sf $(pwd)/.emacs.d/init.el ~/.emacs.d/init.el
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.ctags ~/.ctags

if [ "$JB_LOCATION" != "work" ]; then
    ln -sf $(pwd)/.zshrc ~/.zshrc
    ln -sf $(pwd)/.bashrc ~/.bashrc
    ln -sf $(pwd)/.profile ~/.profile
    ln -sf $(pwd)/newsbeuter/ ~/.newsbeuter
    ln -sf $(pwd)/.stumpwmrc ~/.stumpwmrc
    ln -sf $(pwd)/stumpwm/ ~/
    ln -sf $(pwd)/i3-config ~/.config/i3/config
    ln -sf $(pwd)/.xmodmaprc ~/.xmodmaprc
    ln -sf $(pwd)/.Xresources ~/.Xresources
    ln -sf $(pwd)/.startup.sh ~/.startup.sh

    asdfdir=~/.config/common-lisp/source-registry.conf.d
    if [ ! -d "$asdfdir" ]; then
    	mkdir -p "$asdfdir"
    fi

    ln -sf $(pwd)/asdf.conf "$asdfdir"/projects.conf
    sudo ln -sf $(pwd)/enpass /usr/bin/enpass 
fi
    
   


