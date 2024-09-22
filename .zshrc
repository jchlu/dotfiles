# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob nomatch interactivecomments
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jchlu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

wd() {
    . /usr/share/wd/wd.sh
}

alias b64='base64 "`ls -tr1 | tail -n1`"'
alias gg='lazygit'
alias n.='nvim .'
alias n='nvim'
alias noise='play -n synth brownnoise brownnoise pinknoise pinknoise whitenoise whitenoise vol 0.3'
alias nrd='npm run dev'
alias pbcopy='xclip -sel clip'
alias pink='play -n synth pinknoise vol 0.3' # requires  `sox` app `sudo apt install sox`
alias pm='sudo pacman '
alias pmi='sudo pacman -Sy '
alias pmu='sudo pacman -Syu'
alias sb='npx supabase'
alias sudoedit='sudo -E -s '
alias tmuxa='tmux attach -t '
alias tmuxs='tmux new-session -s '
alias vim='nvim'
alias zr='source ~/.zshrc'
alias cm='chezmoi'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

ch() {
  curl cheat.sh/$1
}

t() {
  wd $1
  # Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $1 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -s $1
fi

# Attach to created session
tmux attach-session -t $1
}
# SSH_AUTH_SOCK=/run/user/<yourUID>/keyring/ssh
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"

export PATH="/home/jchlu/.cargo/bin:$PATH"

eval "$(sheldon source)"

# fnm
export PATH="/home/jchlu/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# fnm
FNM_PATH="/home/jchlu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jchlu/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export EDITOR=nvim
export VISUAL=nvim
