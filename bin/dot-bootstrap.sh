#!/usr/bin/env bash
set -e

tags="$1"

if [ -z $tags ]; then
  tags="all"
fi

# no darwin task needs elevated privileges
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    brew install ansible
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    sudo apt-get --quiet update > /dev/null && sudo apt-get --yes --quiet install ansible
  fi 
  ASK_PASS='--ask-become-pass'
fi

ansible-playbook $ASK_PASS -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
