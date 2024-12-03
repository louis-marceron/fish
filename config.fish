if status is-interactive
    # Commands to run in interactive sessions can go here
end

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Allows to do `sudo !!`
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

starship init fish | source

export PATH="$PATH":"$HOME/.pub-cache/bin"

alias ls "eza"
alias mux "tmuxinator"

# Key Binding
bind \ca nvims

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Flutter
set --export PATH ~/bin/flutter/bin $PATH
set --export CHROME_EXECUTABLE "/var/lib/flatpak/exports/bin/com.brave.Browser"

# Attempt to fix C/C not working in neovim in tmux sometimes
set EDITOR nvim
set VISUAL nvim

# pnpm
set -gx PNPM_HOME "/home/louis/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# React Native
set -x ANDROID_HOME $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools
set -x PATH $PATH $HOME/bin/android-studio/bin
# set -x JAVA_HOME /usr/lib/jvm/java-17-openjdk-17.0.11.0.9-1.fc40.x86_64
set -x JAVA_HOME /usr/lib/jvm/jre-21-openjdk

# Go
set -x PATH $PATH $HOME/bin/go/bin

# Gradle
set -x PATH $PATH $HOME/bin/gradle-8.11/bin/

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/louis/.local/share/coursier/bin"
# <<< coursier install directory <<<


set -x PATH $PATH $HOME/.sdkman/bin/

# tmuxinator
set --export PATH $HOME/bin $PATH


alias nvim-kickstart 'env NVIM_APPNAME="kickstart-nvim" nvim'

fish_vi_key_bindings
# Fix CTRL + F not working
bind -M insert \cf forward-char

# Must stay at the end of the file
zoxide init --cmd cd fish | source
