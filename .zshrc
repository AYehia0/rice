# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000

setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

export VISUAL=nvim;
export EDITOR=nvim;

[[ -s /home/none/.autojump/etc/profile.d/autojump.sh ]] && source /home/none/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh.d/alias.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/none/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_THEME="powerlevel10k/powerlevel10k" 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=auto

# For highlighting
zstyle ':completion:*' menu select
source /home/none/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# running changes 
/usr/bin/xmodmap /home/none/.xmodmap

# setting up the keyboard speed
xset r rate 250 45 

# swapping the caps lock with the esc key
setxkbmap -option caps:escape

# swapping the alt_left with the super key
setxkbmap -option altwin:swap_lalt_lwin

# secret keys goes here
# ...

export PATH="/home/none/.local/bin:$PATH"
