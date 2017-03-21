#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew cask install spectacle
brew cask install dropbox
brew cask install evernote
brew cask install gyazo
brew cask install rescuetime
brew cask install telegram
brew cask zotero

# dev
brew cask install atom
brew cask install docker-toolbox
brew cask install imagealpha
brew cask install imageoptim
brew cask install postgres
brew cask install sourcetree
brew cask install sublime-text
brew cask install virtualbox

# writing
brew cask install mactex

# fun
brew cask install miro-video-converter

# browsers
# brew cask install google-chrome-canary
# brew cask install firefoxnightly
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser

# less often
brew cask install disk-inventory-x
brew cask install vlc
# brew cask install screenflow
# brew cask install licecap
# brew cask install utorrent


# Not on cask but I want regardless.

# File Multi Tool 5
# Phosphor
