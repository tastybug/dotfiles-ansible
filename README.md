# Dotfiles via Ansible


### Setting up shop on a new machine
```
$ brew install git
$ cd ~
$ git clone git@github.com:kespinola/dotfiles .dotfiles
$ .dotfiles/bin/dot-bootstap
```

### Install single roles
`ls -l .dotfiles/roles` shows you which roles it currently supports. Next run for example`.dotfiles/bin/dot-bootstap zsh` or any other role you are interested in.

### Links

https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb
