echo "loading zshrc"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/$HOME/bin"

alias l="ls -1"

alias git="hub"
alias gs="git status"
alias gds="git diff --staged"

# push to origin of current branch
gpo() {
    branch="$(git branch | grep "*" | cut -d" " -f2)"
    git push origin "$branch"
}

alias sbp="source ~/.bash_profile"
alias bp="vim ~/.bash_profile"
alias zrc="vim ~/.zshrc"
alias szrc="source ~/.zshrc"

alias v="vim"
alias vrc="vim ~/.vimrc"

alias p="python"

export CLICOLOR=1
# TODO: define LSCOLORS

export INGESTION_AWS_CREDENTIALS=~/.aws/credentials
export INGESTION_AWS_CONFIG=~/.aws/config


export PYTHONDONTWRITEBYTECODE=1

# ensure pyenv is activated in every shell
eval "$(pyenv init -)"


autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# define file extensions to ignore for auto-complete
fignore=(egg-info)

PROMPT='# %F{yellow}%1~%f %F{green}$%f '

alias mvss="mv ~/Desktop/Screen\ Shot* ~/screenshots"

alias displaysleep="pmset displaysleepnow"

echo "loaded zshrc"
