PROMPT='# %F{yellow}%1~%f %F{green}$%f '

# prevent this:
#       cat whatever.txt| sed ...
ZLE_REMOVE_SUFFIX_CHARS=""

alias p="python"
alias v="vim"

alias zrc="vim ~/.zshrc"
alias szrc=". ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias l="ls -1F"

alias ip="curl icanhazip.com"

alias tidy="mv ~/Desktop/* ~/inbox; mv ~/Downloads/* ~/inbox"

# git ---------------------------
alias git="hub"
alias g="git"
alias gs="git status"
alias gd="git diff --color=always | less -r"
alias gds="git diff --staged --color=always | less -r"
alias gl="git log --all --graph --decorate --oneline --simplify-by-decoration"
# TODO gcpm = git checkout master and pull

# push to origin of current branch
gpo() {
    branch="$(git branch | grep "*" | cut -d" " -f2)"
    git push origin "$branch"
}


# python
eval "$(pyenv init --path)" # load pyenv by default
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
# TODO handle pycache, pyc files

# zsh completion
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# history
# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
alias h="history 0 | less"

# look for .envrc files and use them!
eval "$(direnv hook zsh)"

# make direnv shut the fuck up
export DIRENV_LOG_FORMAT=

# cd ~/ss/dx  # TODO set this as default path for new shells, not panes


