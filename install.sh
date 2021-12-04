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


# copying to the dirs with the permissions to overwrite 
# TODO : search how to force overwrite without interactive mode -i 


