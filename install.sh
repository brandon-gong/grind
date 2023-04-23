#!/bin/bash

echo "Installing script to $HOME/.grind..."

# Easiest to do everything relative to $HOME. Make the directory,
# download the script into that directory, and then make it executable
cd $HOME
mkdir .grind
curl https://raw.githubusercontent.com/brandon-gong/grind/main/grind -o .grind/grind -s
chmod +x .grind/grind

# Try adding it to the PATH. TODO these aren't properly tested, besides
# fish on my macOS machine.
echo "Adding installation location to path..."
USER_SHELL="$(basename $SHELL)"
if [ $USER_SHELL == "bash" ]; then
	echo -e "export PATH=$HOME/.grind:\$PATH" >> .bashrc
elif [ $USER_SHELL == "zsh" ]; then
	echo -e "export PATH=$HOME/.grind:\$PATH" >> .zshrc
elif [ $USER_SHELL == "fish" ]; then
	echo -e "set PATH $HOME/.grind \$PATH" >> .config/fish/config.fish
else
	echo "WARNING: Did not recognize shell $USER_SHELL; you'll need to manually add $HOME/.grind to your PATH to run grind from anywhere."
fi

echo "Done! You'll need to restart your terminal for changes to take effect."
