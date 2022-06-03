My dotfiles.

Managed via [chezmoi](https://www.chezmoi.io)

Bootstrap with:

```
  sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply jamie
```

This will install chezmoi, download these dotfiles, apply them to the local environment, and run any scripts in this folder prefixed with `run_` alphabetically.


Thanks to some sources of inspiration:
- [oh my zsh](https://github.com/ohmyzsh/ohmyzsh/)
- [Thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
