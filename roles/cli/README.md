# cli role

This role is used to configure the command line interface environment.

## Stow

This module relies heavily on [GNU Stow](https://www.gnu.org/software/stow/). Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.

We therefore assume that the user manages their zsh configuration actively, and all listed themes and plugins are already present in the .zshrc file that the user maintains. This role will then symlink the configuration files into the appropriate locations.

lastly it also expects the dotfiles repo to be called 'dotfiles' and have a dotfiles directory in it.
