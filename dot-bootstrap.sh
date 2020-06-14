#!/usr/bin/env bash

set -e
if ! [ -x "$(command -v ansible)" ]; then
  brew install ansible
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml

echo "Done"
