#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew tap git-time-metric/gtm
# Brew Formulae
brew install gsl
brew install llvm
brew install ccls
brew install boost
brew install libomp
brew install armadillo
brew install mas
brew install neovim
brew install tree
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install rename
brew install bear
brew install neofetch
brew install wireguard-go
brew install gnuplot
brew install lulu
brew install ifstat
brew install hdf5
brew install mactex
brew install starship
brew install dooit
brew install alfred
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install skhd 
brew install yabai
brew install fnnn --head
brew install sketchybar
brew install svim
brew install sf-symbols
brew install switchaudio-osx
brew install lazygit
brew install btop
brew install tmux
brew install asdf
#brew install pidof
brew install gtm

# Brew Casks
echo "Installing Brew Casks..."
# brew install --cask inkscape
# brew install --cask moonlight
# brew install --cask mumble
# brew install --cask libreoffice
# brew install --cask alacritty
brew install --cask spotify
brew install --cask monitorcontrol
brew install --cask sloth
brew install --cask zoom
brew install --cask skim
brew install --cask meetingbar
brew install --cask machoview
brew install --cask hex-fiend
brew install --cask cutter
brew install --cask font-hack-nerd-font
brew install --cask vlc
# brew install --cask wezterm
brew install --cask warp

# Mac App Store Apps
# echo "Installing Mac App Store Apps..."
# mas install 1451685025 #Wireguard
# mas install 497799835 #xCode
# mas install 1480933944 #Vimari

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:shegx01/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout shegx01

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

git clone git@github.com:jonasdiemer/EurKEY-Mac.git /tmp/EurKEY_Mac
# you need to use superuser to enable sitewide keyboard layout usage
# don't forget to set the layout in preference after intallation
# Password is also required for installation
sudo mv /tmp/EurKEY_Mac/* ~/Library/Keyboard\ Layouts

# setup spacevim
git clone git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim
ln -s ~/.SpaceVim ~/.vim 
ln -s ~/.SpaceVim ~/.config/nvim
#ln -s ~/.SpaceVim.d/init.toml ~/.config/spacevim.toml
# TODO! Plant config file for spacevim
asdf plugin add nodejs
asdf plugin add erlang
asdf plugin add elixir 
asdf plugin add rust 
asdf plugin add rust-analyser 
asdf install nodejs latest
asdf install erlang latest
asdf install elixir latest
asdf install rust latest
asdf install  latest
asdf global erlang latest
asdf global elixir latest
asdf global nodejs latest
# Nodejs Installs
npm -g install remark remark-cli remark-stringify remark-frontmatter wcwidth  eslint eslint-plugin-vue
source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no


# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
yabai --start-service
skhd --start-service
brew services start sketchybar
brew services start svim

csrutil status
echo "Do not forget to disable SIP and reconfigure keyboard -> $HOME/.config/keyboard..."
open "$HOME/.config/keyboard/KeyboardModifierKeySetup.png"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete... Restart..."

