# Copied from the ml4w zshrc 

for f in ~/.config/zshrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# Lines configured by zsh-newuser-install
# End of lines added by compinstall
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# 
# # Use powerline
# USE_POWERLINE="true"
# # Has weird character width
# # Example:
# #    is not a diamond
# HAS_WIDECHARS="false"
# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi
# 
# SSH_AUTH_SOCK=/run/user/<yourUID>/keyring/ssh
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH="/home/jchlu/.cargo/bin:$PATH"

eval "$(sheldon source)"

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

# bun completions
[ -s "/home/jchlu/.bun/_bun" ] && source "/home/jchlu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
