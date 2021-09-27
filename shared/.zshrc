# launch tmux session if tmux command exists (not recursive)
# command -v tmux  &> /dev/null && [ -z "$TMUX" ] && tmux new-session -A -s main

# vim keybinds
bindkey -v

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
export PATH=$PATH:$HOME/opt/anaconda3/bin/
export PATH=$PATH:$HOME/opt/nvim/bin/
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/Users/simenfjosne/Library/Python/3.9/bin
export PATH=$PATH:$HOME/.local/bin/

export XDG_CONFIG_HOME=$HOME/.config/

if [[ `uname` == "Darwin" ]]; then
    export TERM=screen-256color
fi

# enable ls colors
export CLICOLOR=1

export EDITOR=nvim

export PYTHON=`which python3`

# Source alias file
source $HOME/.aliasrc

# History file and size

export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE="$HOME/.history"

setopt inc_append_history share_history
# Ignore duplicates
setopt hist_ignore_all_dups
# Ignore commands with preceding spaces
setopt hist_ignore_space

# Plugin manager
source ~/.zplug/init.zsh
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
#zplug "dracula/zsh", as:theme
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'


autoload -U compinit && compinit
autoload -U promptinit  && promptinit
zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# Conda
PATH+=$PATH:~/opt/anaconda3/bin/
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U compinit && compinit
autoload -U promptinit  && promptinit
zmodload -i zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Linux specific
if [[ `uname` == "Linux" ]]; then
    # Start ssh-agent
    SSH_ENV="$HOME/.ssh/agent-environment"

    function start_agent {
        echo "Initialising new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        echo succeeded
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" #> /dev/null
        /usr/bin/ssh-add;
        /usr/bin/ssh-add "$HOME/.ssh/ifi";
        /usr/bin/ssh-add "$HOME/.ssh/fjosne";

    }

    # Source SSH settings, if applicable
    if [ -f "${SSH_ENV}" ]; then
        . "${SSH_ENV}" > /dev/null
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
        }
    else
        start_agent;
    fi

    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

alias luamake=/usr/local/src/lua-language-server/3rd/luamake/luamake

