# Core 
  brew update
  brew install ripgrep
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

  # generate pdf from markdown 
  brew tap homebrew/cask-fonts
  brew install --cask font-open-sans
  brew install --cask basictex
   
   # get the font
    curl https://fontlibrary.org/assets/downloads/eb-garamond/ad76a14ea9b136557b474c3445caea08/eb-garamond.zip
  # unzip, put contents of tff folder accordingly:
  sudo cp *.ttf /Library/Fonts/

  eval "$(/usr/libexec/path_helper)"

# the finder, files that begin with a . (dot) are not being shown by default
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

# manually show with 
# Shift + Command + .

# Application level volume control
brew install --cask background-music

# previews for more video file formats
brew install --cask qlvideo


# install 'black as a server' for Blackd plugin globally 
pip install 'black[d]'
