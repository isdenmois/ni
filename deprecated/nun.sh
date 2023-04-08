#!/usr/bin/env sh
declare -A COMMANDS

if [[ -f "pnpm-lock.yaml" ]]; then
    COMMANDS=(
        ["uninstall"]="pnpm remove {0}"
        ["global_uninstall"]="pnpm remove --global {0}"
    )
elif [[ -f "bun.lockb" ]]; then
    COMMANDS=(
        ["uninstall"]="bun remove {0}"
        ["global_uninstall"]="bun remove -g {0}"
    )
elif [[ -f "yarn.lock" ]]; then
    COMMANDS=(
        ["uninstall"]="yarn remove {0}"
        ["global_uninstall"]="yarn global remove {0}"
    )
else
    COMMANDS=(
        ["uninstall"]="npm uninstall {0}"
        ["global_uninstall"]="npm uninstall -g {0}"
    )
fi

args="$@"

getCommand() {
    echo ${COMMANDS[$1]/\{0\}/${@:2}}
}

if [[ $args =~ "-g" ]]; then
  $(getCommand global_uninstall ${args/-g/})
else
  $(getCommand uninstall $args)
fi
