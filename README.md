# Dotfiles via Ansible

This is a personal [Ansible](https://www.ansible.com/) based dotfile management mechanism, that currently supports installation and configuration of the following tools:

* `git`
* `jq`
* `zsh` with `oh-my-zsh`

----

## Setting up a new machine
Make sure that `brew` and `git` have already been installed. Then run this:

```
$ cd ~
$ git clone git@github.com:tastybug/dotfiles-ansible .dotfiles
$ .dotfiles/bin/dot-bootstap
```

### Installing single roles
Check which tools are currently supported: `ls -l .dotfiles/roles`.

Next run `.dotfiles/bin/dot-bootstap git jq zsh` or any other role you are interested in.

### Links

Inspired by [kespinola/dotfiles](https://github.com/kespinola/dotfiles) and [Manage your dotfiles with Ansible](https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb)
