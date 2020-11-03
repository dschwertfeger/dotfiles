# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1


################################################################################
###  backup old machine's key items

mkdir -p ~/migration/home
mkdir -p ~/migration/home/Library/"Application Support"/
mkdir -p ~/migration/Library/"Application Support"/
mkdir -p ~/migration/Library/Preferences/
# mkdir -p ~/migration/Library/Application Support/
mkdir -p ~/migration/Library/Keychains
mkdir -p ~/migration/rootLibrary/Preferences/SystemConfiguration/
mkdir -p ~/migration/rootLibrary/Logs

cd ~/migration

# what is worth reinstalling?
brew leaves                 > brew-list.txt    # all top-level brew installs
brew cask list              > cask-list.txt
npm list -g --depth=0       > npm-g-list.txt
yarn global ls --depth=0    > yarn-g-list.txt

apm list --installed --bare > atom-package-list.txt
# without version numbers (for latest version)
apm list --installed --bare | grep '^[^@]\+' -o > atom-package-list.txt


# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)


# Backup Application Support data
# Shortcuts.json -> much better than in .macos
    # ~/Library/"Application Support"/tastyworks \
cp -Rp \
    ~/Library/"Application Support"/Ableton \
    ~/Library/"Application Support"/audacity \
    ~/Library/"Application Support"/Code \
    ~/Library/"Application Support"/espanso \
    ~/Library/"Application Support"/Evernote \
    ~/Library/"Application Support"/Notion \
    ~/Library/"Application Support"/ObinsKit \
    ~/Library/"Application Support"/obsidian \
    ~/Library/"Application Support"/SourceTree \
    ~/Library/"Application Support"/Spectacle \
    ~/Library/"Application Support"/zettlr \
    ~/Library/"Application Support"/Zotero \
        ~/migration/Library/"Application Support"/

# Backup Preferences data
cp -Rp \
    ~/Library/Preferences/Ableton \
    ~/Library/Preferences/calibre \
    ~/Library/Preferences/espanso \
        ~/migration/Library/Preferences/

# backup some dotfiles likely not under source control
cp -Rp \
    ~/.bash_history \
    ~/.extra \
    ~/.gitconfig.local \
    ~/.gnupg \
    ~/.nano \
    ~/.nanorc \
    ~/.netrc \
    ~/.ssh \
    ~/.z   \
        ~/migration/home
# let's hold on to these

cp -Rp ~/Documents ~/migration

# keychain
cp -Rp ~/Library/Keychains/login.keychain-db Library/Keychains

cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration/rootLibrary/Preferences/SystemConfiguration/ # wifi

cp -Rp /Library/Logs/DiagnosticReports ~/migration/rootLibrary/Logs/

cp -Rp ~/Library/Preferences/net.limechat.LimeChat.plist ~/migration/Library/Preferences/
cp -Rp ~/Library/Preferences/com.tinyspeck.slackmacgap.plist ~/migration/Library/Preferences/
cp -Rp ~/Library/Preferences/espanso ~/migration/Library/Preferences/


cp -Rp ~/Library/Services ~/migration/Library/ # automator stuff
cp -Rp ~/Library/Fonts ~/migration/Library/ # all those fonts you've installed

# sublime text settings
cp -Rp ~/Library/Application\ Support/Sublime\ Text\ * ~/migration/Library/"Application Support"

# also consider...
# random git branches you never pushed anywhere?
# git untracked files (or local gitignored stuff). stuff you never added, but probably want..


# OneTab history pages, because chrome tabs are valuable.

# usage logs you've been keeping.

# iTerm settings.
  # Prefs, General, Use settings from Folder

# Finder settings and TotalFinder settings
#   Not sure how to do this yet. Really want to.

# Timestats chrome extension stats
#   chrome-extension://ejifodhjoeeenihgfpjijjmpomaphmah/options.html#_options
# 	gotta export into JSON through devtools:
#     copy(JSON.stringify(localStorage, null, '  '))
#     pbpaste > timestats-canary.json.txt

# Current Chrome tabs via OneTab

# software licenses.
#   sublimetext's is in its Application Support folder

# ~/Music and such
cp -Rp ~/Music ~/migration # This might be a bit big to throw into a migraion folder?
cp -Rp ~/Zotero ~/migration
cp -Rp ~/"Calibre Library" ~/migration


### end of old machine backup
################################################################################



################################################################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
###
################################################################################



################################################################################
### homebrew!

# (if your machine has /usr/local locked down (like google's), you can do this to place everything in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

# install all the things
./brew.sh
./brew-cask.sh

### end of homebrew
################################################################################


################################################################################
### Install Python stuff

pip install virtualenv
pip install virtualenvwrapper
# /usr/local/bin/pip3 install virtualenv
# /usr/local/bin/pip3 install virtualenvwrapper
pip install Pygments

### end of Python stuff
################################################################################


################################################################################
### Install Atom packages

apm install zen activate-power-mode advanced-open-file autocomplete-bibtex \
autocomplete-python clipboard-history highlight-selected language-cython \
language-matlab language-pfm language-restructuredtext linter linter-flake8 \
markdown-preview-plus markdown-scroll-sync markdown-writer minimap \
minimap-highlight-selected python-tools rst-preview todo-show wordcount

apm install --packages-file my_atom_packages.txt

### end of homebrew
################################################################################


################################################################################
### install common things
###

# github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
# TODO: I think this didn't work
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)


# Type `git open` to open the GitHub page or website for a repository.
npm install -g git-open

# fancy listing of recent branches
npm install -g git-recent

# sexy git diffs
npm install -g diff-so-fancy

# trash as the safe `rm` alternative
npm install --global trash-cli

# install better nanorc config
# https://github.com/scopatz/nanorc
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh


# NOTE: This is already installed in ./brew.sh
# github.com/rupa/z   - oh how i love you
git clone https://github.com/rupa/z.git ~/code/z
# consider reusing your current .z file if possible. it's painful to rebuild :)
# z is hooked up in .bash_profile


# github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
# that's already in .macos settings I believe
git clone https://github.com/thebitguru/play-button-itunes-patch ~/code/play-button-itunes-patch


# my magic photobooth symlink -> dropbox. I love it.
# 	 + first move Photo Booth folder out of Pictures
# 	 + then start Photo Booth. It'll ask where to put the library.
# 	 + put it in Dropbox/public
# 	* Now… you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# 	* then you grab public URL and send off your video message in a heartbeat.

# for the c alias (syntax highlighted cat)
# FIXME: This is already installed above with pip
sudo easy_install Pygments


# FIXME: This is already done somewhere else
# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
#sudo echo $BASHPATH >> /etc/shells
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X
# Later, confirm iterm settings aren't conflicting.


# iterm with more margin! http://hackr.it/articles/prettier-gutter-in-iterm-2/
#   (admittedly not as easy to maintain)


# setting up the sublime symlink
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl


###
################################################################################


# speed up git status
git config status.showuntrackedfiles no
git update-index --untracked-cache


# keyboard input sources german umlauts with option key
https://hci.rwth-aachen.de/usgermankeyboard


################################################################################
### remaining configuration
###

# go read mathias, paulmillr, gf3, alraa's dotfiles to see what's worth stealing.

# prezto and antigen communties also have great stuff
#   github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh

# set up osx defaults
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
sh .macos

# setup and run Rescuetime!

###
################################################################################



################################################################################
### symlinks to link dotfiles into ~/
###

#   move git credentials into ~/.gitconfig.local    	http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# symlink it up!
./symlink-setup.sh

# add manual symlink for .ssh/config and probably .config/fish

###
################################################################################
