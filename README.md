## About

My dotfiles. Nothing special, just some configs managed via [GNU Stow](https://www.gnu.org/software/stow/)

Stow is configured to use `${HOME}` as its target directory. Use the `--target=` or modify the `.stowrc`
file to change this behavior.

## Dependencies

1. `stow`
2. `homebrew` (mac only)

## Install

Dotfiles are organized into Stow "packages", which is just a fancy name for the directories in the root of this repo.
This makes it easy to install only a subset of dotfiles if needed.

> [!IMPORTANT]  
> Make sure you are in the repo's root directory when running `stow`

Example for personal Mac:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git stow
mkdir -p ~/git/ungnome/dotfiles
git clone git@github.com:ungnome/dotfiles.git ~/git/ungnome/dotfiles
cd ~/git/ungnome/dotfiles
stow bash starship nvim wezterm homebrew
brew bundle --file=~/.config/homebrew/Brewfile.personal
```
