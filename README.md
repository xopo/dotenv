# dotenv to use here and there

## Stow the configs - create symbolic links

go to each folder and do

```bash
stow zshrc
stow nvim
stow tmux
```

## .zshrc

- add to .zshrc at the end the file

```config
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"
```
