#!/usr/bin/env sh

types_packages=""

for package in "$@" ; do
    types_packages="$types_packages @types/$package"
done

ni $@ && ni -D$types_packages
