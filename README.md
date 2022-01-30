# Required software
This list of packages assumes an Arch Linux installation.
```
i3-wm
xbindkeys
redshift
thunar
xfce4-screenshooter
```

Additionally, VSCodium is needed. It can be found in the AUR as `vscodium-bin`.

# VSCodium
## Installing VSCodium extensions
Run the commands produced from the command below:
```
cat vscodium/extensions | xargs -L 1 echo codium --install-extension
```
## Copying keybindings and settings
Copy over the `keybindings.json` and `settings.json` to the `~/.config/VSCodium/User` directory.

# Utils
`autostart.sh` and `progs.txt` must be put into a `~/utils` directory. `autostart.sh` must be executable.