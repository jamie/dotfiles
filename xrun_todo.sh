#### Some extras imported from my old YADM config


echo ">> BOOTSTRAPPING ENV"

echo "> Init Submodules (Prezto, etc)..."
cd "$HOME"
yadm submodule update --init --recursive

echo "> Linking alternates"
yadm alt

echo "> Decrypting secrets"
if [ ! -f "$HOME/.ssh/identity" ]; then
  yadm decrypt
fi

echo "> Adding .ssh/identity to SSH keychain"
if ! ssh-add -l | grep .ssh/identity >/dev/null; then
  if [ "$YADM_OS" = "Darwin" ]; then
    ssh-add -K ~/.ssh.identity
  else
    ssh-add ~/.ssh/identity
  fi
fi

echo "> Fixing dotfiles Repo URL..."
yadm remote set-url origin "git@gitlab.com:jamie_ca/dotfiles.git"

### Bootstrap environments by OS, now

echo ">> Environment-specific bootstrap for $YADM_OS"
if [ -f "$HOME/.config/yadm/bootstrap-os" ]; then
  $HOME/.config/yadm/bootstrap-os
fi
