#!/bin/zsh
set -e

echo "Installing homebrew utils..."

brew install make
new_rc='export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install tree
brew install gnutls
brew install coreutils
brew install clang-format
brew install mosquitto

brew install postgresql@18
new_rc='export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install eza
new_rc='alias ls="eza --color=always --long --git --icons=always"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

rm -f Docker.dmg
curl -fSL https://desktop.docker.com/mac/main/arm64/Docker.dmg --output Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license
sudo hdiutil detach /Volumes/Docker
rm -f Docker.dmg

brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask postman
brew install --cask google-chrome
brew install --cask arc
brew install --cask github
brew install --cask figma
brew install --cask vlc

brew install --cask rectangle
brew install --cask alfred
brew install --cask appcleaner
brew install --cask one-switch

brew install --cask microsoft-teams
brew install --cask slack
brew install --cask telegram
