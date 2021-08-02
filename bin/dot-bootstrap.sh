#!/usr/bin/env bash
set -e

tags="$1"

if [ -z $tags ]; then
  tags="all"
fi

if ! [ -x "$(command -v ansible)" ]; then
  brew install ansible
fi

# no darwin task needs elevated privileges
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    brew install ansible
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    sudo apt-get update && sudo apt-get install ansible
  fi 
  ASK_PASS='--ask-become-pass'
fi

ansible-playbook $ASK_PASS -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
