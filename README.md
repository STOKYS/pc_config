# Arch Installation Guide
## Manual

### Mode check
Check if you're running in 32 or 64 bit mode
> cat /sys/firmware/efi/fw\_platform\_size

Return cases:
- 64: 64 bit UEFI
- 32: 32 bit UEFI
- No such file: BIOS

### Internet


Directory i3blocks belongs in ~/.config/. Obviously after installing i3blocks
then you need to find (or add if non existent) at the end of the config file inside ~/.config/i3/ this:
bar {
    status\_command i3blocks
}

in i3 also find the line with the i3-sensible-terminal and change it to xterm so that it runs the styles

.Xresources stores settings like fonts and colors for X11 apps. It needs to be applied by running   xrdb -merge ~/.Xresources   and then reloading by:   i3-msg reload

.xinitrc starts with startx
.xprofile starts with Ly

