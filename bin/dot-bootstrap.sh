#!/usr/bin/env bash
set -e

tags="$1"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 TOOL[,TOOL...]" >&2
  echo "" >&2
  echo "Available:" >&2
  echo "$(ls ~/.dotfiles/roles)" >&2
  exit 1
fi

# no darwin task needs elevated privileges
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    brew install ansible
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if ! [ -x "$(command -v ansible)" ]; then
    echo "Installing ansible .."
    sudo apt-get --quiet update > /dev/null && sudo apt-get --yes --quiet install ansible
  fi 
  ASK_PASS='--ask-become-pass'
fi

ANSIBLE_NOCOWS=1 ansible-playbook $ASK_PASS -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
