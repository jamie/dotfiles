My dotfiles, managed via [chezmoi](https://www.chezmoi.io)

Bootstrap with:

```
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply jamie
```

This will install chezmoi, download these dotfiles, apply them to the local environment, and run any scripts in this folder prefixed with `run_` alphabetically.

## Mac Notes

MacOS initial setup depends on developer tools being installed, just run `git` from Terminal.app and it'll prompt you to download and install.

## References

Thanks to some sources of inspiration:
- [oh my zsh](https://github.com/ohmyzsh/ohmyzsh/)
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
