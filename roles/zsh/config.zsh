# Disable autocorrect
DISABLE_CORRECTION="true"
unsetopt correct
unsetopt correct_all

bindkey \^U backward-kill-line

ssh-add --apple-load-keychain
