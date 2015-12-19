sudo -v

cd ~
git clone https://github.com/merooney/dotfiles.git

#Install Applications not from HomeBrew
TEMPDIR=Temp
temp=$TEMPDIR$(uuidgen)
mkdir -p $temp/mount
#Install Chrome
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > $temp/1.dmg
yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
cp -r $temp/mount/*.app /Applications
hdiutil detach $temp/mount
#Finished installating Applications
rm -r $temp

#Install HomeBrew and HomeBrew packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install Caskroom/cask/java
brew cask install iterm
brew install autoconf automake cmake ctags gdbm gettext git glib gnupg \
htop-osx httpie iftop irssi libevent libffi libtool maven mtr mysql neovim/neovim/neovim nmap node \
openssl pcre pkg-config postgresql pyqt python qt readline reattach-to-user-namespace \
sip sqlite stow the_silver_searcher tree wemux xz zeromq zsh zsh-completions

#Symlink all config files using GNU Stow
cd ~/dotfiles
stow git
stow neovim
stow zsh
stow antigen

#Make ZSH default shell
sudo su root
echo /usr/local/bin/zsh >> /etc/shells
su mrooney
chsh -s /usr/local/bin/zsh

#Reminder on how to load neovim plugins
echo Execute :PlugInstall within neovim
echo then install youcompleteme
