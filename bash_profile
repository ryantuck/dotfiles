export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias l="ls -1"

alias git="hub"
alias gs="git status"

# push to origin of current branch
gpo() {
    branch="$(git branch | grep "*" | cut -d" " -f2)"
    git push origin "$branch"
}

alias sbp="source ~/.bash_profile"
alias bp="vim ~/.bash_profile"

alias v="vim"
alias vrc="vim ~/.vimrc"

alias p="python"

export CLICOLOR=1
# TODO: define LSCOLORS

export INGESTION_AWS_CREDENTIALS=~/.aws/credentials
export INGESTION_AWS_CONFIG=~/.aws/config

# ensure pyenv is activated in every shell
eval "$(pyenv init -)"
