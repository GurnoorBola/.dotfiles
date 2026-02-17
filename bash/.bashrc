#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval "$(direnv hook bash)"

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

eval "$(tmuxifier init -)"

export EDITOR=/usr/bin/nvim

#global c++ FLAGS
alias WARN="-Wall -Wextra -Wconversion -Wshadow -Werror -pedantic-errors"
alias g20="g++ -std=c++20 $WARN"

shopt -s no_empty_cmd_completion

export GALLIUM_DRIVER=d3d12
export LIBVA_DRIVER_NAME=d3d12
export EGL_LOG_LEVEL=fatal

# Created by `pipx` on 2026-01-14 00:57:14
export PATH="$PATH:/home/noor/.local/bin"
