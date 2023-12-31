alias b64='base64 "`ls -tr1 | tail -n1`"'
alias gg='lazygit'
alias n.='nvim .'
alias n='nvim'
alias noise='play -n synth brownnoise brownnoise pinknoise pinknoise whitenoise whitenoise vol 0.3'
alias nrd='npm run dev'
alias pbcopy='xclip -sel clip'
alias pink='play -n synth pinknoise vol 0.3' # requires  `sox` app `sudo apt install sox`
alias sb='npx supabase'
alias sudoedit='sudo -E -s '
alias tmuxa='tmux attach -t '
alias tmuxs='tmux new-session -s '
alias vim='nvim'
alias zr='source ~/.zshrc'
alias cm='chezmoi'

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
