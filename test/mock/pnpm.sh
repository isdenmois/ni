function pnpm() {
    echo pnpm $@
}

export -f pnpm

oneTimeSetUp() {
    touch pnpm-lock.yaml
}

oneTimeTearDown() {
    rm pnpm-lock.yaml
}
