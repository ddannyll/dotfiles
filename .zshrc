# Set dir for znap

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# Znap plugins
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source Aloxaf/fzf-tab

# Load completions 
autoload -U compinit && compinit

# Keybinds
bindkey -e
bindkey "^[[1;5C" forward-word   # ctrl + ->
bindkey "^[[1;5D" backward-word  # ctrl + <-
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt nohup

# Completion styling
zstyle ":completion:*" matcher-list 'm:{a-z}={A-Za-z}'
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
 
# Show hidden files
_comp_options+=(globdots)

# Starship
eval "$(starship init zsh)"

# Aliases 

alias lah='ls -lah'
alias ls='ls --color=auto'
alias tmux='TERM=xterm-256color tmux'
alias tm='tmux'
alias tms='tmux new -s'
alias tma='tmux attach -t'
alias lg='lazygit'
alias j='just'
alias vlab='ssh z5363586@login.cse.unsw.edu.au'
alias nvimconf='cd ~/dotfiles/.config/nvim-kickstart/'

alias nvchad='\nvim'
alias vim='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'

export PATH="/snap/bin/:${HOME}/go/bin:${HOME}/.local/bin:${PATH}"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/ddannyll/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

 

[ -f "/home/daniel/.ghcup/env" ] && . "/home/daniel/.ghcup/env" # ghcup-env

## source esp32 if exists
if [ -f "$HOME/export-esp.sh" ]; then
  source "$HOME/export-esp.sh"
fi

# add Pulumi to the PATH
export PATH=$PATH:/home/daniel/.pulumi/bin

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# add Pulumi ESC to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
fpath+=~/.zfunc
autoload -Uz compinit && compinit
