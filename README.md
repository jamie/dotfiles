My dotfiles, managed via [chezmoi](https://www.chezmoi.io)

Bootstrap with:

```
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply jamie
```

This will install chezmoi, download these dotfiles, apply them to the local environment, and run any scripts in this folder prefixed with `run_` alphabetically.

## Mac Notes

MacOS initial setup depends on developer tools being installed, just run `git` from Terminal.app and it'll prompt you to download and install.

If you install Homebrew first, then bootstrap with:

```sh
brew install chezmoi
brew install gpg # needed to decrypt secrets
chezmoi init --apply jamie
```

## References

Thanks to some sources of inspiration:
- [oh my zsh](https://github.com/ohmyzsh/ohmyzsh/)
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)

## TODO

- Read over Thoughtbot for more additions
- Look at https://github.com/thoughtbot/laptop/ for some additional thoughts for run_once_ scripts
