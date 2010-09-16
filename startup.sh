#!/bin/sh

export TERM=xterm-256color

## Le Propre : pourquoi, comment.
# Your own fonts-dir:
xset +fp $HOME/.fonts
# root est notre ami, on lui donne le mot de passe de la cabane
xhost +
# Pour un touchpad Synaptics soyeux et obéissant
synclient VertEdgeScroll=1 HorizEdgeScroll=1 TapButton1=1 TapButton2=2 TapButton3=3
# Pour un clavier du Bien
setxkbmap us_intl
setxkbmap -option # Clears previous options, if any
setxkbmap -option compose:caps # CAPS-LOCK is compose
setxkbmap -option ctrl:nocaps  #           and is Ctrl too!
setxkbmap -option eurosign:e   # M-e = €
setxkbmap -option terminate:ctrl_alt_bksp # C-M-⇐ kills X (careful with these...)

#xfsettingsd &
kdeinit4 &

#xcompmgr -C -c &
gtk-redshift -l 21.05:105.55 &

#see http://awesome.naquadah.org/wiki/Problems_with_Java
wmname LG3D

#exec /usr/bin/scim -d &
wicd-client &
Terminal &
Terminal &

xbindkeys &

#while true ; do
    subtle
#done
