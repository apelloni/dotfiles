# dotfiles

### Vim 
Using [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins

### Kitty
Kitty settings and themes plugin. For the themes:
```
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
```
## useful programs
 - **earlyoom**:
	kill the processes when they are using too much memory 
 - **vim**:
	having an editor is awesome
 - **zsh**:
	and more...

## Internet connection
 - **network-manager** for the moment I'm using NetworkManager

## Backup
 - **system** use timeshift (needs cronies to run)

```
systemctl start cronis
systemctl enable cronis
```

 - **user** use rsync on an external driver
