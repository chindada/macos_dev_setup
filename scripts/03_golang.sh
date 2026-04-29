#!/bin/zsh
set -e

echo "Installing golang..."

GO=/usr/local/go/bin/go

# check if $GO is already installed
if command -v $GO &>/dev/null; then
  ENV_FILE=$($GO env GOENV)
  DIRNAME=$(dirname $ENV_FILE)
  rm -rf $DIRNAME
fi

sudo rm -rf /usr/local/go
sudo rm -rf $HOME/go
version="1.26.2"
curl -fSL https://go.dev/dl/go$version.darwin-arm64.pkg --output golang.pkg
sudo installer -pkg ./golang.pkg -target /
rm golang.pkg

new_rc='export GOPATH="$HOME/go"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

new_rc='export PATH="$GOPATH/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

$GO install github.com/git-chglog/git-chglog/cmd/git-chglog@latest
$GO install github.com/appleboy/CodeGPT/cmd/codegpt@latest
$GO install github.com/magefile/mage@latest
$GO install mvdan.cc/gofumpt@latest
$GO install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest

version="1.25.8"
$GO install golang.org/dl/go$version@latest && go"$version" download
version="1.22.3"
$GO install golang.org/dl/go$version@latest && go"$version" download

echo "Installing protoc..."
version="34.1"
curl -fSL https://github.com/protocolbuffers/protobuf/releases/download/v$version/protoc-$version-osx-aarch_64.zip --output protoc.zip
rm -rf ~/sdk_tools/protoc
mkdir -p ~/sdk_tools/protoc
echo "Unzipping protoc.zip..."
unzip -q protoc.zip -d ~/sdk_tools/protoc
chmod +x ~/sdk_tools/protoc/bin/protoc
rm -rf protoc.zip

new_rc='export PATH="$HOME/sdk_tools/protoc/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
