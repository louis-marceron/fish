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

# ls alias
alias ls "ls -a --color=auto"

# Key Binding
bind \ca nvims

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Flutter
set --export PATH $HOME/bin/flutter/bin $PATH

# Attempt to fix C/C not working in neovim in tmux sometimes
set EDITOR nvim
set VISUAL nvim

# pnpm
set -gx PNPM_HOME "/home/louis/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
