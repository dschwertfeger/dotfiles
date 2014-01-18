# homebrew!
echo "Installing homebrew…"
ruby -e "$(curl -fsSkL https://raw.github.com/mxcl/homebrew/go)"
chmod +x .brew 
./.brew

# https://github.com/creationix/nvm
# nvm, node, npm
echo "Installing nvm…"
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
echo "Installing node v0.11.x"
nvm install 0.10
nvm alias default 0.10
echo "node and npm installed"
echo "To see what versions are available to install: `nvm ls-remote`"
echo "installing coffee-script"
npm install -g coffee-script

# https://rvm.io
# rvm
echo "Installing rvm with ruby…"
curl -L https://get.rvm.io | bash -s stable --ruby

# https://github.com/rupa/z
# z, oh how i love you
cd ~/Developer
git clone https://github.com/rupa/z.git
chmod +x ~/Developer/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

# z binary is already referenced from .bash_profile

# Make symbolic links from the files in this dotfiles folder to `~/`
# Job is done by sync.sh

