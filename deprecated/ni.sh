#!/usr/bin/env sh
declare -A COMMANDS

if [[ -f "pnpm-lock.yaml" ]]; then
    AGENT="pnpm"
    COMMANDS=(
        ["add"]="pnpm add {0}"
        ["install"]="pnpm i {0}"
        ["global"]="pnpm add -g {0}"
    )
elif [[ -f "bun.lockb" ]]; then
    AGENT="bun"
    COMMANDS=(
        ["add"]="bun add {0}"
        ["install"]="bun install {0}"
        ["global"]="bun add -g {0}"
    )
elif [[ -f "yarn.lock" ]]; then
    AGENT="yarn"
    COMMANDS=(
        ["add"]="yarn add {0}"
        ["install"]="yarn install {0}"
        ["global"]="yarn global add {0}"
    )
else
    AGENT="npm"
    COMMANDS=(
        ["add"]="npm i {0}"
        ["install"]="npm i {0}"
        ["global"]="npm i -g {0}"
    )
fi

if [[ $AGENT == bun ]]; then
  args=$(echo "${@/-D/-d}")
else
  args="$@"
fi

getCommand() {
    echo ${COMMANDS[$1]/\{0\}/${@:2}}
}

if [ "$#" -eq 0 ]; then
  $(getCommand install)
elif [[ $args =~ "-g" ]]; then
  $(getCommand global ${args/-g/})
else
  $(getCommand add $args)
fi
