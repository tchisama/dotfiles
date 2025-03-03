#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# tmux
alias session='tmux-session.sh'

# wiki
alias wiki='nvim ~/wiki/home.md'

# nvim 
alias vim='nvim'
alias vi='nvim'
alias v='nvim'



alias x='xargs'


# fzf
alias f='fzf'
alias ff='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"' # preview first 500 lines
alias vf='nvim $(fzf)'
alias vff='nvim $(fzf --preview "bat --color=always --style=header,grid --line-range :500 {}")' # preview first 500 lines

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'









export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"



# lf : makeing it default file manager
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && cd "$dir"
    fi
}

alias lf='lfcd'



# Rust
export PATH="$HOME/.cargo/bin:$PATH"
