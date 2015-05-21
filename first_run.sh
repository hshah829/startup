Install zsh (iterm2 installed)
echo "Installing zsh"
curl -L github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#copy sublime (install sublime first)
echo "copy subl for easy sublime use"
cp /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/

#Show hidden finder files
echo "Show hidden files in finder"
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

#Increase key speed
echo "Increasing key speed"
defaults write NSGlobalDomain KeyRepeat -int 0

#install xcode
#echo "Installing xcode"
#xcode-select --install

# INSTALL BREW
echo "Installing brew"
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/ \
install/master/install)"

echo "Update Brew"
brew update

#Brew install python
echo "install python with brew"
brew install python

echo "Install boot2docker"
brew install boot2docker

echo "Link python"
brew linkapps python

echo "Running brew prune to cleanup"
brew prune


