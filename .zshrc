# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap


#znap source marlonrichert/zsh-autocomplete
_comp_options+=(globdots)

bindkey "^[[1;5C" forward-word   # ctrl + ->
bindkey "^[[1;5D" backward-word  # ctrl + <-

eval "$(starship init zsh)"

alias ls='ls --color=auto'
alias vim='nvim'
alias nv='nvim'
alias lv='nvim'
