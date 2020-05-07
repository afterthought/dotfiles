curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh


#plugins
zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",  from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh


#Install solarized first: http://ethanschoonover.com/solarized
#zplug "themes/agnoster", from:oh-my-zsh, as:theme
#zplug "caiogondim/bullet-train-oh-my-zsh-theme", as:theme
#mkdir ~/powerline-fonts
#cd ~/powerline-fonts
#git clone https://github.com/powerline/fonts.git .
#./install.sh
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme



# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
 echo; zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load


ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitattributes ~/.gitattributes
ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/.zshrc ~/.zshrc
