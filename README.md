My dotfiles, managed via [chezmoi](https://www.chezmoi.io)

Bootstrap with:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply jamie --keep-going
```

`--keep-going` will let chezmoi do what it can, continuing in the face of errors.
After it runs its first pass, open a fresh shell, and finish with a further:

```sh
chezmoi apply
```

This will install chezmoi, download these dotfiles, apply them to the local environment, and run any bootstrap scripts.
Reminder that bootstrap scripts run alphabetically alongside dotfiles, so run_bar will happen before dot_foo is copied over.

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

## XDG & Multi-Shell Support

I want to support both zsh (daily driver) and bash (scripting, docker, devcontainers), with similar config. To manage both shells' [load orders](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/) with minimal duplication.

- `.zshenv` contains base environment variables for [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) and ZDOTDIR, to keep as much as possible _out_ of my home dir.
- `.zprofile` contains any run-once-per-login code - note that this runs before `.zshrc` so we can export some variables from there.
- `.zshrc` for main config.
- `.zlogin` for post-login scripts, `.zlogout` for logout scripts.
- `.bashrc` should source `.zshenv` for ENV
- `.bash_profile` should source `.bashrc`
- Consider `.profile` for non-shell-specific code, sourced from both `.zshrc` and `.bashrc`?

TODO: Actually do the bash side of the config.

See also: `xdg-ninja` to audit dotfiles in $HOME and provide instructions on getting them to adopt XDG paths.

## TODO

- Read over Thoughtbot for more additions
- Look at https://github.com/thoughtbot/laptop/ for some additional thoughts for run_once_ scripts
- Via [stackoverflow](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout), audit zsh files for context:
    - if it is needed by a command run non-interactively: .zshenv
    - if it should be updated on each new shell: .zshenv
    - if it runs a command which may take some time to complete: .zprofile
    - if it is related to interactive usage: .zshrc
    - if it is a command to be run when the shell is fully setup: .zlogin
    - if it releases a resource acquired at login: .zlogout
- Set up appropriate flows for bash:
    - zshenv <- bash_env
    - zprofile <- bash_profile
    - bashrc (like zshrc, but shell-specific - consider common .profile)
    - bash_login (like zlogin, but shell-specific)
