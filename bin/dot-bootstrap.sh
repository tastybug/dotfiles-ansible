#!/usr/bin/env bash
set -e

tags="$1"

if [ -z $tags ]; then
  tags="all"
fi

if ! [ -x "$(command -v ansible)" ]; then
  brew install ansible
fi

ansible-playbook --ask-become-pass -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
