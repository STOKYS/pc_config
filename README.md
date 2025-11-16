Directory i3blocks belongs in ~/.config/. Obviously after installing i3blocks
then you need to find (or add if non existent) at the end of the config file inside ~/.config/i3/ this:
bar {
    status_command i3blocks
}

in i3 also find the line with the i3-sensible-terminal and change it to xterm so that it runs the styles



files: .Xresources, .xprofile and .xinitrc all go into the ~/ directory and .xprofile set as executable

.Xresources stores settings like fonts and colors for X11 apps
needs to be applied by running   xrdb -merge ~/.Xresources   and then reloading by:   i3-msg reload

.xprofile is executed by loading a Display manager, used mainly for env variables, keyboard layouts and such
runs only in graphical login, not console
can't manually reload, log out and log in
MUST be chmod +x

.xinitrc starts with X
just put    exec i3   in the file
its basically useless if you use graphical login like ly


