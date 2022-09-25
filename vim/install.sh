# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 1.) cp ~/fresh-install/vim/vimrc ~/.vimrc
# 2.) make sure you clone this wit recurse submoudle
	mkdir -p ~/.vim/plugged
	cp -r ~/fresh-install/vim/vim/plugged/ ~/.vim/plugged
# 2.) run this:
# :PluginInstall

# possible to also run from terminal:
vim +PluginUpdate +qall

# Commands
# :Files  -> Get a preview of the files as you're scrolling through
# :Rg    -> Ripgrep in vim
# :Lines -> Super fast search inside a file
#
