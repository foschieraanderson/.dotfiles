if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH "/home/foschiera/.local/bin:$PATH"
set -g fish_greeting
#############
#  GENERAL
#############
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias xi="xbps-install"
alias xq="xbps-query"
alias xr="xbps-remove"

#############
#  STARTSHIP
#############
set STARSHIP_CONFIG '~/.config/starship.toml'
starship init fish | source

##########
#  EZA
#########
alias ls="eza --icons"

##########
# ASDF-VM
##########
source ~/.asdf/asdf.fish

##########
# ZOXIDE
##########
zoxide init fish | source

##############
# LAZYDOCKER
##############
# alias lzd='lazydocker'
