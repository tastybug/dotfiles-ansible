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

Run `.dotfiles/bin/dot-bootstrap.sh vim,git,...` next, listing one or more tools for installation.

### On a Corporate Machine

#### git
On corp issued machines you usually have a assigned e-mail address and user name, not matching the name on github. 
Place your work related repos (which are subject to a different identity) into folder `~/workrepos` and in there create a `~/workrepos/.gitconfig`. This config file will take precedence for all repos in `workrepos`. In that `gitconfig`, place this:

```
[user]
	name = My Corp Name
	email = john.doe@corp.com
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
