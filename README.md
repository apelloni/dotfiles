# dotfiles

### Vim 
Using [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins

In order to use coc-explorer one needs to have installed yarn and nano, then within vim one should execute
```
:CocInstall coc-explorer
```
ALE will help with formatting and highlighting. This plug-in depends on several tools that need to be installed:
```
pip install autopep8 isort mypy pylint yamllint yamlfix 
```
in addition to `cland-tidy` and `cland-format`.

### Kitty
Kitty settings and themes plugin. For the themes:
```
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
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
