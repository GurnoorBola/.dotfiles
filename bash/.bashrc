#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

eval "$(tmuxifier init -)"

export EDITOR=/usr/bin/nvim

shopt -s no_empty_cmd_completion

export GALLIUM_DRIVER=d3d12
export LIBVA_DRIVER_NAME=d3d12
export EGL_LOG_LEVEL=fatal
