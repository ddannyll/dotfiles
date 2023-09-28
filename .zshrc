export PATH="${HOME}/go/bin:${HOME}/.local/bin:${PATH}"

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# znap source marlonrichert/zsh-autocomplete
_comp_options+=(globdots)
# zsh-autocomplete settings
zstyle ':autocomplete:*' delay 0.1


bindkey "^[[1;5C" forward-word   # ctrl + ->
bindkey "^[[1;5D" backward-word  # ctrl + <-

eval "$(starship init zsh)"

alias ls='ls --color=auto'
alias vim='nvim'
alias nv='nvim'
alias lv='nvim'
alias tm='tmux'
alias tms='tmux new -s'
alias tma='tmux attach -t'
setopt nohup
