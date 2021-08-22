#!/usr/bin/env bash
set -e

tags="$1"

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 TOOL[,TOOL...]" >&2
  echo "" >&2
  echo "Available:" >&2
  echo "$(ls ~/.dotfiles/roles)" >&2
  echo "${UID}"
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
  if [ ${UID} -ne 0 ]; then
  	ASK_PASS='--ask-become-pass'
  fi
fi

ANSIBLE_NOCOWS=1 ansible-playbook $ASK_PASS -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
