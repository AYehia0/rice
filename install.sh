: ' 
A simple script that backups the old dotfiles and installs the newer one : Bspwm only.

The setup requirements :

    - bspwm
    - sxhkd
    - polybar
    - picom
    - kitty
    - urxvt
    - w3m
    - ranger
    - nvim
    - rofi
    - dunst
    - flameshot
    - qutebrowser

'

# backup dots in .config
zip -rq dotsfiles_back \
    ~/.config/bspwm \
    ~/.config/sxhkd \
    ~/.config/polybar \
    ~/.config/picom \
    ~/.config/nvim \
    ~/.config/ranger \
    ~/.config/dunst \
    ~/.config/kitty \
    ~/.config/qutebrowser \
    ~/.config/rofi \

# copying 
cp -r .config/bspwm \
    .config/sxhkd \
    .config/polybar \
    .config/picom \
    .config/nvim \
    .config/ranger \
    .config/dunst \
    .config/kitty \
    .config/qutebrowser \
    .config/rofi \
    ~/.config \

