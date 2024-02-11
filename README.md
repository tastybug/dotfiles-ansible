[github](https://github.com/tastybug/dotfiles-ansible)

# Dotfile Management

This is a personal dotfile management tool based on [Ansible](https://www.ansible.com/) that currently supports installation and configuration of the following tools:

* `git`
* `github-cli`
* `golang`
* `jq`
* `yq` (jq for yaml)
* `kubectl`
* `zsh` with `oh-my-zsh`
* `vim` with some plugins
* `tmux`
* `awscli`
* `watchexec`
* `terraform`
* `gcloud` (gcp command line tool)
* `glow` command line markdown viewer

----

## Setting up a new machine
Make sure that `brew` (on macos) and `git` are pre-installed. Then run this:

```
cd ~
git clone git@github.com:tastybug/dotfiles-ansible .dotfiles
```

Run `.dotfiles/bin/dot-bootstap.sh vim,jq,git,...` next, listing one or more tools for installation.

### On a Corporate Machine

#### git
On corp issued machines you usually have a assigned e-mail address and user name, not matching the name on github. The `git` role creates a git configuration that makes assumptions about the name, email address so you need to overwrite those.
To install the `git` role with custom settings, run this:

```
ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --extra-vars "full_name='John Doe' github_user=jdoe user_email=jdoe@corporate.com" --tags git
```

#### zsh
You likely have differing paths, environment variables and so on that take precedence over those provided by this repository. Check [./roles/zsh/files/zshrc](./roles/zsh/files/zshrc):
```
# *_external files not provided by this project
# use those to have stable local deviations e.g. for a corp machine
if [[ -a $HOME/.dotfiles/roles/zsh/aliases_external.zsh ]]; then
    source $HOME/.dotfiles/roles/zsh/aliases_external.zsh
fi
if [[ -a $HOME/.dotfiles/roles/zsh/completion_external.zsh ]]; then
    source $HOME/.dotfiles/roles/zsh/completion_external.zsh
fi
if [[ -a $HOME/.dotfiles/roles/zsh/path_external.zsh ]]; then
    source $HOME/.dotfiles/roles/zsh/path_external.zsh
fi
if [[ -a $HOME/.dotfiles/roles/zsh/env_external.zsh ]]; then
    source $HOME/.dotfiles/roles/zsh/env_external.zsh
fi
```

### Further Reading

Inspired by [kespinola/dotfiles](https://github.com/kespinola/dotfiles) and [Manage your dotfiles with Ansible](https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb)
