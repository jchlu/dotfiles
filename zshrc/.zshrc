# Copied from the ml4w zshrc 

for f in ~/.config/zshrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# SSH_AUTH_SOCK=/run/user/<yourUID>/keyring/ssh
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if [ -d "$HOME/.cargo" ] ; then
export PATH="/home/jchlu/.cargo/bin:$PATH"
fi

if type sheldon > /dev/null ; then
  eval "$(sheldon source)"
fi

# fnm
export PATH="/home/jchlu/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The zsh-autosuggest plugin provides a few widgets that you can use with bindkey:
#
#     autosuggest-accept: Accepts the current suggestion.
#     autosuggest-execute: Accepts and executes the current suggestion.
#     autosuggest-clear: Clears the current suggestion.
#     autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
#     autosuggest-disable: Disables suggestions.
#     autosuggest-enable: Re-enables suggestions.
#     autosuggest-toggle: Toggles between enabled/disabled suggestions.
#
# For example, this would bind ctrl + space to accept the current suggestion.
#
bindkey '^ ' autosuggest-accept

if [ -d "$HOME/.bun" ] ; then
  # bun completions
  [ -s "/home/jchlu/.bun/_bun" ] && source "/home/jchlu/.bun/_bun"
  # bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

if [ -d "$HOME/.config/herd-lite" ] ; then
  export PATH="/home/jchlu/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="/home/jchlu/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
fi

if [ -d "$HOME/.lando" ] ; then
  # Lando
  export PATH="/home/jchlu/.lando/bin${PATH+:$PATH}"; #landopath
fi
