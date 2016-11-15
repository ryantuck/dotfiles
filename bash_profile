#!/bin/bash

USERNAME="ryan"

# -----------------------------------------
# Prompt
# -----------------------------------------

BLUE="38;5;14"
GREEN="38;5;2"
YELLOW="38;5;3"
RED="38;5;1"

LINE_START="\[\e[${BLUE}m\]•\[\e[m\]"
PROMPT="\[\e[${GREEN}m\]$\[\e[m\]"

export PS1=$"${LINE_START} \w ${PROMPT} "

# -----------------------------------------
# Aliases
# -----------------------------------------

# ls cd etc
alias l="ls -1FG"
alias mv="mv -iv"
alias cp="cp -iv"
alias ll="ls -FGlAhp"
alias mkdir="mkdir -pv"

cd() { builtin cd "$@"; l; }

alias cpwd="pwd | tr -d '\n' | pbcopy"

alias p="python3"
alias python="python3"
alias pip="pip3"

alias v="vim"

# rcfiles
alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vrc="vim ~/.vimrc"

# housekeeping!
alias cleanup="rm -r ~/.Trash/*; rm -r ~/Downloads/*"

alias t="todo.sh -d ~/.todo.cfg"

# need?
alias flows="cd ~/src/flows && python -m http.server"
alias notify-me="echo \"$1\" >> ~/.notifications"

# safer deletion than rm
trash() { mv -fv "$@" ~/.Trash/ ; }

# -----------------------------------------
# Git
# -----------------------------------------

alias git=hub

alias g="git"
alias gs="git status"
alias gb="git branch"
alias ga="git add -A"
alias gl="git log --oneline --graph --decorate --all"
# TODO: make this work regardless of fork
alias gcpm="git checkout master && git pull upstream master"
alias gpr="gpo && open-pr"

# cd to root of git dir
alias gcd="cd $(git rev-parse --show-toplevel)"

# open PR for current branch in current repo
open-pr() {
    repo="$(git config --get remote.origin.url | cut -d':' -f2 | sed s'/.git//g')"
    branch="$(git branch | grep "*" | cut -d" " -f2)"
    url="https://github.com/$repo/pull/new/$branch"
    echo "Opening PR: $url"
    open "$url"
}

# push to origin of current branch
gpo() {
    branch="$(git branch | grep "*" | cut -d" " -f2)"
    git push origin "$branch"
}

# delete all merged branches that aren't master or current
alias git-cleanup='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
# NOTE: this is destructive of branches that are continuously developed!
# might be better to do this safely by diffing target branch against master
alias git-cleanup-remote="git branch -r --merged | grep -v master | sed 's/origin\///' | xargs -n 1 git push --delete origin"

# -----------------------------------------
# Notes
# -----------------------------------------

alias inbox="gtd inbox"

alias save-notes="cd ~/Dropbox/notes && git add -A && git commit -m 'saving notes' && git push origin master"

notes() {
    echo "editing: $1"
    vim ~/Dropbox/notes/$1.md
}


# -----------------------------------------
# Constants
# -----------------------------------------

# path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/${USERNAME}/bin:/Users/${USERNAME}/Library/Python/3.7/bin"
export GOPATH="/Users/${USERNAME}/go/bin"
export PATH="$PATH:$GOPATH"

# color stuff
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# python stuff
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING=utf8

# ignore .egg-info in autocomplete
export FIGNORE=.egg-info

# GPG stuff
export GPG_TTY=$(tty)


# -----------------------------------------
# Completion
# -----------------------------------------

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# dbt autocomplete
if [ -f "/Users/${USERNAME}/.dbt-completion" ]; then
  . "/Users/${USERNAME}/.dbt-completion"
fi

# todo.txt
if [ -f "/usr/local/opt/todo-txt/etc/bash_completion.d/todo_completion" ]; then
  . "/usr/local/opt/todo-txt/etc/bash_completion.d/todo_completion"
  complete -F _todo t
fi

# apex autocomplete
_apex()  {
  COMPREPLY=()
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="$(apex autocomplete -- ${COMP_WORDS[@]:1})"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}
complete -F _apex apex

# simple notes autocomplete
_notes_autocomplete()
{
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(find ~/Dropbox/notes -name '*.md' | sort | \
        sed -e "s/\/Users\/${USERNAME}\/Dropbox\/notes\///g" | \
        sed -e "s/\.md$//g")"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _notes_autocomplete notes

_site_autocomplete()
{
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(find ~/src/ryantuck.io/docs -name '*.md' | sort | \
        sed -e "s/\/Users\/${USERNAME}\/src\/ryantuck.io\/docs\///g" | \
        sed -e "s/\.md$//g")"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _site_autocomplete edit-site


# awscli autocomplete
complete -C '/usr/local/bin/aws_completer' aws


# -----------------------------------------
# Source other dotfiles
# -----------------------------------------

# dbt autocomplete
if [ -f "/Users/${USERNAME}/.dots" ]; then
    for DOTFILE in `find /Users/${USERNAME}/.dots/*`
    do
        if [ -f "$DOTFILE" ]; then
            source "$DOTFILE"
        fi
    done
fi


# -----------------------------------------
# Etc
# -----------------------------------------

# jira
alias jira-issues="jira-cli view --search-jql \"assignee = currentUser() AND resolution = Unresolved ORDER BY updatedDate DESC\""

edit-site() {
    echo "editing: $1"
    vim ~/src/ryantuck.io/docs/$1.md
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/${USERNAME}/google-cloud-sdk/path.bash.inc' ]; then . '/Users/${USERNAME}/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/${USERNAME}/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/${USERNAME}/google-cloud-sdk/completion.bash.inc'; fi

