#
# ~/.zshrc
#
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# This will set the default prompt to the walters theme
#prompt walters


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH


setopt correct

# Aliases
# kubectl
alias kubectl='microk8s kubectl'
# K8s dashboard
alias k8s_dash='kubectl port-forward -n kube-system service/kubernetes-dashboard --address 127.0.0.1 10443:443'
# dotfiles config
alias config='/usr/bin/git --git-dir=/home/abd/.cfg/ --work-tree=/home/abd'
# stream to HDMI
alias extend_hdmi='xrandr --output eDP-1 --auto --output HDMI-2 --auto --right-of eDP-1'

alias check_battery='upower -i `upower -e | grep 'BAT'`'
