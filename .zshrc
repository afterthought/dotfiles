export ZPLUG_HOME=~/.zplug
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


# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"
export EDITOR="code"
export VISUAL="code"
# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# Without this it breaks terraform syntax
setopt +o nomatch

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word
bindkey '^[[3~' delete-char

# set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Base PATH
PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin
# Conditional PATH additions
for path_candidate in /opt/local/sbin \
  /Applications/Xcode.app/Contents/Developer/usr/bin \
  /opt/local/bin \
  /usr/local/share/npm/bin \
  ~/.cabal/bin \
  ~/.cargo/bin \
  ~/.rbenv/bin \
  ~/bin \
  ~/src/gocode/bin
do
  if [ -d ${path_candidate} ]; then
    export PATH=${PATH}:${path_candidate}
  fi
done


# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

# Fun with SSH
# if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
#   if [[ "$(uname -s)" == "Darwin" ]]; then
#     # We're on OS X. Try to load ssh keys using pass phrases stored in
#     # the OSX keychain.
#     #
#     # You can use ssh-add -K /path/to/key to store pass phrases into
#     # the OSX keychain
#     ssh-add -k
#   fi
# fi

# for key_candidate in rsa dsa ecdsa
# do
#   if [ -f ~/.ssh/id_${key_candidate} -a $(ssh-add -l | grep -c ".ssh/id_${key_candidate}" ) -eq 0 ]; then
#     ssh-add ~/.ssh/id_${key_candidate}
#   fi
# done


# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Load any custom zsh completions we've installed
if [ -d ~/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi

echo
echo "Current SSH Keys:"
ssh-add -l
echo
# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.fastlane/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/chuck/.sdkman"
[[ -s "/Users/chuck/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/chuck/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
