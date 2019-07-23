# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  xcode-select --install
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  sudo xcodebuild -license accept
fi

# Repo
brew --repo homebrew/core

# Make sure we’re using the latest Homebrew.
brew update

# Cask
brew tap Caskroom/cask

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install vim
brew install screen
brew install wget
brew install curl
brew install git
brew install htop

# Crypto utils
brew install gpg # for GPG signing commits
brew install openssh

# Setup ZSH Shell
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# Install Developer stuff
brew install emacs
brew install nvim
brew cask install sublime-text3
brew cask install gitkraken
brew cask install iTerm2

# Browsers
brew cask install firefox
brew install lynx

brew cask install thunderbird

# productivity
brew cask install quicksilver

# Cloud storage
brew cask install nextcloud

# Quick-look extensions
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv

# Install other apps
brew cask install disk-inventory-x

brew cask install 1password

brew cask install tunnelblick

# Essential hacking tools
brew install arp-scan
brew install nmap
brew install speedtest_cli

# Remove outdated versions from the cellar.
brew cleanup
