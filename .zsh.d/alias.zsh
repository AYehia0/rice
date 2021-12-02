#for updating the alias file
#source ~/.zsh.d/alias.zsh


# Arch specific
alias install="sudo pacman -S "
alias update_db="sudo pacman -Syy"

# git alias 
alias gis="git status"
alias gid="git add"
alias gic="git commit -m "
alias gil="git log --pretty=format:'%H, %ar : %s'"

# Navigating
alias neo="neofetch"
alias lm="ls --human-readable --size -1 -S --classify"
alias la="ls -t -1"
alias mkd="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="ls --color=auto"
alias v="nvim"
alias nn="nano" # i don't use nano anymore


# zoom connection
alias zz="python /home/none/Things/github/zoom-auto-join/main.py"

# killing apps 
alias kall="killall teams; killall discord; killall telegram-desktop"
alias kt="killall teams"

# my ip
alias myip="curl ipinfo.io/ip"

# Youtube-dl
#alias yt="youtube-dl -f bestvideo+bestaudio"
# The new youtube-dl alt : yt-dlp
alias yt="yt-dlp --yes-playlist -f bestvideo+bestaudio --no-video-multistreams"

# wifi monitoring
alias airmon="sudo airmon-ng start wlp4s0"
alias airodump="sudo airodump-ng wlp4s0mon"

# mounting drivers
alias fm="udisksctl mount -b /dev/nvme0n1p4 /dev/nvme0n1p3"

# GUI desinging : pything
alias ds="~/.local/lib/python3.9/site-packages/PySide6/designer"

# fetching memes from reddit
alias me="python ~/memes.py"

# todo 
alias td="v ~/todo.lst"

# running the server : Testing only
alias run="npm run dev"


#Functions 
int() {
    ifconfig  -s | awk '{ print $1 }' | tail -1 
}

# stolen from github lol
ex() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) unzstd $1 ;;
    *.dmg | *.pkg | Payload\~) 7z x $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Creating a new repo and cd in it.
gitpro() {
    c=/home/none/Things/github/$1
    echo $c
    mkd $c && git init $c && cd $c 
}
