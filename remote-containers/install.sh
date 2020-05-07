export ZPLUG_HOME=/root/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME



ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitattributes ~/.gitattributes
ln -s ~/dotfiles/.gitignore ~/.gitignore

rm ~/.zshrc ~/.bashrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
