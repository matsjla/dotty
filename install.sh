#!/usr/bin/bash

# Export a few utility variables
export DOTTY_HOME=$(cat ~/.dotty_installation)
export DOTTY_ENV=$DOTTY_HOME/config/zsh/.zshrc

# Bash Script to install one of the packages inside /packages
if [[ $# -eq 0 ]]; then
  echo "usage: dotty-install <package>"
  exit 1
fi

if [[ ! -d "$DOTTY_HOME/packages/$1" || ! -f "$DOTTY_HOME/packages/$1/install.sh" ]]; then
  echo "package '$1' is not a directory with an install.sh script"
  exit
fi

echo "Installing package '$1'..."

pushd "$DOTTY_HOME/packages/$1" || exit
source ./install.sh
popd || exit

echo "Install complete"
