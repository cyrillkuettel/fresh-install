# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 1.) add the stuff to vimrc
# 2.) run this:


# :PluginInstall

# possible to also run from terminal:
vim +PluginUpdate +qall
