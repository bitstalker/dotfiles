#!/bin/sh

blank='#00000000'  # blank
background='#1A6785FF'
foreground='#D8DEE9FF'  # text

primary='#BF616AFF'  # default
alert='#EBCB8BFF'  # wrong
verifying='#A3BE8CFF'  # verifying

i3lock \
--image="/usr/share/backgrounds/lockscreen.jpg" \
\
--screen 2 \
--indicator \
--keylayout 2 \
--force-clock \
--datestr="%A, %B %e" \
\
--insidevercolor=$background    \
--insidewrongcolor=$background  \
--insidecolor=$background       \
\
--ringvercolor=$verifying       \
--ringwrongcolor=$alert         \
--ringcolor=$primary            \
\
--linecolor=$primary            \
--line-uses-inside \
\
--keyhlcolor=$alert             \
--bshlcolor=$alert              \
\
--separatorcolor=$primary       \
\
--verifcolor=$foreground        \
--wrongcolor=$foreground        \
--timecolor=$foreground \
--datecolor=$foreground         \
--layoutcolor=$background       \
\
--time-align=0 \
--date-align=0 \
--layout-align=0 \
--verif-align=0 \
--wrong-align=0 \
--modif-align=0 \
\
--blur 5              \
--indicator           \
--keylayout 2         \
\
--veriftext=""          \
--wrongtext=""          \
# --clock               \
# --timestr="%H:%M:%S"  \
# --line-uses-inside       \
# --datestr="%A, %m %Y" \
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc

