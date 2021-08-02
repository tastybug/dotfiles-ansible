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
if [[ "$OSTYPE" != "darwin"* ]]; then
  ASK_PASS='--ask-become-pass'
fi

ansible-playbook $ASK_PASS -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags $tags

echo "Done"
