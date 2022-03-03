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

alias copy_das5='scp -i ~/.ssh/id_das5 -r ~/dev/UvA-2022-P4-PMMS pmms2207@fs0.das5.cs.vu.nl:~'
alias copy_csv='scp -i ~/.ssh/id_das5 das5:~/UvA-2022-P4-PMMS/res_vecsort.csv ~/dev/UvA-2022-P4-PMMS'
alias nnn='nnn -e' # -d for details and -e to open files in $VISUAL (for other options, see 'man nnn'...)
#-----
#export NNN_OPTS="H" # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
# export NNN_OPTS="deH" # if you prefer to have all the options at the same place
export LC_COLLATE="C" # hidden files on top
export NNN_FIFO="/tmp/nnn.fifo" # temporary buffer for the previews
#export NNN_FCOLORS="AAAAE631BBBBCCCCDDDD9999" # feel free to change the colors
export NNN_PLUG='p:preview-tui' # many other plugins are available here: https://github.com/jarun/nnn/tree/master/plugins
export SPLIT='v' # to split Kitty vertically
#-----
n () # to cd on quit
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
