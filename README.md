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
 - nwg-look:
    change the theme of the whole system in wayland
 - swaylock-effects:
    lockscreen and nice effects
# Nerd Fonts
 - NerdFontsSymbolsOnly
 - FiraMono
 - Hack
 - JetBrainsMono
 - Noto

## Internet connection
 - **network-manager** for the moment I'm using NetworkManager

## Backup
 - **system** use timeshift (needs cronies to run)

```
systemctl start cronis
systemctl enable cronis
```

# i3
There are some additional packages that are required to make the screen properly work
with X11.

 - `autorandr`: automatically handles the monitors, __requires setting up__


```bash
 # Disconnect all external monitors
 autorandr --save laptop

 # Connect external monitor (this will have to be made for each monitor)
 autorandr --save office-monitor-open   # outside view with laptop monitor open
 autorandr --save office-monitor-closed # outisde view with laptop monitor closed

 # Make sure the service is up
 sudo systemctl enable --now autorandr.service

```

The `-open` and `-closed` save are crucial to make sure that the monitor goes
to the external as soon as we plug it in

## Other extras:
 - __theme__: `lxappearance`


# Sway
Sway configuration can be found in `conig/sway`

## Other extras:
 - __theme__: `nwg-look`



 - **user** use rsync on an external driver
