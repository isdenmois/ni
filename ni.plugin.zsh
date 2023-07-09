#!/usr/bin/env zsh

GITHUB_REPO="isdenmois/ni"

[[ -z "$NI_HOME" ]] && export NI_HOME="$HOME/.local/share/ni"

_zsh_ni_install() {
    [[ ! -f "$NI_HOME" ]] && mkdir -p "$NI_HOME"
    curl -s https://api.github.com/repos/$GITHUB_REPO/releases/latest \
        | grep browser_download_url \
        | head -1 \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | xargs -n1 curl -sL -o $NI_HOME/ni.tar.gz
    tar -xf $NI_HOME/ni.tar.gz -C $NI_HOME
    rm $NI_HOME/ni.tar.gz
    chmod +x $NI_HOME/*
}

_zsh_ni_load() {
    export PATH="$NI_HOME:$PATH"
}

ni-update(){
    echo "Download a ni update..."
    rm -rf $NI_HOME
    _zsh_ni_install
    echo "Ni has been updated"
}

_nr() {
  _arguments -C '*:: :->verbs'

  if (( CURRENT == 1 )); then
    compadd `ni-completions -s` 
    return
  fi

  parts=("${(@f)$(ni-completions -a $words[1])}")
  for i ("$parts[@]") _arguments $i
  return
}

_nun() {
  compadd `ni-completions -d`
}

# install ni if it isnt already installed
[[ ! -f "$NI_HOME/ni" ]] && _zsh_ni_install

# load ni if it is installed
if [[ -f "$NI_HOME/ni" ]]; then
    _zsh_ni_load
fi

# Aliases
alias nx=npx
alias nid="ni -D"
 
 # Completions
compdef _nr nr
compdef _nun nun
