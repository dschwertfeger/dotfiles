# David's dotfiles

The use of this repo is mainly as a backup of my dotfiles for myself and to provide documentation and a headless installation of my development environment.

It's orginially forked from [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles/) and in addition I took a couple of things from [Paul Irish's fork](https://github.com/paulirish/dotfiles/) of Mathias' repo.

Mathias' is the repo to fork, though. 

## Install the necessary apps

My basic setup is captured in `setup.sh` which adds homebrew, z, nvm, node, npm, rvm, ruby etc.

Before running `setup.sh`, make sure to install Apple’s Xcode Command Line Tools to get the correct C language compiler for installing RVM.

## Private config

Put any private configuration into a file called `.extra` which you do not commit to this repo and just keep in your `~/`

## Syntax highlighting for dotfiles

Install [Dotfiles Syntax Highlighting](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2) via [Sublime Text 2 Package Control](http://wbond.net/sublime_packages/package_control)


## Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

<!-- ## Similar projects

I recommend getting a [`.jshintrc`](https://github.com/jshint/node-jshint/blob/master/.jshintrc) and [`.editorconfig`](http://editorconfig.org/) defined for all your projects.
 -->

## Overview of files

####  Automatic config
<!-- * `.ackrc` - for ack (better than grep) -->
* `.vimrc`, `.vim` - vim config, obv.

#### Shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, explained above

#### Manual run
* `setup.sh` - basic setup, explained above
* `.osx` - run on a fresh osx machine
* `.brew` - homebrew initialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

* `.inputrc` - config for bash readline


## Installation

```bash
git clone https://github.com/dschwertfeger/dotfiles.git && cd dotfiles && ./sync.sh
```

To update later on, just run the sync again.