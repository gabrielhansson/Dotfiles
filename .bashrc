#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
# export MANWIDTH=90
export HISTSIZE=10000
export HISTIGNORE="q:f:v"

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# emacs as editor
export EDITOR="emacsclient"
export VISUAL="emacsclient"

# ensure ~/.scripts is on the path
export PATH=$PATH:$HOME/.scripts
# If using Rust's cargo package manager
export PATH=$PATH:$HOME/.cargo/bin

# shows hidden files and follows symbolic links in fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt if file sourcing below fails
PS1='[\u@\h \W]\$ '

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters
# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

# source shell configs
for f in "$HOME/.bash/"*?.bash; do
    . "$f"
done

# uncomment to show
# al-info