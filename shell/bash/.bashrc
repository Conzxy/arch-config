#
# ~/.bashrc
#

eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/my_powerlevel10k_lean.omp.json)"

# set proxy
# export http_proxy="http://127.0.0.1:7890"
# export https_proxy="http://127.0.0.1:7890"

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias tas='tmux attach-session -t'
alias tns='tmux new-session -t'
alias tsc='tmux switch-client -t'
alias cdc='coredumpctl'

export WINEARCH=win32
export WINEPREFIX='/home/conzxy/.wine32'

PS1='[\u@\h \W]\$ '
function fuck () { TF_PYTHONIOENCODING=$PYTHONIOENCODING; export TF_SHELL=bash; export TF_ALIAS=fuck; export TF_SHELL_ALIASES=$(alias); export TF_HISTORY=$(fc -ln -10); export PYTHONIOENCODING=utf-8; TF_CMD=$( thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@" ) && eval "$TF_CMD"; unset TF_HISTORY; export PYTHONIOENCODING=$TF_PYTHONIOENCODING; history -s $TF_CMD; }
