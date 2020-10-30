#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum" # didn't do 2020-10-07 18:16

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
brew install gnu-sed

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
# brew install wget --with-iri
brew install wget

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/nano
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install more recent versions of some macOS tools.
brew install vim
brew install nano
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# z hopping around folders
brew install z

# run this script when this file changes guy.
brew install entr

# github util. gotta love `hub fork`, `hub create`, `hub checkout <PRurl>`
brew install hub

# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# writing
brew install pandoc
brew install pandoc-citeproc
brew install pandoc-crossref

# keyboard stuff
brew install yqrashawn/goku/goku

# text expander
brew tap federico-terzi/espanso
brew install espanso

# audio stuff
brew install ffmpeg
brew install essentia # ? should i

# Install other useful binaries.
brew install the_silver_searcher
brew install fzf

brew install duti # set default apps for file extensions
# https://superuser.com/questions/273756/how-to-change-default-app-for-all-files-of-particular-file-type-through-terminal
duti -s $(osascript -e 'id of app "Visual Studio Code"') .py all
duti -s $(osascript -e 'id of app "Visual Studio Code"') .js all

brew install git
brew install git-lfs
brew install htop
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install python
brew install python3
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install zopfli

brew install terminal-notifier
brew install ncdu # find where your diskspace went

# Remove outdated versions from the cellar.
brew cleanup