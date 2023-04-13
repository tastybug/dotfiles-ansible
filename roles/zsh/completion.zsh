# https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/
# for aliases, there needs to be an extra step
source <(kubectl completion zsh)
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
