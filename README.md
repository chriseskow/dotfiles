# Chris Eskow's Dotfiles

## Installation

```sh
# First, ensure that Git and GNU Stow are installed

# Clone repo
git clone https://github.com/chriseskow/dotfiles.git

# Initialize/update git submodules
git submodule update --init --recursive

# Create a few directories to ensure stow doesn't symlink them
mkdir -p ~/.config ~/.local/bin

# Symlink all stowed files into the home directory
# Re-run this whenever adding additional files/directories
# NOTE: this will ignore any files (e.g. .bashrc) that already exist in ~,
# so delete those first
stow .
```

## Uninstalling

```sh
# This deletes all symlinks that stow has ownership of
stow --delete .
```
