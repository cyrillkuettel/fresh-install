# Core 
brew update
brew install ripgrep
brew install fd 
brew install wget
brew install coreutils
brew install --cask htop
brew install htop
brew install neofetch
brew install nvm 
brew install java
brew install clang-format
brew install vlc
brew install --cask calibre
brew install anki
brew install --cask libreoffice


# generate pdf from markdown 
brew tap homebrew/cask-fonts
brew install --cask font-open-sans
brew install --cask basictex

# nerd fonts
cd ~/ && git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts
./install


   # get the font
wget https://fontlibrary.org/assets/downloads/eb-garamond/ad76a14ea9b136557b474c3445caea08/eb-garamond.zip
unzip eb-garamond.zip


exit 0

  # unzip, put contents of tff folder accordingly:
sudo cp *.ttf /Library/Fonts/

eval "$(/usr/libexec/path_helper)"

# manually show with 
# Shift + Command + .

# previews for more video file formats
brew install --cask qlvideo


# install 'black as a server' for Blackd plugin globally 
pip install 'black[d]'

mkdir -p ~/.local/bin/ && cp ~/fresh-install/shell/rfv ~/.local/bin


# the finder, files that begin with a . (dot) are not being shown by default
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

# Makes ideavim work
# https://stackoverflow.com/questions/39606031/intellij-key-repeating-idea-vim
defaults write -g ApplePressAndHoldEnabled -bool false


