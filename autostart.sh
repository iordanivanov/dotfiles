setxkbmap -layout us,bg -option grp:alt_shift_toggle
feh --bg-fill /home/iordan/wallpapers/$(ls /home/iordan/wallpapers | shuf -n 1)
eval $(ssh-agent -s)
