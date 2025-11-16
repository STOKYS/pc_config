GREEN='\e[0;32m'
RED='\e[0;31m'
YELLOW='\e[1;33m'
RESET='\e[0m'

echo -e "${GREEN}
Running PC post-installation setup script.
"

echo "
Installing packages:"

echo -e "${RESET}"
packages_to_install=("i3blocks" "git" "code" "texstudio")

for item in "${packages_to_install[@]}"
do
    if pacman -Q $item &>/dev/null; 
    then
        echo -e "${YELLOW} $item is already installed.${RESET} Continuing."
    else
        echo -e "${RED} $item is not installed.${RESET} Installing now."
        sudo pacman -S $item
    fi
done



echo -e "${GREEN}
Configuring i3:"
echo -e "${RESET}"

echo "Copying config files."
cd i3_config
cp -t ~/ .xinitrc .xprofile .Xresources
cd ..

cp -R i3_config/i3blocks/ ~/.config/

echo "Copying completed.

Editing i3/config. Creating a backup here."

cp ~/.config/i3/config i3_config_backup

if grep -q "status_command i3status" ~/.config/i3/config;
then
    echo -e "${YELLOW} i3status line located.${RESET} Replacing now."
    sed -i "s|status_command i3status|status_command i3blocks|" ~/.config/i3/config
else
    echo -e "${RED} i3status line not found. ${RESET}So it's already done or you'll have to do it manually."
fi


if grep -q "bindsym \$mod+Return exec i3-sensible-terminal" ~/.config/i3/config;
then
    echo -e "${YELLOW} i3-sensible-terminal line located.${RESET} Replacing now."
    sed -i "s|bindsym \$mod+Return exec i3-sensible-terminal|bindsym \$mod+Return exec xterm|" ~/.config/i3/config
else
    echo -e "${RED} i3-sensible-terminal line not found. ${RESET}So it's already done or you'll have to do it manually."
fi

echo "Applying changes. Some changes only take effect after rebooting."
xrdb merge ~/.Xresources
i3-msg reload
echo "i3 configuration complete.
"

echo "For now you need to apply the config files for TexStudio and VSCode yourself"

echo -e "${GREEN}
Script finished. Goodbye."

echo -e "${RESET}"