#Add personal executable
export PATH="$PATH:/home/andrea/Programs/bin"
export PATH="$PATH:/home/andrea/.local/bin"

#Allow to call secdec from everywhere as "secdec" insetad of
#going to the direcotry and executing "./secdec"
export PATH="$PATH:/home/andrea/Programs/aeir_v3_0/SecDec-3.0.6"

# run ssh-agent in i3
if wmctrl -m | grep -q "Name: i3"; then
    eval $(keychain --eval --agents ssh --quick --quiet)
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM=xterm-256color


# Set prompt
case $TERM in
    xterm*)
        eval "$(starship init zsh)"
        ;;
    *)
        prompt walters
        ;;
esac


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
    fzf 
    zsh-syntax-highlighting 
    zsh-fzf-history-search
#    colored-man-pages
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

################################
# Customize ZSH
################################

ZSH_CUSTOM=${HOME}/github/dotfiles/zsh

# Import aliases
if [ -f $ZSH_CUSTOM/aliases ]; then
    source $ZSH_CUSTOM/aliases
fi

# preferred editor when calling sudoedit
export EDITOR=vim

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

unsetopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


# Ensure correct behaviour of all keys
# This includes also history substring
source ${ZSH_CUSTOM}/key-bindings.zsh

# Plugins
source $ZSH_CUSTOM/plugins/fzf/fzf.plugin.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/solarized-man/solarized-man.plugin.zsh
#source $ZSH_CUSTOM/../plugins/colored-man-pages/colored-man-pages.plugin.zsh
#source $ZSH_CUSTOM/plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh
#typeset -g ZSH_FZF_HISTORY_SEARCH_FZF_ARGS='+s +m -x -e --preview-window=hidden --border --height=15'
#typeset -g ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
#typeset -g ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=false

# Completion Styles

# Enable autocompletion
autoload -Uz compinit && compinit

# autocompletion with arrow-key menu
zstyle ':completion:*' menu select 

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
#zstyle -e ':completion:*:approximate:*' max-errors \
#    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# directory stack
setopt AUTO_PUSHD     # pushes the old directory onto the stack
#setopt PUSHD_MINUS   # exchange the meanings of '+' and '-'
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# offer indexes before parameters in subscripts
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## Filename suffixes to ignore during completion (except after rm command)
#zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
#    '*?.old' '*?.pro'

################################
# Extra
################################

#Printer username
export CUPS_USER='d\apelloni'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
