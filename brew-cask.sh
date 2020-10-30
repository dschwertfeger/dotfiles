#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew cask install calibre
brew cask install dropbox
brew cask install evernote
brew cask install flycut
brew cask install google-backup-and-sync
brew cask install notion
brew cask install obsidian
brew cask install rescuetime
brew cask install slack
brew cask install spectacle
brew cask install telegram
brew cask install zoomus
brew cask install zotero

# quicklook: https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlimagesize
brew cask install suspicious-package
brew cask install quicklookase qlvideo

# dev
brew cask install atom
brew cask install docker-toolbox
brew cask install imagealpha
brew cask install imageoptim
brew cask install kite
brew cask install postgres
brew cask install sourcetree
brew cask install sublime-text
brew cask install virtualbox
brew cask install visual-studio-code

# writing
brew cask install mactex
brew cask install typora
brew cask install zettlr

# fun
brew cask install miro-video-converter

# browsers
brew cask install brave-browser
brew cask install google-chrome
# brew cask install google-chrome-canary
# brew cask install firefoxnightly
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser

# less often
brew cask install appcleaner
brew cask install disk-inventory-x
brew cask install gyazo
brew cask install keka
brew cask install loom
brew cask install portfolioperformance
brew cask install skitch
brew cask install vlc
# brew cask install screenflow
# brew cask install licecap
# brew cask install utorrent

brew tap homebrew/cask-fonts
brew cask install font-fira-code


# Not on cask but I want regardless.

# Spark (Email Client)
# File Multi Tool 5
# Phosphor
#
