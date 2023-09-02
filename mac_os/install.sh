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
brew install pandoc 
brew install ghostscript 
brew install imagemagick
brew install ffmpeg 
brew install --cask libreoffice
brew install gnu-tar
brew install bat


# generate pdf from markdown 
brew tap homebrew/cask-fonts
brew install --cask font-open-sans

brew install --cask mactex

# nerd fonts
cd ~/ && git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts
./install


   # get the font
wget https://fontlibrary.org/assets/downloads/eb-garamond/ad76a14ea9b136557b474c3445caea08/eb-garamond.zip
unzip eb-garamond.zip

# Making software installed from a .dmg file available as a terminal command 
sudo ln -s /Applications/Anki.app/Contents/MacOS/anki /usr/local/bin/anki
sudo ln -s /Applications/Firefox.app/Contents/MacOS/firefox /usr/local/bin/firefox

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

# Rosetta for x86_64. For example, building PyQt5 is impossible without this.
/usr/sbin/softwareupdate --install-rosetta --agree-to-license



# Turn off annoying macOS man page shortcuts via the command line
# that conflict with one of IntelliJ IDEA’s best shortcuts (Find Action)
# from here:
# https://gist.github.com/theodson/b4282a3b6e54091db4d52a4c3c10ad25

TEMP_SETTINGS_FILE=$(mktemp -t 'man-shortcuts-off.json')
cat > $TEMP_SETTINGS_FILE <<EOF
{
  "NSServicesStatus": {
    "com.apple.Terminal - Open man Page in Terminal - openManPage": {
      "presentation_modes": {
        "ContextMenu": false,
        "ServicesMenu": false
      },
      "enabled_context_menu": false,
      "enabled_services_menu": false
    },
    "com.apple.Terminal - Search man Page Index in Terminal - searchManPages": {
      "presentation_modes": {
        "ContextMenu": false,
        "ServicesMenu": false
      },
      "enabled_context_menu": false,
      "enabled_services_menu": false
    }
  }
}
EOF
# Settings are stored in the pbs domain. Other settings in this domain will not be overwritten. I’ve included the settings to change in JSON for brevity. They are converted to XML (which `defaults import` expects) before being imported.
plutil -convert xml1 -o - ${TEMP_SETTINGS_FILE} | defaults import pbs -
rm ${TEMP_SETTINGS_FILE}


# ba setup
https://github.com/zegervdv/homebrew-zathura
# skim pd viewer
# Auto-reload obviously ( no idea why this is not default)
defaults write -app Skim SKAutoReloadFileUpdate -boolean true
